<%@page import="kr.co.kt.board.db.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.kt.board.db.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%-- 	<%@ page import="java.sql.Connection, java.sql.PreparedStatement" %> --%>
<%-- 	<%@ page import="java.sql.PreparedStatement" %>	 --%>
<%@ page import="java.sql.*"%>
<%@ page import="kr.co.kt.util.ConnectionFactory"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
	�Խù� ��� ��ȸ ����
	1. �����ͺ��̽��κ��� �Խù��� ��ȸ(t_board)
	2. ȭ�鿡 ��ȸ�� �Խù��� ���
 --%>
<%
	request.setCharacterEncoding("euc-kr");
	BoardDAO dao = new BoardDAO();
	List<BoardVO> list;
	String val = "";
	String nam = request.getParameter("searchType");
	request.setAttribute("nam", nam);
	if(nam == null) {
		list = dao.selectAll();
	}
	else {
		val = request.getParameter("searchWord");
		list = dao.selectSearch(nam, val); 
	}
	
	
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/Mission-Web/css/layout.css" />
<link rel="stylesheet" href="/Mission-Web/css/board.css" />
<script type="text/javascript">
	
	function goFirst(){
		location.href = "list.jsp";
	}
	function chkForm() {
		var count = 0;
		var length = document.delForm.del.length;
		for (var i = 0; i < length; i++) {
			if (document.delForm.del[i].checked) {
				count++;
			}
		}
		if (count == 0 && document.delForm.del.value == null) {
			alert('���õ� ������ �����ϴ�.');
			return false;
		} else {
			if (confirm('���õ� ���� ���� �Ͻðڽ��ϱ�?')) {
				return true;
			}
		}
		return false;
	}
	function toggle(state) {
		var f = document.delForm;
		//checkbox �迭�� �ν�(����) - length
		var length = document.delForm.del.length;
		for (var i = 0; i < length; i++) {
			f.del[i].checked = state;
		}

	}
	function goWriteForm() {
		location.href = "writeForm.jsp";
	}
	function doAction(boardNO) {
		<c:choose>
		<c:when test="${not empty UserVO}">
		location.href = "detail.jsp?type=list&no=" + boardNO;
		</c:when>
		<c:otherwise>
		if (confirm('�α��� �Ͻðڽ��ϱ�?')) {
			location.href = "/Mission-Web/jsp/login/login.jsp";
		}

		</c:otherwise>
		</c:choose>

	}
	function chkSearch() {
		var selBox = document.sForm.searchType; //�ɼǰ� : �迭

		if (selBox.options[selBox.selectedIndex].value == "") {
			alert('�˻��׸��� �����ϼ���');
			return false;
		} else {
			if (document.sForm.searchWord.value == "") {
				alert('�˻�Ű���带 �Է��ϼ���.');
				return false;
			} 
		}
		return true;
	}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>�Խ��� ���</title>
</head>
<body>
	<div id="header">
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</div>
	<div id="content">
		<div align="center">
			<hr width="80%">
			<h2>�Խ��� ���</h2>
			<hr width="80%">

			<form name="delForm" action="/Mission-Web/jsp/board/deleteCheck.jsp"
				method="post" onsubmit="return chkForm()">
				<table width="80%" align="center" class="list">

					<tr>
						<c:if test="${UserVO.type eq 'S' }">
							<th width="4%"><input type="checkbox" name="chkAll"
								onclick="toggle(this.checked)" /></th>
						</c:if>
						<th width="7%">��ȣ</th>
						<th>����</th>
						<th width="16%">�۾���</th>
						<th width="20%">��¥</th>
					</tr>

					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="4">���� �����ϴ�.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="board" items="${ list }">
								<tr <c:if test="${ loop.count mod 2 == 0 }">class="even"</c:if>>
									<c:if test="${UserVO.type eq 'S' }">
										<td><input type="checkbox" name="del" value="${board.no}"></td>
									</c:if>
									<td>${ board.no }</td>
									<td><a href="javascript:doAction('${board.no}')"> <c:out
												value="${ board.title }" />
									</a></td>
									<td>${ board.writer }</td>
									<td>${ board.regDate }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>





				</table>

				<hr width="80%">

				<c:if test="${not empty sessionScope.UserVO}">
					<input type="button" value="���۵��" onclick="goWriteForm()">
				</c:if>
				<c:if test="${UserVO.type eq 'S' }">
					<input type="submit" value="���û���">
				</c:if>
			</form>
			<form name="sForm" action=""
				onsubmit="return chkSearch()">
				<select name="searchType">
					<option value="">�����ϼ���</option>
					<option value="title">����</option>
					<option value="writer">�۾���</option>
				</select> <input type="text" name="searchWord" size="40" value="<%=val%>" />&nbsp;
				<input type="submit" value="�˻�">
				<c:if test="${not empty nam}">
				<input type="button" value="���" onclick="goFirst()">
				</c:if>
			</form>


		</div>
</body>
</div>
<div id="bottom">
	<%@ include file="/jsp/include/bottom.jsp"%>
</div>


</html>