<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

//name�� ������ ������Ѵ�.(map)
	request.setCharacterEncoding("euc-kr");
/* 	Cookie c1 = new Cookie("type1", URLEncoder.encode("/ ��Ʈ����", "euc-kr"));
	c1.setPath("/");
	c1.setMaxAge(0); */
	
	Cookie c1 = new Cookie("type1", URLEncoder.encode("�ƾƾƾƾƾƾƾƾ�", "euc-kr"));
	c1.setPath("/");
	
	Cookie c2 = new Cookie("type2", URLEncoder.encode("/Lecture-Web/jsp/cookie ��Ʈ����", "euc-kr"));
	c2.setPath("/Lecture-Web/jsp/cookie");
	c2.setMaxAge(0);
	
	Cookie c3 = new Cookie("type3", URLEncoder.encode("/Lecture-Web/jsp/cookie/type03 ��Ʈ����", "euc-kr"));
	c3.setPath("/Lecture-Web/jsp/cookie/type03");
	c3.setMaxAge(0);
	
	Cookie c4 = new Cookie("type4", URLEncoder.encode("/Lecture-Web/jsp/cookie/type04 ��Ʈ����", "euc-kr"));
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