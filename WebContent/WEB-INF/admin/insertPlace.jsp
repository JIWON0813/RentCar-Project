<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.* , db.*"%>
<%
	List<PlaceDTO> list = (List)request.getAttribute("list");
%>
<form action="insertPlace_Ok.admin">
<table align="center">
<tr>
<td>�̸�
<td><input type="text" name="name" maxlength="12">
</tr>
<tr>
<td>�ִ� ���� ���� ���� ��
<td><input type="text" name="max">
</tr>
<tr>
<td colspan="2">
<input type="submit" value="����ϱ�" style="">
<input type="reset" value="�ʱ�ȭ">
<button onclick="location.href='placelist.admin'">�������</button>
</td>
</tr>
</table>
</form>
��ϵ� ���
<table>
<tr>
<% for(PlaceDTO dto : list){ %>
<td><%=dto.getName()%>
<% } %>
</tr>
</table>