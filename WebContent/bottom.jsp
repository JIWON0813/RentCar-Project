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
						placeholder="���̵�" style="height: 40px; font-size: 20px;"></td>
					<td rowspan="2"><input type="submit" value="�α���"
						style="font-weight: bold; height: 70px; font-size: 30px; background-color: yellow;"></td>
				</tr>
				<tr>
					<td height="41px"><input type="password" name="passwd"
						placeholder="��й�ȣ" style="height: 40px; font-size: 20px;"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button
							style="background-color: sky; height: 50px; font-size: 20px; font-weight: bold;">���̵�/��й�ȣ
							ã��</button>
						<button
							style="background-color: sky; height: 50px; font-size: 20px; font-weight: bold;">
							<a href="register.do">ȸ������</a>
						</button>
				</tr>
			</table>
		</form>
		<%}
	else{%>
	<table
			  	style="padding-top: 10px; background-color: gray; height: 300px;">
				<tr>
				<td><%=check%>�� ȯ���մϴ�.
				</tr>
				<tr>
					<td align="center">						
						<button style="background-color: sky; height: 50px; font-size: 20px; font-weight: bold;" onclick="location.href='logout.do'">
							�α׾ƿ�
						</button>
				</tr>
			</table>
	<%} %>
	</div>
</td>
<tr height="10%">
	<td colspan="2" align="center">MVC ������ ���� ����������Ʈ�Դϴ�. ���� : ��Ʈī����Ʈ
		�ۼ��� : ������</td>
</tr>
</table>
</div>
</body>
</html>