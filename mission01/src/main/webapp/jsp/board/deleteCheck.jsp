<%@page import="kr.co.kt.board.db.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String[] delArr = request.getParameterValues("del");
	BoardDAO dao = new BoardDAO();
	StringBuilder sb = new StringBuilder();
	for(String s : delArr){
		sb.append(s + " ");
		dao.delete(Integer.parseInt(s));
	}
%>

<script> 
	alert('<%= sb.toString() %>번 글을 삭제 하였습니다.');
	location.href = "list.jsp";
</script>