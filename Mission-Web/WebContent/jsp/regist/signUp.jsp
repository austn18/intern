<%@page import="kr.co.kt.member.db.MemberDAO"%>
<%@page import="kr.co.kt.member.db.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="kr.co.kt.util.ConnectionFactory" %>
<%
request.setCharacterEncoding("euc-kr");

MemberVO mv = new MemberVO();
MemberDAO member = new MemberDAO();

String id = request.getParameter("id");
String name = request.getParameter("name");
String password = request.getParameter("password");
String email_id = request.getParameter("email_id");
String email_domain = request.getParameter("email_domain");
String tel1 = request.getParameter("tel1");
String tel2 = request.getParameter("tel2");
String tel3 = request.getParameter("tel3");
String post = request.getParameter("post");
String basic_addr = request.getParameter("basic_addr");
String detail_addr = request.getParameter("detail_addr");

mv.setId(id);
mv.setName(name);
mv.setPassword(password);
mv.setEmail_id(email_id);
mv.setEmail_domain(email_domain);
mv.setTel1(tel1);
mv.setTel2(tel2);
mv.setTel3(tel3);
mv.setPost(post);
mv.setBasic_addr(basic_addr);
mv.setDetail_addr(detail_addr);

boolean chk = member.insert(mv);
pageContext.setAttribute("chk",chk);


%>
<script>
	if( ${chk}){
		alert('아이디가 등록되었습니다.');
		location.href = "/Mission-Web/index.jsp";
	}else{
		alert('아이디가 존재합니다.');
		history.back();
	}
</script>





