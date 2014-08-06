<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="kr.co.kt.util.ConnectionFactory" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/Mission-Web/css/layout.css"/>
<link rel="stylesheet" href="/Mission-Web/css/board.css"/>
<script>

function chkForm(){
	//alert(document.sform.password.value);
	
	var f = document.sform;
 	var na = [f.id, f.name, f.password, f.cpassword, f.email_id, f.email_domain, 
 	          f.tel1, f.tel2, f.tel3, f.post, f.basic_addr, f.detail_addr];
 	
  	for(var i = 0 ; i < na.length ; i++){
		  if(na[i].value == '') {
			var al = '';
			switch(i){
			case 0:
				al = '������ ';
				break;
			case 1:
				al = '�̸��� ';
				break;
			case 2:
				al = '��й�ȣ�� ';
				break;
			case 3:
				al = '��й�ȣ Ȯ���� ';
				break;
			case 4:
			case 5:
				al = '�����ּҸ� ';
				break;
			case 6:
			case 7:
			case 8:
				al = '��ȭ��ȣ�� ';
				break;
			case 9:
			case 10:
			case 11:
				al = '�ּҸ� ';
				break;
			}
			al += '�������� �ʾҽ��ϴ�.';
			alert(al);
			na[i].focus();  
			return false;
		}  
		
	}  
 	if(f.password.value != f.cpassword.value){
		alert('��й�ȣ�� �ٸ��ϴ�.');
		f.password.value = '';
		f.cpassword.value = '';
		return false;
	} 
	
	//return true;
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<div id="header">
<jsp:include page="/jsp/include/topMenu.jsp"/>
</div>
<div id="content">
<hr width="700px;" />
	<center>
		<h2>ȸ������</h2>
	</center>
	<hr width="700px;" />
	<form name="sform" action="signUp.jsp" method="post" onsubmit="return chkForm()">
		<table align="center" width="80%" border="0" class="list">
			<tr>
				<td width="20%">&nbsp;���̵�</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>&nbsp;�̸�</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>&nbsp;��й�ȣ</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td>&nbsp;��й�ȣ Ȯ��</td>
				<td><input type="password" name="cpassword"></td>
			</tr>
			<tr>
				<td>&nbsp;�̸���</td>
				<td><input type="text" name="email_id"> @ <input
					type="text" name="email_domain"></td>
			</tr>
			<tr>
				<td>&nbsp;��ȭ��ȣ</td>
				<td><input type="text" name="tel1" size="3"> - <input
					type="text" name="tel2" size="4"> - <input type="text"
					name="tel3" size="4"></td>
			</tr>
			<tr>
				<td rowspan="3">&nbsp;�ּ�</td>
				<td>�����ȣ&nbsp;<input type="text" name="post" size="7"></td>
			</tr>
			<tr>
				<td>�ּ� &nbsp;1&nbsp;<input size="60" type="text" name="basic_addr"></td>
			</tr>
			<tr>
				<td>�ּ� &nbsp;2&nbsp;<input size="60" type="text" name="detail_addr"></td>
			</tr>
		</table>
		<hr width="700px;" />
		<center>
			<input type="reset" value="�ʱ�ȭ" /> <input type="submit" value="ȸ������" />
		</center>
	</form>
</div>
<div id="bottom">
<%@ include file="/jsp/include/bottom.jsp" %>
</div>


</body>
</html>