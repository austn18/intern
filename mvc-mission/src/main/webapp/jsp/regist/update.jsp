<%@page import="kr.co.kt.member.db.MemberDAO"%>
<%@page import="kr.co.kt.member.db.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="kr.co.kt.util.ConnectionFactory" %>
<%
request.setCharacterEncoding("euc-kr");

MemberVO mv = new MemberVO();

mv.setId(request.getParameter("id"));
mv.setName(request.getParameter("name"));
mv.setPassword(request.getParameter("password"));
mv.setEmail_id(request.getParameter("email_id"));
mv.setEmail_domain(request.getParameter("email_domain"));
mv.setTel1(request.getParameter("tel1"));
mv.setTel2(request.getParameter("tel2"));
mv.setTel3(request.getParameter("tel3"));
mv.setPost(request.getParameter("post"));
mv.setBasic_addr(request.getParameter("basic_addr"));
mv.setDetail_addr(request.getParameter("detail_addr"));

MemberDAO dao = new MemberDAO();
boolean chk = dao.update(mv); 
pageContext.setAttribute("chk",chk);
%>

<script>
	if(${chk}){
		alert('id ${param.id} 가 수정되었습니다.');
		location.href = "list.jsp";
	}else{
		alert('id ${param.id} 수정에 실패 하였습니다..');
		history.back();
	}
	
</script>



