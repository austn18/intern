<%@page import="kr.co.kt.board.db.BoardVO"%>
<%@page import="kr.co.kt.board.db.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="kr.co.kt.util.ConnectionFactory" %>

<%
request.setCharacterEncoding("euc-kr");
BoardVO board = new BoardVO();

int no = Integer.parseInt(request.getParameter("no"));
String title = request.getParameter("title");
String writer = request.getParameter("writer");
String content = request.getParameter("content");

board.setNo(no);
board.setTitle(title);
board.setWriter(writer);
board.setContent(content);

BoardDAO dao = new BoardDAO();
dao.update(board); 


%>

<script>
	alert('${param.no}�� �Խù��� �����Ǿ����ϴ�.');
	location.href = "detail.jsp?no=${param.no}";
</script>