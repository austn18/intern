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
1을 가지는 변수 cnt 를 공유영역(page)에 설정 : <c:set var="cnt" value="1"/>${ cnt }<br/>
변수 cnt 값을 1 증가 : <c:set var="cnt" value="${ cnt+1 }"/>${ cnt }<br/> <!-- 태그로인식  -->
<c:set var="cnt" value="${ cnt+1 }" scope="request" />${ requestScope.cnt }<br/> 

<br/>
</body>
</html>