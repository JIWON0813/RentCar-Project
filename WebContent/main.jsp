<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="db.* , java.util.*"%>
<%@ page%>
<%@ include file="top.jsp"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = (String) session.getAttribute("id");
	String passwd = (String) session.getAttribute("passwd");
	if (id != null && passwd != null) {
		session.setAttribute("id", id);
		session.setAttribute("passwd", passwd);
	}
	PlaceDAO dao = new PlaceDAO();
%>
<form action="rent.do">
	<table width="1550px" height="545px">
		<tr>
			<td class="md" colspan="3" style="font-size: 40px;">기간선택</td>
		</tr>
		<tr>
			<td width="40%" align="center"><input type="date" name="startdate" style="height: 50px; width: 250px;"></td>
			<td width="20%" align="center" style="font-size: 20px;">~</td>
			<td width="40%" align="center"><input type="date" name="enddate" style="height: 50px; width: 250px;"></td>
		</tr>
		<tr>
			<td class="md" colspan="3" style="font-size: 40px;">지역 선택</td>
		</tr>
		<tr>
			<td align="center"><select name="startplace" style="height: 50px; width: 250px;">
			<% List<PlaceDTO> list = dao.placeList();
				for(PlaceDTO dto : list){%>
				<option><%=dto.getName()%>
				<% } %>
			</select></td>
			<td align="center" style="font-size: 20px;">></td>
			<td align="center"><select name="endplace" style="height: 50px; width: 250px;">
			<% for(PlaceDTO dto : list){%>
				<option><%=dto.getName()%>
				<% } %>
			</select></td>
		</tr>
		<tr>
			<td colspan="3" align="center"><input type="submit" class="md" value="검색" style="height: 100px; width: 250px; font-size: 60px;">
			</td>
		</tr>
	</table>
</form>
<a href="admin.do">테스트</a>
<%@ include file="bottom.jsp"%>