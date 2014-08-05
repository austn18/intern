<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//현재 설정된 세션 인터벌 시간 확인
	int interval = session.getMaxInactiveInterval();
	String id = session.getId();
	
	//세션의 유효시간 변경
	session.setMaxInactiveInterval(2); //유효시간 2초 변경
	int interval2 = session.getMaxInactiveInterval();
	
	//마지막으로 접근한 시간
	long time = session.getLastAccessedTime();
	Date d = new Date(time);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분 ss초");
	
%>

<h2>세션의 기존 유효 시간 : <%= interval %></h2>
<h2>세션의  유효시간: <%= interval2 %></h2>
<h2>세션의 아이디 : <%= id %></h2>
<h2>마지막 접근 시간 : <%= sdf.format(d) %></h2>