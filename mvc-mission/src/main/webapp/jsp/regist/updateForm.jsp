<%@page import="kr.co.kt.member.db.MemberVO"%>
<%@page import="kr.co.kt.member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="kr.co.kt.util.ConnectionFactory" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%


String id = request.getParameter("id");
MemberDAO dao = new MemberDAO();
MemberVO member = dao.selectByNo(id);
pageContext.setAttribute("member", member);

%>
<script>
function doList(){
	location.href = "list.jsp";
}
function chkForm(){
	//alert(document.sform.password.value);
	
	var f = document.sform;
 	var na = [f.name, f.password, f.cpassword, f.email_id, f.email_domain, 
 	          f.tel1, f.tel2, f.tel3, f.post, f.basic_addr, f.detail_addr];
 	
  	for(var i = 0 ; i < na.length ; i++){
		  if(na[i].value == '') {
			var al = '';
			switch(i){
			case 0:
				al = '이름을 ';
				break;
			case 1:
				al = '비밀번호를 ';
				break;
			case 2:
				al = '비밀번호 확인을 ';
				break;
			case 3:
			case 4:
				al = '메일주소를 ';
				break;
			case 5:
			case 6:
			case 7:
				al = '전화번호를 ';
				break;
			case 8:
			case 9:
			case 10:
				al = '주소를 ';
				break;
			}
			al += '기입하지 않았습니다.';
			alert(al);
			na[i].focus();  
			return false;
		}  
		
	}  
 	if(f.password.value != f.cpassword.value){
		alert('비밀번호가 다릅니다.');
		f.password.value = '';
		f.cpassword.value = '';
		return false;
	} 
	
	//return true;
}
</script>
<link rel="stylesheet" href="/Mission-Web/css/layout.css"/>
<link rel="stylesheet" href="/Mission-Web/css/board.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<div id="header">
<jsp:include page="/jsp/include/topMenu.jsp"/>
</div>
<div id="content">
<hr width="700px;" />
	<center>
		<h2>회원수정</h2>
	</center>
	<hr width="700px;" />
	<form name="sform" action="update.jsp" method="post" onsubmit="return chkForm()">
		<input type="hidden" name="id" value="${ param.id }">

 		<table align="center" width="80%" border="0" class="list">
			<tr>
				<td width="20%">&nbsp;아이디</td>
				<td>${ param.id }</td>
			</tr>
			<tr>
				<td>&nbsp;이름</td>
				<td><input type="text" name="name" value="${ member.name }"></td>
			</tr>
			<tr>
				<td>&nbsp;비밀번호</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td>&nbsp;비밀번호 확인</td>
				<td><input type="password" name="cpassword"></td>
			</tr>
			<tr>
				<td>&nbsp;이메일</td>
				<td><input type="text" name="email_id" value="${ member.email_id }"> @ <input
					type="text" name="email_domain" value="${ member.email_domain }"></td>
			</tr>
			<tr>
				<td>&nbsp;전화번호</td>
				<td><input type="text" name="tel1" size="3" value="${ member.tel1 }"> - <input
					type="text" name="tel2" size="4" value="${ member.tel2 }"> - <input type="text"
					name="tel3" size="4"  value="${ member.tel3 }"></td>
			</tr>
			<tr>
				<td rowspan="3">&nbsp;주소</td>
				<td>우편번호&nbsp;<input type="text" name="post" size="7" value="${ member.post }"></td>
			</tr>
			<tr>
				<td>주소 &nbsp;1&nbsp;<input size="60" type="text" name="basic_addr" value="${ member.basic_addr }"></td>
			</tr>
			<tr>
				<td>주소 &nbsp;2&nbsp;<input size="60" type="text" name="detail_addr" value="${ member.detail_addr }"></td>
			</tr>
		</table>
		<hr width="700px;" />
		<center>
			<input type="submit" value="수정">
			<input type="button" value="목록으로 이동" onclick="doList()">
		</center>
	</form>
</div>
<div id="bottom">
<%@ include file="/jsp/include/bottom.jsp" %>
</div>


</body>
</html>