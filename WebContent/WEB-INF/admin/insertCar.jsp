<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="db.* , java.util.*"%>
<form action="insertCar_Ok.admin" method="post" enctype="multipart/form-data">
<table align="center">
<tr>
<td>�� ��ȣ
<td><input type="text" name="id" maxlength="12">
</tr>
<tr> 
<td>�� �̸�
<td><input type="text" name="name">
</td>
</tr>
<tr>
<td>�� ����
<td><select name="type">
<option value="SS">����(SS)
<option value="S">����(S)
<option value="M">����(M)
<option value="L">����(L)
<option value="E">������(E)
<option value="F">������(F)
</select>
</td>
</tr>
<tr>
<td>���� ����
<td><select name="fuel">
<option value="P">�ֹ���
<option value="D">����
</select>
</tr>
<tr>
<td>�ִ��ο���
<td><input type="text" name="maxpeople">
</tr>
<tr>
<td>���
<% PlaceDAO dao =  new PlaceDAO(); 
List<PlaceDTO> list = dao.placeList();%>
<td><select name="place">
<%for(PlaceDTO dto : list){ %>
<option value="<%=dto.getName()%>"><%=dto.getName()%>
<%} %>
</select>
</tr>
<tr>
<td class="sub">����
<td><input type="text" name="price">
</tr>
<tr>
<td class="sub">�����̹���
<td><input type="file" name="image">
</tr>
<tr>
<td colspan="2">
<input type="submit" value="����ϱ�" style="">
<input type="reset" value="�ʱ�ȭ">
<button onclick="location.href='rentlist.admin'">�������</button>
</td>
</tr>
</table>
</form>
