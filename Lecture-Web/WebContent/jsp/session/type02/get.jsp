<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = (String)session.getAttribute("id");
	String password = (String)session.getAttribute("password");
%>
<h1>������ ���� ����</h1>
<h2>������ ���� ���̵� : <%= id %></h2>
<h2>������ ���� ��й�ȣ : <%= password %></h2>
<h2>������ ���� ���̵� : ${ sessionScope.id }</h2>
<h2>������ ���� ��й�ȣ : ${ sessionScope.password }</h2>
<a href="mainForm.jsp">��Ű ���� �̵�</a>
<a href="remove.jsp">��Ű ����</a>