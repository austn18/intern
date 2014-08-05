<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

//name이 같으면 덮어쓰기한다.(map)
	request.setCharacterEncoding("euc-kr");
/* 	Cookie c1 = new Cookie("type1", URLEncoder.encode("/ 루트설정", "euc-kr"));
	c1.setPath("/");
	c1.setMaxAge(0); */
	
	Cookie c1 = new Cookie("type1", URLEncoder.encode("아아아아아아아아아", "euc-kr"));
	c1.setPath("/");
	
	Cookie c2 = new Cookie("type2", URLEncoder.encode("/Lecture-Web/jsp/cookie 루트설정", "euc-kr"));
	c2.setPath("/Lecture-Web/jsp/cookie");
	c2.setMaxAge(0);
	
	Cookie c3 = new Cookie("type3", URLEncoder.encode("/Lecture-Web/jsp/cookie/type03 루트설정", "euc-kr"));
	c3.setPath("/Lecture-Web/jsp/cookie/type03");
	c3.setMaxAge(0);
	
	Cookie c4 = new Cookie("type4", URLEncoder.encode("/Lecture-Web/jsp/cookie/type04 루트설정", "euc-kr"));
	c4.setPath("/Lecture-Web/jsp/cookie/type04");
	c4.setMaxAge(0);
	
	response.addCookie(c1);
	response.addCookie(c2);
	response.addCookie(c3);
	response.addCookie(c4);
%>

<script>
	location.href = "get.jsp";
</script>