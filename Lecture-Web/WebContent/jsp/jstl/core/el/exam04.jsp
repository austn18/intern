<%@page import="kr.co.kt.board.db.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
// 1. �ڹٺ��� Ŭ���� ����
BoardVO board = new BoardVO();
board.setNo(1);
board.setTitle("test");
// 2. ���������� ���
pageContext.setAttribute("board", board); // �ֵ���ǥ ����

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- ���������� ���� ��� -->
1�ܰ� <br>
no : <%= board.getNo() %><br>
title : <%= board.getTitle() %><br>

<br>2�ܰ� <br> <!-- ���� �Ⱦ� -->
board.no : <%= ((BoardVO)pageContext.getAttribute("board")).getNo() %><br>

<br>3�ܰ�(el) : <br>
board.no : ${board.no}<br> <!--  getNo() �޼ҵ� ȣ�� -->
board.title : ${pageScope.board.title}<br>
board.aaa : ${ board.aaa }<!-- �ڹٺ�� ������ ������ ���� �߻�!! -->
</body>
</html>