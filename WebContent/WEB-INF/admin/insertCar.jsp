<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="db.* , java.util.*"%>
<form action="insertCar_Ok.admin" method="post" enctype="multipart/form-data">
<table align="center">
<tr>
<td>차 번호
<td><input type="text" name="id" maxlength="12">
</tr>
<tr> 
<td>차 이름
<td><input type="text" name="name">
</td>
</tr>
<tr>
<td>차 종류
<td><select name="type">
<option value="SS">경차(SS)
<option value="S">소형(S)
<option value="M">중형(M)
<option value="L">대형(L)
<option value="E">전기차(E)
<option value="F">수입차(F)
</select>
</td>
</tr>
<tr>
<td>연료 종류
<td><select name="fuel">
<option value="P">휘발유
<option value="D">경유
</select>
</tr>
<tr>
<td>최대인원수
<td><input type="text" name="maxpeople">
</tr>
<tr>
<td>장소
<% PlaceDAO dao =  new PlaceDAO(); 
List<PlaceDTO> list = dao.placeList();%>
<td><select name="place">
<%for(PlaceDTO dto : list){ %>
<option value="<%=dto.getName()%>"><%=dto.getName()%>
<%} %>
</select>
</tr>
<tr>
<td class="sub">가격
<td><input type="text" name="price">
</tr>
<tr>
<td class="sub">파일이미지
<td><input type="file" name="image">
</tr>
<tr>
<td colspan="2">
<input type="submit" value="등록하기" style="">
<input type="reset" value="초기화">
<button onclick="location.href='rentlist.admin'">목록으로</button>
</td>
</tr>
</table>
</form>
