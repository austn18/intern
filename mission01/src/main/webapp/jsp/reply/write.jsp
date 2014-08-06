<%@page import="kr.co.kt.login.db.LoginVO"%>
<%@page import="kr.co.kt.reply.db.ReplyDAO"%>
<%@page import="kr.co.kt.reply.db.ReplyVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("euc-kr");

	ReplyDAO dao = new ReplyDAO();
	ReplyVO reply = new ReplyVO();
	String writer = ((LoginVO)session.getAttribute("UserVO")).getId();
	String content = (String)request.getParameter("content");
	int link_no = Integer.parseInt(request.getParameter("link_no"));
	int board_no = Integer.parseInt(request.getParameter("board_no"));
	int deps = 0;
	if(link_no != 0) {
		deps = dao.getDeps(link_no)+1;
	}
	reply.setWriter(writer);
	reply.setContent(content);
	reply.setLink_no(link_no);
	reply.setBoard_no(board_no);
	reply.setDeps(deps);
	
	dao.insert(reply);
%>

<script>
	alert('글을 등록하였습니다.');
	location.href = "/Mission-Web/jsp/board/detail.jsp?no=${param.board_no}";
</script>
