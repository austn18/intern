<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = (String)session.getAttribute("id");
	String password = (String)session.getAttribute("password");
%>
<h1>설정된 세션 정보</h1>
<h2>설정된 세션 아이디 : <%= id %></h2>
<h2>설정된 세션 비밀번호 : <%= password %></h2>
<h2>설정된 세션 아이디 : ${ sessionScope.id }</h2>
<h2>설정된 세션 비밀번호 : ${ sessionScope.password }</h2>
<a href="mainForm.jsp">쿠키 설정 이동</a>
<a href="remove.jsp">쿠키 삭제</a>