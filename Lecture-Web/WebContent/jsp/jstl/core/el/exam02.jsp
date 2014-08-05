<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% String [] hobbys = request.getParameterValues("hobby");
//하비의 모든 값을 배열형태로 가저옴
if(hobbys == null) hobbys = new String[]{"파라미터 없음"};
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!-- param 에 값이 없을시 "" 값을 보여주지만
	request 방식은 null 이 나옴 => el 이 더 좋다. -->
	id ?? <%= request.getParameter("id") %><br/>
	el id ?? ${ param.id }<br/>
	name ?? <%= request.getParameter("name") %><br/>
	el name ?? ${ param.name }<br/>
	<!-- 같은 인자가 여러번 들어올때 -->
	hobbys[0] : <%= hobbys[0] %><br/>
	el hobbys[0] : ${ paramValues.hobby[0] }<br/> 
	<!-- null 이 찍히지 않는다. -->
</body>
</html>