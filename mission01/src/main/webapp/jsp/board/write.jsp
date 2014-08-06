<%@page import="kr.co.kt.board.db.BoardFileVO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="kr.co.kt.util.BitFileNamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.co.kt.login.db.LoginVO"%>
<%@page import="kr.co.kt.board.db.BoardVO"%>
<%@page import="kr.co.kt.board.db.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="kr.co.kt.util.ConnectionFactory" %>

<%--
	1. ����ڰ� �Է��� �Ķ���͸� ���´�.
	2. ���� ������ DB(t_board ���̺�)�� �����Ѵ�.
	3. ���â���� �̵��Ѵ�.    
--%>
<%
request.setCharacterEncoding("euc-kr");
String saveFolder = "D:\\lecture\\Web_workspace\\Mission-Web\\WebContent\\upload";
MultipartRequest multi = new MultipartRequest(
		request	
		, saveFolder	//���� ���
		, 1024*1024*3	//���Ͽ� �ø� �ִ� ũ�� : 3MB
		, "euc-kr"		//���ڵ� Ÿ��
		, new BitFileNamePolicy() //���� ������(���� ���� �� ���� ��å)
		); 		



// ���� ÷�� �� �Է� �ڵ�
BoardVO board = new BoardVO();
// String title = request.getParameter("title");
// String content = request.getParameter("content");
board.setTitle(multi.getParameter("title"));
board.setWriter(((LoginVO)session.getAttribute("UserVO")).getId());
board.setContent(multi.getParameter("content"));
BoardDAO dao = new BoardDAO();
int seqNo = dao.seqNo(); 
board.setNo(seqNo);
dao.insert(board);

Enumeration files = multi.getFileNames();

while(files.hasMoreElements()){
	String fileName = (String)files.nextElement(); // �����͸� �ű�
	File f = multi.getFile(fileName);
	if(f != null){
		String fileOriName = multi.getOriginalFileName(fileName);
		String fileSaveName = multi.getFilesystemName(fileName);
		
		BoardFileVO fileVO = new BoardFileVO();
		fileVO.setFileOriName(fileOriName);
		fileVO.setFileSaveName(fileSaveName);
		fileVO.setFileSize((int)f.length());
		fileVO.setBoardNo(seqNo);
		
		dao.insertFile(fileVO);
		
	}
}
%>

<script>
	alert('�Խù��� ��ϵǾ����ϴ�.');
	location.href = "list.jsp";
</script>