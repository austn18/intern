<%@page import="kr.co.kt.board.db.BoardVO"%>
<%@page import="kr.co.kt.board.db.BoardDAO"%>
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
		if(f.writer.value == ""){
			alert('글쓴이를 입력하세요');
			f.writer.focus();
			return false;
		}
		if(f.content.value == ""){
			alert('내용을 입력하세요');
			f.content.focus();
			return false;
		}
		return true;
	}
</script>
<%

request.setCharacterEncoding("euc-kr");

int no = Integer.parseInt(request.getParameter("no"));

BoardDAO dao = new BoardDAO();
BoardVO board = dao.selectByNo(no);
pageContext.setAttribute("board", board);

%>
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
<h2>게시판 수정</h2>
<hr width="80%">
<form name="wForm" action="update.jsp" method="post" onsubmit="return doWrite()">
	<input type="hidden" name="no" value="${ param.no }" />
	<table width="80%"  class="list">
	<tr>
		<th>번호</th>
		<td align="left">${ board.no }</td>
	</tr>
	<tr>
		<th width="20%">제목</th>
		<td align="left"><input type="text" name="title" size="40" value="${ board.title }"></td>
	</tr>
	<tr>
		<th>글쓴이</th>
		<td align="left"><input type="text" name="writer" size="40" value="${ board.writer }"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td align="left"><textarea rows="6" cols="40" name="content" >${ board.content }</textarea></td>
	</tr>
	</table>
	<hr width="80%">
	<input type="submit" value="수정">
	<input type="button" value="목록으로 이동" onclick="doList()">
</form>
</div>
</div>
<div id="bottom">
<%@ include file="/jsp/include/bottom.jsp" %>
</div>



</body>
</html>