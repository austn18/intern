<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");

	String cName = request.getParameter("cName");
	cName = URLEncoder.encode(cName, "euc-kr");
	
	String cValue = request.getParameter("cValue");
	cValue = URLEncoder.encode(cValue, "euc-kr");
	
	String cAge = request.getParameter("cAge");
	
	//쿠키 생성
	Cookie cookie = new Cookie(cName, cValue);
	// 유효시간 설정
	try{
		cookie.setMaxAge(Integer.parseInt(cAge) * 60);
	}catch(Exception e){
		
	}
	//쿠키 전송(to Client)
	response.addCookie(cookie);
%>
<h1>쿠키 설정 완료</h1>
<a href="get.jsp">설정된 쿠키 확인</a>