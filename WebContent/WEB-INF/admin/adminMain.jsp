<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../top.jsp" %>
<h1>관리자 페이지</h1>
<style>
.s{
	text-align : center;
	text-weight : bold;
	font-size : 30px;
}
</style>
<table align="center">
<tr>
<td class="s"><a href="rentlist.admin">렌트 차랑 목록보기</a>
</td>
</tr>
<tr>
<td class="s"><a href="userlist.admin">회원 목록보기</a>
</td>
</tr>
<tr>
<td class="s"><a href="placelist.admin">지역 목록보기</a>
</td>
</tr>
</table>
<%@ include file="../../bottom.jsp" %>