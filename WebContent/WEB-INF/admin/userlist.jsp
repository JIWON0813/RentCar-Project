<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.* , db.*"%>
<%@ include file="../../top.jsp" %>
<% List<UserDTO> list = (List)request.getAttribute("list"); %>
<script type="text/javascript">
function check(id){
	if(confirm("���� �����Ͻðڽ��ϱ�?") == true){
		location.href="deleteUser.admin?id="+id;
	}else{
		return;
	}
}
</script>
<table align="center">
<tr>
<th>���̵�
<th>�г���
<th>�̸���
<th>�޴�����ȣ
<th>��ϳ�¥
<th>���������ȣ
<th>
</tr>
<% for(UserDTO dto : list){ %>
<tr>
<td><%=dto.getId()%>
<td><%=dto.getName() %>
<td><%=dto.getEmail() %>
<td><%=dto.getPhone() %>
<td><%=dto.getRegidate() %>
<td><%=dto.getDriver() %>
<td>
<button onclick="location.href='userInfo.admin?name=<%=dto.getId()%>'">�ڼ�������</button>
<button onclick="check(<%=dto.getId()%>);">����</button></td>
</td>
</tr>
<% } %>
</table>
<%@ include file="../../bottom.jsp" %>