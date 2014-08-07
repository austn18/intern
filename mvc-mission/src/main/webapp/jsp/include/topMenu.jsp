<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mission-Web/css/layout.css"/>
<link rel="stylesheet" href="/Mission-Web/css/board.css"/>
</head>
<body>
	<table width="100%">
		<tr>
			<td rowspan="2" height="50px;" width="175px;"><a
				href="/Mission-Web/"> <img src="/Mission-Web/images/logo.jpg"
					height="50px;" width="175px;" style="border: 0px;"></a></td>
			<td align="right">
			<c:choose>
				<c:when test="${ empty UserVO  }">손님 환영합니다</c:when>
				<c:when test="${ UserVO.type eq 'S'  }">${ UserVO.id } 관리자님 환영합니다</c:when>
				<c:otherwise>${ UserVO.id }님 환영합니다</c:otherwise>
			</c:choose>
			 || <a href="javascript:window.external.AddFavorite('http://localhost:8000/Mission-Web', '첫번째 나의 웹')">즐겨찾기
			</a></td>
		</tr>
		<tr>
			<td align="left">
			<c:if test="${sessionScope.UserVO.type eq 'S'}">
			<a href="/Mission-Web/jsp/regist/list.jsp">회원관리</a> ||</c:if>
			<a href="/Mission-Web/jsp/board/list.jsp">게시판</a> || 
			<c:if test="${sessionScope.UserVO eq null}">
			<a href="/Mission-Web/jsp/regist/signUpForm.jsp">회원가입</a> ||</c:if>
			<c:if test="${sessionScope.UserVO eq null}">
			<a href="/Mission-Web/jsp/login/login.jsp">로그인</a></c:if>
			<c:if test="${sessionScope.UserVO ne null}">
			<a href="/Mission-Web/jsp/regist/detail.jsp?id=${ UserVO.id }">마이페이지</a></c:if>
			<c:if test="${sessionScope.UserVO ne null}">|| 
			<a href="/Mission-Web/jsp/login/logout.jsp">로그아웃</a></c:if> || 
			<a href="/Mission-Web/jsp/guest/list.jsp">방명록</a></td>
		</tr>
	</table>
</body>
</html>