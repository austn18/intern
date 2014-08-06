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
	1. 사용자가 입력한 파라미터를 얻어온다.
	2. 얻어온 정보를 DB(t_board 테이블)에 저장한다.
	3. 목록창으로 이동한다.    
--%>
<%
request.setCharacterEncoding("euc-kr");
String saveFolder = "D:\\lecture\\Web_workspace\\Mission-Web\\WebContent\\upload";
MultipartRequest multi = new MultipartRequest(
		request	
		, saveFolder	//저장 경로
		, 1024*1024*3	//파일에 올릴 최대 크기 : 3MB
		, "euc-kr"		//인코딩 타입
		, new BitFileNamePolicy() //파일 리네임(같은 파일 명 변경 정책)
		); 		



// 파일 첨부 전 입력 코드
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
	String fileName = (String)files.nextElement(); // 포인터를 옮김
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
	alert('게시물이 등록되었습니다.');
	location.href = "list.jsp";
</script>