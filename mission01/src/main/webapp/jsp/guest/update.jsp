<%@page import="kr.co.kt.guest.db.GuestDAO"%>
<%@page import="kr.co.kt.guest.db.GuestVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	int no = Integer.parseInt((String)request.getParameter("no"));

	GuestVO guest = new GuestVO();
	GuestDAO dao = new GuestDAO();
	
	guest.setName(request.getParameter("name"));
	guest.setPassword(request.getParameter("password"));
	guest.setEmail(request.getParameter("email"));
	guest.setContent(request.getParameter("content"));
	guest.setGuestbook_id(no);
	
	boolean chk = false;
	
	if(guest.getPassword().equals(dao.getGuestBook(no).getPassword())) {
		dao.update(guest);
		chk = true;
	}
%> 

<script>
	if(<%= chk %>){
		alert('���� �����Ǿ����ϴ�..');
		location.href = "list.jsp";
	}else{
		alert('��ȣ�� �ٸ��ϴ�.');
		history.back();
	}
</script>
