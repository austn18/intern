<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table border="1" width="100%">
	<tr>
		<td rowspan="2" style="width: 204px; height: 33px;">
			<a href="index.jsp">
				<img src="images/bit_logo.gif" style="border: 0px;"/>
			</a>
		</td>
		<td align="right">
			<a href="javascript:window.external.AddFavorite(
				'http://localhost:9999/mvc01', '첫번째나의웹')">
				즐겨찾기
			</a>
			<c:if test="${ not empty userVO }" >
				${ userVO.id }님으로 로그인 중입니다.
			</c:if>
		</td>
	</tr>
	<tr>
		<td>
			<c:if test="${ userVO.type eq 'S' }">
			회원관리 ||
			</c:if>
			<a href="jsp/board/list.jsp">게시판</a> ||
			<c:choose>
				<c:when test="${empty userVO}">
					회원가입 ||
					<a href="jsp/login/login.jsp">로그인</a> ||
				</c:when>
				<c:otherwise>
					마이페이지 ||
					<a href="jsp/login/logout.jsp">로그아웃</a>
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
</table>






