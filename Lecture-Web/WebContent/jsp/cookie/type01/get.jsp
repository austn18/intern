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
		sb.append("������ ��Ű ������ �����ϴ�.<br/>");
	}
%>
<h1>������ ��Ű ����</h1>
<h2><%= sb.toString() %></h2>
<a href="mainForm.jsp">��Ű ���� �̵�</a>