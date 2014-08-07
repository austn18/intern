<%@page import="kr.co.kt.board.db.BoardVO"%>
<%@page import="kr.co.kt.board.db.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>



<script>
	alert('게시물  ${param.no} 가 수정되었습니다.');
	location.href = "detail.jsp?no=${param.no}";
</script>









