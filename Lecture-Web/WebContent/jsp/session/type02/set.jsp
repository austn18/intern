<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	session.setAttribute("id", id);
	session.setAttribute("password", password);
	
%>
<h1>세션 설정 완료</h1>
<a href="get.jsp">설정된 세션 확인</a>