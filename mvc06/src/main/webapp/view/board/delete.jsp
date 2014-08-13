<%@page import="kt.c.dao.BoardDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
int no = Integer.parseInt(request.getParameter("no"));

BoardDAO dao = new BoardDAO();
dao.deleteFile(no);
dao.delete(no);

%>

<script>
	alert('게시물 번호 <%= no %> 가 삭제되었습니다.');
	location.href = "list.do";
</script>