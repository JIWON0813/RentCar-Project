<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.* , db.*"%>
<%@ include file="../../top.jsp" %>
<% List<UserDTO> list = (List)request.getAttribute("list"); %>
<script type="text/javascript">
function check(id){
	if(confirm("정말 삭제하시겠습니까?") == true){
		location.href="deleteUser.admin?id="+id;
	}else{
		return;
	}
}
</script>
<table align="center">
<tr>
<th>아이디
<th>닉네임
<th>이메일
<th>휴대폰번호
<th>등록날짜
<th>운전면허번호
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
<button onclick="location.href='userInfo.admin?name=<%=dto.getId()%>'">자세히보기</button>
<button onclick="check(<%=dto.getId()%>);">삭제</button></td>
</td>
</tr>
<% } %>
</table>
<%@ include file="../../bottom.jsp" %>