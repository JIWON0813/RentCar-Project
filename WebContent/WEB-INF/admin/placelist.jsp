<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.* , db.*"%>
	
<%List<PlaceDTO> list = (List) request.getAttribute("list"); %>

<script type="text/javascript">
function check(name){
	if(confirm("���� �����Ͻðڽ��ϱ�?") == true){
		<% CarDAO carDao = new CarDAO();
		List<CarDTO> carlist = carDao.carList(); 
		for(CarDTO dto : carlist){%>
		if(<%=dto.getPlace()%> == name){
			alert("�����Ϸ��� ��ҿ� ��ϵǾ��ִ� ������ �ֽ��ϴ�.")
			return;
		}
		<%}%>
		location.href="deleteUser.admin?name="+name;
	}else{
		return;
	}
}
</script>
<%@ include file="../../top.jsp"%>
<h1 align="center">���� ���</h1>
<table align="center" width="1300">
	<tr>
		<th>�̸�</th>
		<th>���� �뿩 ���� ��</th>
		<th>�ִ� ���� ���� ��</th>
		<th><a href="insertPlace.admin">���� ����ϱ�</a></th>
	</tr>
	<%
		
		for (PlaceDTO dto : list) {
	%>
	<tr>
		<td><%=dto.getName()%>
		<td><%=dto.getPossible()%>
		<td><%=dto.getMax()%>
		<td>
		<button onclick="location.href='updatePlace.admin?name=<%=dto.getName()%>'">����</button>
		<button onclick="check(<%=dto.getName()%>);">����</button></td>
	</tr>
	<%
		}
	%>
</table>
<%@ include file="../../bottom.jsp"%>