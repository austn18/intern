<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	Cookie c1 = new Cookie("type1", URLEncoder.encode("/ ��Ʈ����", "euc-kr"));
	c1.setPath("/");
	
	Cookie c2 = new Cookie("type2", URLEncoder.encode("/Lecture-Web/jsp/cookie ��Ʈ����", "euc-kr"));
	c2.setPath("/Lecture-Web/jsp/cookie");
	
	Cookie c3 = new Cookie("type3", URLEncoder.encode("/Lecture-Web/jsp/cookie/type03 ��Ʈ����", "euc-kr"));
	c3.setPath("/Lecture-Web/jsp/cookie/type03");
	
	Cookie c4 = new Cookie("type4", URLEncoder.encode("/Lecture-Web/jsp/cookie/type04 ��Ʈ����", "euc-kr"));
	c4.setPath("/Lecture-Web/jsp/cookie/type04");
	
	response.addCookie(c1);
	response.addCookie(c2);
	response.addCookie(c3);
	response.addCookie(c4);
%>
<h1>��Ű ���� �Ϸ�</h1>
<a href="get.jsp">������ ��Ű Ȯ��</a>