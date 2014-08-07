<%@page import="kr.co.kt.board.db.BoardVO"%>
<%@page import="kr.co.kt.reply.db.ReplyDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.kt.reply.db.ReplyVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("euc-kr");

	ReplyDAO dao = new ReplyDAO();
	List<ReplyVO> totalList = dao.getList(((BoardVO)request.getAttribute("board")).getNo());
	
	request.setAttribute("reply", totalList);
	
%>
<script>
	function deleteRe(reNo, boardNo){
		if(confirm('���� ���õ� ���� �˴ϴ�. �����Ͻðڽ��ϱ�?')){
			location.href = "/Mission-Web/jsp/reply/delete.jsp?no=" + reNo + "&boardNo=" + boardNo;
		}
	}
	function update(reNo, boardNo){
			location.href = "/Mission-Web/jsp/reply/updateForm.jsp?no=" + reNo + "&boardNo=" + boardNo;
	}
</script>
<table width="80%">
<tr><th colspan="2" >���</th></tr>
<c:choose>
	<c:when test="${ empty reply }">
		<tr><td align="center" colspan="2" >������ �����ϴ�.</td></tr>
	</c:when>
	<c:otherwise>
		<c:forEach var="re" items="${ reply }">
			<tr><td>
			<c:forEach begin="1" end="${re.deps }" varStatus="chk">
			&nbsp;&nbsp; <c:if test="${chk.last}">��Re)</c:if>
			</c:forEach>
			${ re.writer } - ${re.content}</td>
			<td width="20%" align="center"> 
			<a href="/Mission-Web/jsp/reply/writeForm.jsp?linkNo=${ re.no }&boardNo=${ board.no }">[��۴ޱ�]</a><br>
			<c:if test="${ UserVO.id eq re.writer or UserVO.type eq 'S' }">
			<a href="javascript:deleteRe('${ re.no }', '${board.no}')">[����]</a> 
			<a href="javascript:update('${ re.no }', '${board.no}')">[����]</a> 
			</c:if>
			</td></tr>
		</c:forEach>
	</c:otherwise>
</c:choose>
</table>

<c:import url="/jsp/reply/writeForm.jsp"/>