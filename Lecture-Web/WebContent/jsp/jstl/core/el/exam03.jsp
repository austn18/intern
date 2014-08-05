<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//pageContext, Request, Session, application
	pageContext.setAttribute("msg", "pageContext 영역 아아아아");
	request.setAttribute("id", "ssss");
	request.setAttribute("msg", "request 영역 아아아아");
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
	<!-- scope 까먹지마 -->
	msg(request) : ${ requestScope.msg }<br/>
	msg(request) : <%= request.getAttribute("msg") %><br/>
	
</body>
</html>