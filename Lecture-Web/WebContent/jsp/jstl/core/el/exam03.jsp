<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//pageContext, Request, Session, application
	pageContext.setAttribute("msg", "pageContext ���� �ƾƾƾ�");
	request.setAttribute("id", "ssss");
	request.setAttribute("msg", "request ���� �ƾƾƾ�");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	empty msg : ${ empty msg }<br/>
	msg : ${ msg }<br/>
	id : ${ id }<br/>
	<!-- scope ������� -->
	msg(request) : ${ requestScope.msg }<br/>
	msg(request) : <%= request.getAttribute("msg") %><br/>
	
</body>
</html>