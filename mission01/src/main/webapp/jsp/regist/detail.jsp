<%@page import="kr.co.kt.member.db.MemberVO"%>
<%@page import="kr.co.kt.member.db.MemberDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="kr.co.kt.util.ConnectionFactory" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String id = request.getParameter("id");
MemberDAO dao = new MemberDAO();
MemberVO member = dao.selectByNo(id);
pageContext.setAttribute("member", member);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/Mission-Web/css/layout.css"/>
<link rel="stylesheet" href="/Mission-Web/css/board.css"/>
<script>
	
	function doAction(type){
		switch(type){
		case 'U' :
			location.href="updateForm.jsp?id=${param.id}";
			break;
		case 'D' :
			if(!confirm('�����Ͻðڽ��ϱ�?')){
				return false;
			}
			location.href="delete.jsp?id=${param.id}";	
			break;
		case 'L' :
			location.href="list.jsp";
			break;
		}
		
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<div id="header">
<jsp:include page="/jsp/include/topMenu.jsp"/>
</div>
<div id="content">
<hr width="80%" />
	<center>
		<h2>ȸ�� ����</h2>
	</center>
	<hr width="80%" />
	<table align="center" width="80%" border="0" class="list">
		<tr>
			<td width="20%">&nbsp;<b>���̵� </b>: ${member.id}</td>
			<td><b> Ÿ�� </b>: ${member.type}</td>
		</tr>
		<tr>
			<td width="20%">&nbsp;<b>��������</b></td>
			<td>${member.reg_date}</td>
		</tr>
		<tr>
			<td>&nbsp;<b>�̸�</b></td>
			<td>${member.name}</td>
		</tr>
		<tr>
			<td>&nbsp;<b>��й�ȣ</b></td>
			<td>${member.password}</td>
		</tr>
		<tr>
			<td>&nbsp;<b>�̸���</b></td>
			<td>${member.email_id}@${member.email_domain}</td>
		</tr>
		<tr>
			<td>&nbsp;<b>��ȭ��ȣ</b></td>
			<td>${member.tel1}-${member.tel2}-${member.tel3}</td>
		</tr>
		<tr>
			<td rowspan="3">&nbsp;<b>�ּ�</b></td>
			<td><b>�����ȣ</b>&nbsp;: ${member.post}</td>
		</tr>
		<tr>
			<td><b>�ּ� &nbsp;1&nbsp;</b>: ${member.basic_addr}</td>
		</tr>
		<tr>
			<td><b>�ּ� &nbsp;2&nbsp;</b>: ${member.detail_addr}</td>
		</tr>
		
	</table>
	<hr width="80%" />
	<center>
	
		<c:if test="${UserVO.id eq param.id}">
		<input type="button" value="����" onclick="doAction('U')"></c:if>
		<c:if test="${UserVO.type eq 'S' && param.id ne UserVO.id}">
		<input type="button" value="����" onclick="doAction('D')"></c:if>
		<c:if test="${UserVO.type eq 'S'}">
		<input type="button" value="������� �̵�" onclick="doAction('L')"></c:if>
	</center>
</div>
<div id="bottom">
<%@ include file="/jsp/include/bottom.jsp" %>
</div>
	
</body>
</html>