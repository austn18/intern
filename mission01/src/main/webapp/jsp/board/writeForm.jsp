<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="kr.co.kt.util.ConnectionFactory" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
	function doList(){
		location.href = "list.jsp";
	}
	function doWrite(){
		var f = document.wForm;
		if(f.title.value == ""){
			alert('������ �Է��ϼ���');
			f.title.focus();
			return false;
		}

		if(f.content.value == ""){
			alert('������ �Է��ϼ���');
			f.content.focus();
			return false;
		}
		//���� Ȯ���� üũ
		var forbidName = ['exe','java','bat','jsp','js'];
		var fileName = f.attachFile1.value; //test.java
		
		if(fileName != ""){
			var ext = fileName.substr(fileName.lastIndexOf(".") + 1);
			for(var i = 0 ; i < forbidName.length ; i++){
				if(forbidName[i] == ext){
					alert(ext + 'Ȯ���ڴ� ���� ���ε� ��å�� ���� �˴ϴ�.');
					return false	;
				}
			}
		}
		
		return true;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mission-Web/css/layout.css"/>
<link rel="stylesheet" href="/Mission-Web/css/board.css"/>
</head>
<body>

<div id="header">
<jsp:include page="/jsp/include/topMenu.jsp"/>
</div>
<div id="content">
		<div align="center">
			<hr width="80%">
			<h2>�Խ��� ���</h2>
			<hr width="80%">
			<form name="wForm" action="write.jsp" method="post"
				enctype="multipart/form-data" onsubmit="return doWrite()">
				<!-- ��Ƽ��Ʈ�� request �� �ȵ� -->
				<table width="80%">
					<tr>
						<th width="20%">����</th>
						<td align="left"><input type="text" name="title" size="40"></td>
					</tr>
					<tr>
						<th>�۾���</th>
						<td align="left">${UserVO.id}</td>
					</tr>
					<tr>
						<th>����</th>
						<td align="left"><textarea rows="6" cols="40" name="content"></textarea></td>
					</tr>
					<tr>
						<th>÷������</th>
						<td align="left">
						<input type="file" name="attachFile1" size="40"/><br/>
						<input type="file" name="attachFile2" size="40"/></td>
					</tr>
					
				</table>
				<hr width="80%">
				<input type="submit" value="���� ���"> <input type="button"
					value="������� �̵�" onclick="doList()">
			</form>
		</div>
	</div>
<div id="bottom">
<%@ include file="/jsp/include/bottom.jsp" %>
</div>



</body>
</html>