<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/Lecture-Web/css/board.css" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
function goList(){
	location.href="list.jsp";
}
function isNull(obj, msg){
	if(obj.value == ""){
		alert(msg);
		obj.focus();
		return true;
	}
	return false;
}

function chkForm(){
	var f = document.wForm;
	
	if(isNull(f.name, '���̵� �Է��ϼ���')) return false;
	if(isNull(f.password, '�н����带 �Է��ϼ���')) return false;
	if(isNull(f.email, '�̸����� �Է��ϼ���')) return false;
	if(isNull(f.content, '������ �Է��ϼ���')) return false;
	return true;
}
</script>
</head>
<body>


<div id="header">
<jsp:include page="/jsp/include/topMenu.jsp"/>
</div>
<div id="content">
			<hr width="80%">
			<center><h2>���� ����</h2></center>
			<hr width="80%">
	<form action="write.jsp" method="post" name="wForm"
		onsubmit="return chkForm()">
		<table align="center" width="60%">
			<tr>
				<th width="10%" align="left">�̸�</th>
				<td width="50%"><input type="text" name="name" size="20"></td>
			</tr>
			<tr>
				<th align="left">��ȣ</th>
				<td><input type="password" name="password" size="20"></td>
			</tr>
			<tr>
				<th align="left">�̸���</th>
				<td><input type="text" name="email" size="20"></td>
			</tr>
			<tr>
				<th align="left">����</th>
				<td><textarea rows="4" cols="40" name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="�۳����">
				<input type="button" value="���" onclick="goList()"></td>
			</tr>
		</table>
	</form>

</div>
<div id="bottom">
<%@ include file="/jsp/include/bottom.jsp" %>
</div>



</body>
</html>