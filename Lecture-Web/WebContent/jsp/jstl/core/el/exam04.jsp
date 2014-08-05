<%@page import="kr.co.kt.board.db.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
// 1. 자바빈즈 클래스 생성
BoardVO board = new BoardVO();
board.setNo(1);
board.setTitle("test");
// 2. 공유영역에 등록
pageContext.setAttribute("board", board); // 쌍따옴표 주의

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 공유영역의 값을 사용 -->
1단계 <br>
no : <%= board.getNo() %><br>
title : <%= board.getTitle() %><br>

<br>2단계 <br> <!-- 거의 안씀 -->
board.no : <%= ((BoardVO)pageContext.getAttribute("board")).getNo() %><br>

<br>3단계(el) : <br>
board.no : ${board.no}<br> <!--  getNo() 메소드 호출 -->
board.title : ${pageScope.board.title}<br>
board.aaa : ${ board.aaa }<!-- 자바빈즈에 변수가 없으면 에러 발생!! -->
</body>
</html>