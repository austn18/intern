<%@page import="kr.co.kt.login.db.LoginVO"%>
<%@page import="kr.co.kt.login.db.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

	request.setCharacterEncoding("euc-kr");

	LoginDAO dao = new LoginDAO();
	LoginVO loginVO = new LoginVO();
	
	loginVO.setId(request.getParameter("id"));
	loginVO.setPassword(request.getParameter("password"));
	
	LoginVO lv = dao.login(loginVO);
	String msg = "";
	String url = "";
	
	if(lv != null){
		session.setAttribute("UserVO", lv );
		
		if(lv.getType().toUpperCase().equals('S')) msg = "관리자님 환영합니다.";
		else msg = lv.getId() + "님 환영합니다.";
		url = "/Mission-Web";
	}else {
		msg = "ID 또는 PASSWORD가 잘못 입력되었습니다.";
		url = "login.jsp";
	}
%>
<script>
	alert('<%=msg%>');
	location.href = "<%=url%>";
</script>
