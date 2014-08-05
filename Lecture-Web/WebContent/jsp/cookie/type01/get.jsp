<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	StringBuilder sb = new StringBuilder();
	Cookie[] cookie = request.getCookies();

	if(cookie != null){
		for(Cookie c : cookie){
			String name = c.getName();
			String value = c.getValue();
			sb.append("name : " + name + ", value : " + value + "<br/>");
		}
	}else{
		sb.append("설정된 쿠키 정보가 없습니다.<br/>");
	}
%>
<h1>설정된 쿠키 정보</h1>
<h2><%= sb.toString() %></h2>
<a href="mainForm.jsp">쿠키 설정 이동</a>