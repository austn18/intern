<%@page import="kr.co.kt.member.db.MemberVO"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	MemberVO member = ((MemberVO)session.getAttribute("memer"));

	if(member != null){
%>
<h1>������ ���� ����</h1>
<h2>������ ���� ���̵� : <%= member.getId() %></h2>
<h2>������ ���� ��й�ȣ : <%= member.getPassword() %></h2>
<%}else{ %>
<h2>���� ���� ����</h2>
<%} %>
<a href="mainForm.jsp">��Ű ���� �̵�</a>
<a href="remove.jsp">��Ű ����</a>