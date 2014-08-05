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
			alert('제목을 입력하세요');
			f.title.focus();
			return false;
		}

		if(f.content.value == ""){
			alert('내용을 입력하세요');
			f.content.focus();
			return false;
		}
		//금지 확장자 체크
		var forbidName = ['exe','java','bat','jsp','js'];
		var fileName = f.attachFile1.value; //test.java
		
		if(fileName != ""){
			var ext = fileName.substr(fileName.lastIndexOf(".") + 1);
			for(var i = 0 ; i < forbidName.length ; i++){
				if(forbidName[i] == ext){
					alert(ext + '확장자는 파일 업로드 정책에 위배 됩니다.');
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
			<h2>게시판 등록</h2>
			<hr width="80%">
			<form name="wForm" action="write.jsp" method="post"
				enctype="multipart/form-data" onsubmit="return doWrite()">
				<!-- 멀티파트는 request 가 안됨 -->
				<table width="80%">
					<tr>
						<th width="20%">제목</th>
						<td align="left"><input type="text" name="title" size="40"></td>
					</tr>
					<tr>
						<th>글쓴이</th>
						<td align="left">${UserVO.id}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td align="left"><textarea rows="6" cols="40" name="content"></textarea></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td align="left">
						<input type="file" name="attachFile1" size="40"/><br/>
						<input type="file" name="attachFile2" size="40"/></td>
					</tr>
					
				</table>
				<hr width="80%">
				<input type="submit" value="새글 등록"> <input type="button"
					value="목록으로 이동" onclick="doList()">
			</form>
		</div>
	</div>
<div id="bottom">
<%@ include file="/jsp/include/bottom.jsp" %>
</div>



</body>
</html>