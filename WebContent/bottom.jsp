<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
	String check = (String)session.getAttribute("id");

%>

</td>
<td width="15%">
	<div>
	<%if(check == null){ %>
		<form action="login.do">
			<table
			  	style="padding-top: 10px; background-color: gray; height: 300px;">
				<tr>
					<td width="50%" height="41px"><input type="text" name="id"
						placeholder="아이디" style="height: 40px; font-size: 20px;"></td>
					<td rowspan="2"><input type="submit" value="로그인"
						style="font-weight: bold; height: 70px; font-size: 30px; background-color: yellow;"></td>
				</tr>
				<tr>
					<td height="41px"><input type="password" name="passwd"
						placeholder="비밀번호" style="height: 40px; font-size: 20px;"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button
							style="background-color: sky; height: 50px; font-size: 20px; font-weight: bold;">아이디/비밀번호
							찾기</button>
						<button
							style="background-color: sky; height: 50px; font-size: 20px; font-weight: bold;">
							<a href="register.do">회원가입</a>
						</button>
				</tr>
			</table>
		</form>
		<%}
	else{%>
	<table
			  	style="padding-top: 10px; background-color: gray; height: 300px;">
				<tr>
				<td><%=check%>님 환영합니다.
				</tr>
				<tr>
					<td align="center">						
						<button style="background-color: sky; height: 50px; font-size: 20px; font-weight: bold;" onclick="location.href='logout.do'">
							로그아웃
						</button>
				</tr>
			</table>
	<%} %>
	</div>
</td>
<tr height="10%">
	<td colspan="2" align="center">MVC 연습을 위한 개인프로젝트입니다. 제목 : 렌트카사이트
		작성자 : 김지원</td>
</tr>
</table>
</div>
</body>
</html>