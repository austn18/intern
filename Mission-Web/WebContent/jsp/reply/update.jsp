<%@page import="kr.co.kt.reply.db.ReplyVO"%>
<%@page import="kr.co.kt.reply.db.ReplyDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	ReplyDAO dao = new ReplyDAO();
	ReplyVO vo = new ReplyVO();
	vo.setNo(Integer.parseInt(request.getParameter("no")));
	vo.setContent(request.getParameter("content"));
	dao.update(vo);
%>

<script>
	alert('글을 수정하였습니다.');
	location.href = "/Mission-Web/jsp/board/detail.jsp?no=${param.board_no}";
</script>