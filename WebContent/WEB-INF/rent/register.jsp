<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script type="text/javascript">
function isSame() {
    var pw1 = document.twin.pw1.value;
    if (pw1.length < 6 || pw1.length > 16) {
        alert('비밀번호는 6글자 이상, 15글자 이하만 이용 가능합니다.');
        document.getElementById('pw1').value=document.getElementById('pw2').value='';
        document.getElementById('same').innerHTML='';
    }
    if(document.getElementById('pw1').value!='' && document.getElementById('pw2').value!='') {
        if(document.getElementById('pw1').value==document.getElementById('pw2').value) {
            document.getElementById('same').innerHTML='비밀번호가 일치합니다.';
            document.getElementById('same').style.color='blue';
        }
        else {
            document.getElementById('same').innerHTML='비밀번호가 일치하지 않습니다.';
            document.getElementById('same').style.color='red';
        }
    }
}
</script>
<h1 align="center">회 원 가 입</h1>
<form action="userRegister.user">
<table align="center">
<tr>
<td class="sub"> 아이디
<td><input type="text" class="in" name="id" maxlength="12">
</tr>
<tr> 
<td class="sub">비밀번호
<td>
<input type="password" id="pw1" name="passwd" onchange="isSame()" maxlength="15">
<span>8~15자리의 영문, 숫자, 특수문자의 입력이 가능합니다.</span>
</td>
</tr>
<tr>
<td class="sub">비밀번호 확인
<td>
<input type="password" id="pw2" onchange="isSame()">
<span id="same"></span>
</td>
</tr>
<tr>
<td class="sub">생년월일
<td><input type="text" class="in" name="birth">
</tr>
<tr>
<td class="sub">이메일
<td><input type="text" name="email">
</tr>
<tr>
<td class="sub">휴대폰번호
<td><input type="text" name="phone">
</tr>
<tr>
<td class="sub">운전면허번호
<td><input type="text" name="driver">
</tr>
<tr>
<td colspan="2">
<input type="submit" value="가입하기" style="">
<input type="reset" value="초기화">
<button><a href="main.do">메인으로</a></button>
</td>
</tr>
</table>
</form>