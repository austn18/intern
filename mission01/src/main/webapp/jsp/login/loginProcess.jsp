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
		
		if(lv.getType().toUpperCase().equals('S')) msg = "�����ڴ� ȯ���մϴ�.";
		else msg = lv.getId() + "�� ȯ���մϴ�.";
		url = "/Mission-Web";
	}else {
		msg = "ID �Ǵ� PASSWORD�� �߸� �ԷµǾ����ϴ�.";
		url = "login.jsp";
	}
%>
<script>
	alert('<%=msg%>');
	location.href = "<%=url%>";
</script>
