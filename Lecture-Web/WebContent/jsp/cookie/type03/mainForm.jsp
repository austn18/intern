<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="set.jsp" method="post">
		쿠키이름 : <input type="text" name="cName" size="20"/> <br/>
		쿠키값 : <input type="text" name="cValue" size="20"/> <br/>
		유효시간(분) : <input type="text" name="cAge" size="20"/> <br/>
		<input type="submit" value="쿠키설정"/ >
	</form>
</body>
</html>