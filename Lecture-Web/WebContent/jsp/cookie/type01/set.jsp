<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	String cName = request.getParameter("cName");
	String cValue = request.getParameter("cValue");
	
	//��Ű ����
	Cookie cookie = new Cookie(cName, cValue);
	
	//��Ű ����(to Client)
	response.addCookie(cookie);
%>
<h1>��Ű ���� �Ϸ�</h1>
<a href="get.jsp">������ ��Ű Ȯ��</a>