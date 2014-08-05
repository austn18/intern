<%@page import="java.util.List"%>
<%@page import="kr.co.kt.member.db.MemberVO"%>
<%@page import="kr.co.kt.member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="kr.co.kt.util.ConnectionFactory" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
MemberDAO dao = new MemberDAO();
List<MemberVO> list = dao.selectAll();

pageContext.setAttribute("list", list);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/Mission-Web/css/layout.css"/>
<link rel="stylesheet" href="/Mission-Web/css/board.css"/>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 목록</title>
</head>
<body>


<div id="header">
<jsp:include page="/jsp/include/topMenu.jsp"/>
</div>
<div id="content">
<div align="center">
<hr width="80%">
<h2>회원 목록</h2>
<hr width="80%">
<table width="80%"  align="center"  class="list">
	<tr>
	<th width="15%">아이디</th>
	<th width="15%">이름</th>
	<th width="30%">이메일</th>
	<th>전화번호</th>
	<th width="15%">가입일자</th>
	</tr>
	<c:forEach var="board" items="${ list }">
	<tr <c:if test="${ loop.count mod 2 == 0 }">class="even"</c:if>>
	<td align="center"><a href="detail.jsp?id=${board.id}"><c:out value="${board.id}" /></a></td>
	<td align="center">${board.name}</td>
	<td align="center">${board.email_id}@${board.email_domain}</td>
	<td align="center">${board.tel1}-${board.tel2}-${board.tel3}</td>
	<td align="center">${board.reg_date}</td>
	</tr>
	</c:forEach>

	
	
	
</table>
<hr width="80%">
</div>
</div>
<div id="bottom">
<%@ include file="/jsp/include/bottom.jsp" %>
</div>

</body>
</html>