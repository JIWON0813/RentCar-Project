<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.* , db.*"%>
<%
	List<PlaceDTO> list = (List)request.getAttribute("list");
%>
<form action="insertPlace_Ok.admin">
<table align="center">
<tr>
<td>이름
<td><input type="text" name="name" maxlength="12">
</tr>
<tr>
<td>최대 수용 가능 차랑 수
<td><input type="text" name="max">
</tr>
<tr>
<td colspan="2">
<input type="submit" value="등록하기" style="">
<input type="reset" value="초기화">
<button onclick="location.href='placelist.admin'">목록으로</button>
</td>
</tr>
</table>
</form>
등록된 장소
<table>
<tr>
<% for(PlaceDTO dto : list){ %>
<td><%=dto.getName()%>
<% } %>
</tr>
</table>