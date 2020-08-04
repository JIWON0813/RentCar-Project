<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.* , db.*"%>
	
<%List<PlaceDTO> list = (List) request.getAttribute("list"); %>

<script type="text/javascript">
function check(name){
	if(confirm("정말 삭제하시겠습니까?") == true){
		<% CarDAO carDao = new CarDAO();
		List<CarDTO> carlist = carDao.carList(); 
		for(CarDTO dto : carlist){%>
		if(<%=dto.getPlace()%> == name){
			alert("삭제하려는 장소에 등록되어있는 차량이 있습니다.")
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
<h1 align="center">차량 목록</h1>
<table align="center" width="1300">
	<tr>
		<th>이름</th>
		<th>현재 대여 가능 수</th>
		<th>최대 주차 공간 수</th>
		<th><a href="insertPlace.admin">지역 등록하기</a></th>
	</tr>
	<%
		
		for (PlaceDTO dto : list) {
	%>
	<tr>
		<td><%=dto.getName()%>
		<td><%=dto.getPossible()%>
		<td><%=dto.getMax()%>
		<td>
		<button onclick="location.href='updatePlace.admin?name=<%=dto.getName()%>'">수정</button>
		<button onclick="check(<%=dto.getName()%>);">삭제</button></td>
	</tr>
	<%
		}
	%>
</table>
<%@ include file="../../bottom.jsp"%>