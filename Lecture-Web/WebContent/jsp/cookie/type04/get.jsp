<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	StringBuilder sb = new StringBuilder();
	Cookie[] cookie = request.getCookies();

	if(cookie != null){
		for(Cookie c : cookie){
			String name = c.getName();
			name = URLDecoder.decode(name, "euc-kr");
			String value = c.getValue();
			value = URLDecoder.decode(value,"euc-kr");
			int age = c.getMaxAge();
			
			sb.append("name : " + name + ", value : " + value + "<br/>");
		}
	}else{
		sb.append("������ ��Ű ������ �����ϴ�.<br/>");
	}
%>
<h1>������ ��Ű ����</h1>
<h2><%= sb.toString() %></h2>
<a href="mainForm.jsp">��Ű ���� �̵�</a>
<a href="remove.jsp">��Ű ����</a>
