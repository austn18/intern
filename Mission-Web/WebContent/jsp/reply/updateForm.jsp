<%@page import="kr.co.kt.reply.db.ReplyVO"%>
<%@page import="kr.co.kt.reply.db.ReplyDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	ReplyDAO dao = new ReplyDAO();
	ReplyVO vo = dao.getDetail(Integer.parseInt(request.getParameter("no")));
	pageContext.setAttribute("vo", vo);
%>

<div id="header">
<jsp:include page="/jsp/include/topMenu.jsp"/>
</div>
<div id="content" align="center">
<hr width="80%">
<h2>댓글 수정</h2>
<hr width="80%">


<form name="reForm" action="/Mission-Web/jsp/reply/update.jsp" method="get" onsubmit="chkForm()">
<input type="hidden" name="no" value="${param.no}">
<input type="hidden" name="board_no" value="${ param.boardNo}">
<table width=80%>
<tr><td width="15%">${sessionScope.UserVO.id }</td><td><textarea rows="2" cols="60%" name="content">${vo.content }</textarea></td>
<td><input type="submit" name="글쓰기"></td></tr>
</table>
</form>


</div>
<div id="bottom">
<%@ include file="/jsp/include/bottom.jsp" %>
</div>

