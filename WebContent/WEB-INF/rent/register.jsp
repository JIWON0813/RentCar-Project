<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script type="text/javascript">
function isSame() {
    var pw1 = document.twin.pw1.value;
    if (pw1.length < 6 || pw1.length > 16) {
        alert('��й�ȣ�� 6���� �̻�, 15���� ���ϸ� �̿� �����մϴ�.');
        document.getElementById('pw1').value=document.getElementById('pw2').value='';
        document.getElementById('same').innerHTML='';
    }
    if(document.getElementById('pw1').value!='' && document.getElementById('pw2').value!='') {
        if(document.getElementById('pw1').value==document.getElementById('pw2').value) {
            document.getElementById('same').innerHTML='��й�ȣ�� ��ġ�մϴ�.';
            document.getElementById('same').style.color='blue';
        }
        else {
            document.getElementById('same').innerHTML='��й�ȣ�� ��ġ���� �ʽ��ϴ�.';
            document.getElementById('same').style.color='red';
        }
    }
}
</script>
<h1 align="center">ȸ �� �� ��</h1>
<form action="userRegister.user">
<table align="center">
<tr>
<td class="sub"> ���̵�
<td><input type="text" class="in" name="id" maxlength="12">
</tr>
<tr> 
<td class="sub">��й�ȣ
<td>
<input type="password" id="pw1" name="passwd" onchange="isSame()" maxlength="15">
<span>8~15�ڸ��� ����, ����, Ư�������� �Է��� �����մϴ�.</span>
</td>
</tr>
<tr>
<td class="sub">��й�ȣ Ȯ��
<td>
<input type="password" id="pw2" onchange="isSame()">
<span id="same"></span>
</td>
</tr>
<tr>
<td class="sub">�������
<td><input type="text" class="in" name="birth">
</tr>
<tr>
<td class="sub">�̸���
<td><input type="text" name="email">
</tr>
<tr>
<td class="sub">�޴�����ȣ
<td><input type="text" name="phone">
</tr>
<tr>
<td class="sub">���������ȣ
<td><input type="text" name="driver">
</tr>
<tr>
<td colspan="2">
<input type="submit" value="�����ϱ�" style="">
<input type="reset" value="�ʱ�ȭ">
<button><a href="main.do">��������</a></button>
</td>
</tr>
</table>
</form>