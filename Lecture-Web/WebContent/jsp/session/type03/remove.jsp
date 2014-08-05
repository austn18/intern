<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//세션 무효화
	session.invalidate();
%>

<h2>세션이 삭제되었습니다.</h2>
<a href="get.jsp">삭제 후 세션 확인</a>