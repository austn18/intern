<%@page import="kr.co.kt.board.db.BoardVO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	Map m = new HashMap(); 
	List l = new ArrayList();
	BoardVO bv = new BoardVO();
	bv.setTitle("성공2");
	m.put("title", "성공");
	l.add(m);
	l.add(bv);
	
	pageContext.setAttribute("boardList", l);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	boardList[0].title : ${boardList[0].title }<br>
	boardList[1].title : ${boardList[1].title }
</body>
</html>