<%@page import="kr.co.kt.member.db.MemberVO"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	MemberVO member = ((MemberVO)session.getAttribute("memer"));

%>
<h1>������ ���� ����</h1>
<h2>������ ���� ���̵� : ${member.id }</h2>
<h2>������ ���� ��й�ȣ : ${member.password }</h2>

<a href="mainForm.jsp">��Ű ���� �̵�</a>
<a href="remove.jsp">��Ű ����</a>