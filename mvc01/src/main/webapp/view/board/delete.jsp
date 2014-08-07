<%@page import="kr.co.kt.board.db.BoardDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.kt.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
int no = Integer.parseInt(request.getParameter("no"));

BoardDAO dao = new BoardDAO();
dao.deleteFile(no);
dao.delete(no);

%>

<script>
	alert('게시물 번호 <%= no %> 가 삭제되었습니다.');
	location.href = "list.jsp";
</script>