<%@page import="kr.co.kt.guest.db.GuestDAO"%>
<%@page import="kr.co.kt.guest.db.GuestVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
 
	GuestVO guest = new GuestVO();
	GuestDAO dao = new GuestDAO();
	guest.setName(request.getParameter("name"));
	guest.setPassword(request.getParameter("password"));
	guest.setEmail(request.getParameter("email"));
	guest.setContent(request.getParameter("content"));
	dao.insert(guest);
%>

<script>
	alert('글이 등록되었습니다.');
	location.href = "list.jsp";
</script>
