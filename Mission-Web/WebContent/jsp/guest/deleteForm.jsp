<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
	function goList() {
		location.href = "list.jsp";
	}
	function isNull(obj, msg) {
		if (obj.value == "") {
			alert(msg);
			obj.focus();
			return true;
		}
		return false;
	}

	function chkForm() {
		var f = document.dForm;

		if (isNull(f.password, '�н����带 �Է��ϼ���'))
			return false;

		return true;
	}
</script>
</head>
<body>
			<hr width="80%">
			<center><h2>���� ����</h2></center>
			<hr width="80%">
<div id="header">
<jsp:include page="/jsp/include/topMenu.jsp"/>
</div>
<div id="content">

<form action="delete.jsp" method="post" name="dFrom" onsubmit="return chkForm()">
<input type="hidden" name="no" value="${param.no }">
<table align="center">
<tr><td>��ȣ</td><td><input type="password" name="password" size="20">
���� ���� �Է��� ��ȣ�� �����ؾ� ���� �����˴ϴ�.</td></tr>
<tr><td colspan="2">
<input type="submit" value="����"> 
<input type="button" value="���" onclick="goList()"></td></tr>
</table>

</form>

</div>
<div id="bottom">
<%@ include file="/jsp/include/bottom.jsp" %>
</div>


</body>
</html>