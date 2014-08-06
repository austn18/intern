<%@page import="kr.co.kt.reply.db.ReplyDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("euc-kr");
	ReplyDAO dao = new ReplyDAO();
	dao.delete(Integer.parseInt(request.getParameter("boardNo")) , 
			Integer.parseInt(request.getParameter("no")));
%>
<script>
	alert('글을 삭제하였습니다.');
	location.href = "/Mission-Web/jsp/board/detail.jsp?no=${param.board_no}";
</script>