<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α��� ��</title>
<link rel="stylesheet" href="/Mission-Web/css/layout.css"/>
<link rel="stylesheet" href="/Mission-Web/css/board.css"/>
<script>
	function isNull(obj, msg){
		if(obj.value == ""){
			alert(msg);
			obj.focus();
			return true;
		}
		return false;
	}
	
	function chkForm(){
		var f = document.lForm;
		
		if(isNull(f.id, '���̵� �Է��ϼ���')) return false;
		if(isNull(f.password, '�н����带 �Է��ϼ���')) return false;
		
		
// 		if(f.id.value == ""){
// 			alert('���̵� �����ϴ�.')
// 			f.id.focus();
// 			return false;
// 		}
// 		if(f.password.value == ""){
// 			alert('��й�ȣ�� �����ϴ�.')
// 			f.password.focus();
// 			return false;
// 		}
		return true;
	}
</script>
</head>
<body>
<div id="header">
<jsp:include page="/jsp/include/topMenu.jsp"/>
</div>
<div id="content" align="center">

<hr width="80%">
<h2>�α���</h2>
<hr width="80%">
<form name="lForm" method="post" action="loginProcess.jsp" onSubmit="return chkForm()">
<table width="50%">
	<tr>
	<th>ID</th>
	<td><input type="text" name="id" size="20" /></td>
	</tr>
	<tr>
	<th>PASS</th>
	<td><input type="password" name="password" size="20" /></td>
	</tr>
</table>
<br>
<input type="submit" value="�α���">
</form>

</div>
<div id="bottom">
<%@ include file="/jsp/include/bottom.jsp" %>
</div>
</body>
</html>