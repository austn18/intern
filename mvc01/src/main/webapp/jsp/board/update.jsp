<%@page import="kr.co.kt.board.db.BoardVO"%>
<%@page import="kr.co.kt.board.db.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
request.setCharacterEncoding("euc-kr");

int no = Integer.parseInt(request.getParameter("no"));
String title = request.getParameter("title");
String content = request.getParameter("content");

BoardVO board = new BoardVO();
board.setNo(no);
board.setTitle(title);
board.setContent(content);

BoardDAO dao = new BoardDAO();
dao.update(board);
%>

<script>
	alert('게시물  ${param.no} 가 수정되었습니다.');
	location.href = "detail.jsp?no=${param.no}";
</script>









