<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");

	String cName = request.getParameter("cName");
	cName = URLEncoder.encode(cName, "euc-kr");
	
	String cValue = request.getParameter("cValue");
	cValue = URLEncoder.encode(cValue, "euc-kr");
	
	String cAge = request.getParameter("cAge");
	
	//��Ű ����
	Cookie cookie = new Cookie(cName, cValue);
	// ��ȿ�ð� ����
	try{
		cookie.setMaxAge(Integer.parseInt(cAge) * 60);
	}catch(Exception e){
		
	}
	//��Ű ����(to Client)
	response.addCookie(cookie);
%>
<h1>��Ű ���� �Ϸ�</h1>
<a href="get.jsp">������ ��Ű Ȯ��</a>