
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String [] names = {"ȫ�浿","�ȱ浿","���浿","�ֱ浿"};
	List anames = new ArrayList();
	anames.add("ȫ�浿");
	anames.add("�ȱ浿");
	anames.add("���浿");
	anames.add("�ֱ浿");
	pageContext.setAttribute("name", names);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	names[0] : ${names[0]}<br> 
	names[1] : ${names[1]}<br> 
	names[2] : ${names[2]}<br>
	names[3] : ${names[3]}<br>
	<% for(int i = 0 ; i < names.length ; i++){ %>
	names[i] : $(names[i])<br>
	<% } %>
	
</body>
</html>