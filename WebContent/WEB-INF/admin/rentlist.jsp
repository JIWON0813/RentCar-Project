<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.* , db.*"%>
<%@ include file="../../top.jsp" %>
<h1 align="center">���� ���</h1>
<table>
<tr>
<th>��Ϲ�ȣ</th>
<th>�̸�</th>
<th>����</th>
<th>��� ����</th>
<th>����</th>
<th><a href="insertCar.admin">���� ����ϱ�</a></th>
</tr>
<%
	List<CarDTO> list = (List)request.getAttribute("list");
	if(list == null || list.size() == 0){
		%>
		<tr><td colspan="6">��ϵ� ������ �����ϴ�.</td></tr>
		<%
	}
	else{
		for(CarDTO dto : list){
		%>
		<tr>
		<td><%=dto.getId()%>
		<td><img src="<%=dto.getImage()%>" width="40px" height="40px"><%=dto.getName()%>
		<td><%=dto.getPrice()%>
		<td><%=dto.getPlace() %>
		<td><%=dto.getRent() %>
		<td>
		<button onclick="location.href='updateCar.admin'">����</button>
		<button onclick="location.href='deleteCar.admin'">����</button>
		</td>
		</tr>
		<%}
	}
%>
</table>
<%@ include file="../../bottom.jsp" %>