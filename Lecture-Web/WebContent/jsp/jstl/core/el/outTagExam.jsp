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
	value 속성만 지원 : <c:out value="JSTL"/> <br/>
	value 속성만 지원 : <c:out value="${ msg }"/> <br/>
	value 속성에 지정된 값을 찾지 못한 경우 : 
	<c:out value="${ msg }" default="졸림"/> <br/>
	값에 태그가 포함된 경우 : <c:out value="<hr />"/> <br/>
	값에 태그가 포함된 경우 escapeXML을 false 로 설정: 
	<c:out value="<hr />" escapeXml="false"/> <br/>
	제목 : 
	<c:out value="<a href=&#034;http://www.naver.com&#034;>테스트</a>"/> 
<br/>
</body>
</html>