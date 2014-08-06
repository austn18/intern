<%@ page language="java" 
		contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    autoFlush="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here2</title>
<link rel="stylesheet" href="css/layout.css" />
<link rel="stylesheet" href="css/board.css" />
</head>
<body>
	<div id="header">
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</div>
	<div id="content">
		컨텐트 영역
	</div>
	<div id="bottom">
		<%@ include file="/jsp/include/bottom.jsp" %>
	</div>
</body>
</html>