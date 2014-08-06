<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<c:if test="${not empty param.boardNo }">
<div id="header">
<jsp:include page="/jsp/include/topMenu.jsp"/>
</div>
<div id="content" align="center">
<hr width="80%">
<h2>댓글 달기</h2>
<hr width="80%">
</c:if>

<form name="reForm" action="/Mission-Web/jsp/reply/write.jsp" method="get" onsubmit="chkForm()">
<input type="hidden" name="link_no" value="${empty param.linkNo ? 0 : param.linkNo }">
<input type="hidden" name="board_no" value="${empty board.no ? param.boardNo : board.no}">
<table width=80%>
<tr><td width="15%">${sessionScope.UserVO.id }</td><td><textarea rows="2" cols="60%" name="content"></textarea></td>
<td><input type="submit" name="글쓰기"></td></tr>
</table>
</form>

<c:if test="${not empty param.boardNo }">
</div>
<div id="bottom">
<%@ include file="/jsp/include/bottom.jsp" %>
</div>
</c:if>

