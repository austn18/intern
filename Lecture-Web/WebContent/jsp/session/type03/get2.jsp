<%@page import="kr.co.kt.member.db.MemberVO"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	MemberVO member = ((MemberVO)session.getAttribute("memer"));

	if(member != null){
%>
<h1>설정된 세션 정보</h1>
<h2>설정된 세션 아이디 : <%= member.getId() %></h2>
<h2>설정된 세션 비밀번호 : <%= member.getPassword() %></h2>
<%}else{ %>
<h2>세션 정보 없음</h2>
<%} %>
<a href="mainForm.jsp">쿠키 설정 이동</a>
<a href="remove.jsp">쿠키 삭제</a>