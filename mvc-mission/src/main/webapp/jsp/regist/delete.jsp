<%@page import="kr.co.kt.member.db.MemberDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.kt.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
String id = request.getParameter("id");
MemberDAO dao = new MemberDAO();
boolean chk = dao.delete(id);
pageContext.setAttribute("chk",chk);
%>

<script>
	if(${chk}){
		alert('id ${param.id} 가 삭제되었습니다.');
		location.href = "list.jsp";
	}else{
		alert('id ${param.id} 삭제에 실패 하였습니다..');
		history.back();
	}
</script>
