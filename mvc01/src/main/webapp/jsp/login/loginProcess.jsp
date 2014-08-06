<%@page import="kr.co.kt.login.db.LoginDAO"%>
<%@page import="kr.co.kt.login.db.LoginVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");

	// 요청객체에서 정보를 얻어와 VO에 설정
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	LoginVO loginVO = new LoginVO();
	loginVO.setId(id);
	loginVO.setPassword(password);
	
	// 로그인 수행(DB) 
	// login() 리턴값          null : 실패
	//               not null : 성공
	LoginDAO dao = new LoginDAO();
	LoginVO userVO = dao.login(loginVO);
	
	String msg = "";
	String url = "";
	
	if(userVO != null) {
		
		session.setAttribute("userVO", userVO);
		
		if(userVO.getType().equalsIgnoreCase("S")) {
			msg = "관리자님 환영합니다	";
		} else {
			msg = userVO.getId() + "님 환영합니다.";
		}
		
		url = "/Mission-Web";
		
	} else {
		msg = "ID 또는 PASSWORD가 잘못 입력되었습니다";
		url = "login.jsp";
	}
%>

<script>
	alert('<%= msg %>');
	location.href = "<%= url %>";
</script>

ss












