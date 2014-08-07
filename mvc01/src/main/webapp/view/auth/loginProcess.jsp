
<%@page import="kt.c.vo.LoginVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose">
	<c:when test="${userVO.type eq 'S' }">
		<c:set var="message" value="관리자님 환영합니다." />
	</c:when>
	<c:otherwise>
		<c:set var="message" value="${userVO.name }님 환영합니다." />
	</c:otherwise>
</c:choose>

<html>
<head>
<title></title>
</head>
<body>
	<script>
	alert('${message}');
	location.href = "${contextRoot}/";
</script>
</body>
</html>











