<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.* , db.*"%>
<%@ include file="../../top.jsp"%>
<h1 align="center">차량 목록</h1>
<table align="center" width="1300">
	<tr>
		<th>이름</th>
		<th>현재 대여 가능 수</th>
		<th>최대 주차 공간 수</th>
		<th><a href="insertPlace.admin">지역 등록하기</a></th>
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
		<button onclick="location.href='changePlace.admin?name=<%=dto.getName()%>'">수정</button>
		<button onclick="location.href='DeletePlace.admin?name=<%=dto.getName()%>'">삭제</button></td>
	</tr>
	<%
		}
	%>
</table>
<%@ include file="../../bottom.jsp"%>