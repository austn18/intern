<%@ page language="java" 
		contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    autoFlush="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here2</title>
<link rel="stylesheet" href="css/layout.css" />
<link rel="stylesheet" href="css/board.css" />
</head>
<body>
	<div id="header">
		<jsp:include page="/view/include/topMenu.jsp" />
	</div>
	<div id="content">
		컨텐트 영역
	</div>
	<div id="bottom">
		<%@ include file="/view/include/bottom.jsp" %>
	</div>
</body>
</html>