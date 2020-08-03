<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.* , db.*"%>
<%@ include file="../../top.jsp" %>
<h1 align="center">차량 목록</h1>
<table>
<tr>
<th>등록번호</th>
<th>이름</th>
<th>가격</th>
<th>등록 지역</th>
<th>상태</th>
<th><a href="insertCar.admin">차량 등록하기</a></th>
</tr>
<%
	List<CarDTO> list = (List)request.getAttribute("list");
	if(list == null || list.size() == 0){
		%>
		<tr><td colspan="6">등록된 차량이 없습니다.</td></tr>
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
		<button onclick="location.href='updateCar.admin'">수정</button>
		<button onclick="location.href='deleteCar.admin'">삭제</button>
		</td>
		</tr>
		<%}
	}
%>
</table>
<%@ include file="../../bottom.jsp" %>