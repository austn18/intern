<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${ empty param.type }">
		<h2>type 파라미터가 전송되지 않았습니다.</h2>
	</c:when>
	<c:when test="${ param.type eq 'S' }">
		<h2>관리자 입니다.</h2>
	</c:when>
	<c:when test="${ param.type eq 'U' }">
		<h2>일반 사용자 입니다.</h2>
	</c:when>
	<c:otherwise>
		<h2>type 값은 ${ param.type } 입니다.</h2>
	</c:otherwise>
</c:choose>
</body>
</html>