<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.* , db.*"%>
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
		List<PlaceDTO> list = (List) request.getAttribute("list");
		for (PlaceDTO dto : list) {
	%>
	<tr>
		<td><%=dto.getName()%>
		<td><%=dto.getPossible()%>
		<td><%=dto.getMax()%>
		<td>
		<button onclick="location.href='changePlace.admin?name=<%=dto.getName()%>'">����</button>
		<button onclick="location.href='DeletePlace.admin?name=<%=dto.getName()%>'">����</button></td>
	</tr>
	<%
		}
	%>
</table>
<%@ include file="../../bottom.jsp"%>