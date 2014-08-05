<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.kt.guest.db.GuestVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.kt.guest.db.GuestDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% 
 	int max = 5;
	request.setCharacterEncoding("euc-kr");
	GuestDAO dao = new GuestDAO();
	List<GuestVO> totalList = dao.getList();
	List<GuestVO> list = new ArrayList<GuestVO>();
	int index = 1;
	if(request.getParameter("cnt") != null) 
		index += (Integer.parseInt(request.getParameter("cnt"))-1)*max;
	try{
		for(int i = 0 ; i < max ; i ++){
			list.add(totalList.get(index + i - 1));
		}
	}catch(Exception e){
		
	}
	
	int count = ((totalList.size()-1) / max) + 1;
	
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("count", count);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/Lecture-Web/css/board.css" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<div id="header">
<jsp:include page="/jsp/include/topMenu.jsp"/>
</div>
<div id="content">
			<hr width="80%">
			<center><h2>방명록</h2></center>
			<hr width="80%">
	<br>
	<table width="80%" align="center">
	<tr><td><a href="writeForm.jsp">글쓰기</a></td></tr>
		<c:choose>
			<c:when test="${ empty list }">
				<tr>
					<td>방명록에 저장된 글이 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="element" items="${ list }">
					<tr>
						<td><b>${ element.name }(${element.email})</b> - ${ element.register}
						<a href="updateForm.jsp?no=${element.guestbook_id }">[수정]</a>
						<a href="deleteForm.jsp?no=${element.guestbook_id }">[삭제]</a>
						</td>
					</tr>
					<tr>
						<td>
						${element.content }
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<hr width="80%">
	<center>
	<c:forEach var="i" begin="1" end="${count}">
		<c:choose>
			<c:when test="${ param.cnt eq i}">${i}</c:when>
			<c:when test="${ empty param.cnt and i eq 1}">${i }</c:when>
			<c:otherwise><a href="list.jsp?cnt=${i }">${i} </a></c:otherwise>
		</c:choose>
		
	</c:forEach>
	</center>
	<br>

</div>
<div id="bottom">
<%@ include file="/jsp/include/bottom.jsp" %>
</div>
	

</body>
</html>