<%@page import="kr.co.kt.board.db.BoardFileVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.kt.board.db.BoardVO"%>
<%@page import="kr.co.kt.board.db.BoardDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.kt.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
request.setCharacterEncoding("euc-kr");

int no = Integer.parseInt(request.getParameter("no"));

BoardDAO dao = new BoardDAO();
if(request.getParameter("type")!= null && request.getParameter("type").equals("list"))  dao.updateViewCnt(no);
BoardVO board = dao.selectByNo(no);
 
List<BoardFileVO> FileList = dao.selectFileBoard(no);
request.setAttribute("board", board);
pageContext.setAttribute("fileList", FileList);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
	
	function doAction(type){
		switch(type){
		case 'U' :
			location.href="updateForm.jsp?no=${param.no}";
			break;
		case 'D' :
			if(!confirm('삭제하시겠습니까?')){
				return false;
			}
			location.href="delete.jsp?no=${param.no}";	
			break;
		case 'L' :
			location.href="list.jsp";
			break;
		}
		
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>상세화면</title>
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
<h2>게시판 상세</h2>
<hr width="80%">

<table width="80%"  class="list">
<tr>
<th width="25%">번호</th>
<td width="25%">${board.no }</td>
<th width="25%">글쓴이</th>
<td>${board.writer }</td>
</tr>
<tr>
<th width="25%">제목</th>
<td colspan="3"><c:out value="${board.title }"/> </td>
</tr>
<tr>
<th width="25%" height="200px;">내용</th>
<td colspan="3" align="left" >${board.content }</td>
</tr>
<tr>
<th width="25%">조회수</th>
<td>${board.viewCnt }</td>
<th width="25%">등록일</th>
<td>${board.regDate }</td>
</tr>
<tr>
<th width="25%">첨부파일</th>
<td colspan="3" align="left" >
	<c:forEach var="file" items="${ fileList }">
		<a href="/Mission-Web/upload/${ file.fileSaveName }" target="blink">
		<c:out value="${ file.fileOriName }"/></a>
		 (${file.fileSize} byte)<br/>
	</c:forEach>
</td>
</tr>

</table>
<c:import url="/jsp/reply/list.jsp"/>
<hr width="80%">
<c:if test="${board.writer eq UserVO.id }">
<input type="button" value="수정" onclick="doAction('U')">
</c:if>
<c:if test="${board.writer eq UserVO.id || UserVO.type eq 'S' }">
<input type="button" value="삭제" onclick="doAction('D')">
</c:if>
<input type="button" value="목록으로 이동" onclick="doAction('L')">

</div>
</div>
<div id="bottom">
<%@ include file="/jsp/include/bottom.jsp" %>

</div>



</body>
</html>