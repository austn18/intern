<%@page import="kr.co.kt.board.db.BoardFileVO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="kr.co.kt.util.BitFileNamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.co.kt.board.db.BoardVO"%>
<%@page import="kr.co.kt.board.db.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="kr.co.kt.util.ConnectionFactory" %>    
    
<%--
		1. 사용자가 입력한 파라미터를 얻어온다.
		2. 얻어온 정보를 DB(t_board 테이블)에 저장한다.
		3. 사용자에게 메세지를 보내고 목록창으로 이동한다.
 --%>    

<%
request.setCharacterEncoding("euc-kr");

String saveFolder = "D:\\Lecture\\Web_workspace\\Mission-Web\\WebContent\\upload";

MultipartRequest multi = new MultipartRequest(
		request
		, saveFolder			// 저장될 경로
		, 1024 * 1024 * 3 		// 파일에 올릴 최대크기 : 3MB
		, "euc-kr"				// 인코딩 타입
		, new BitFileNamePolicy()
		);

// 입력한 정보를 DB에 저장
// 1. 게시물 저장
String title = multi.getParameter("title");
String writer = multi.getParameter("writer");
String content = multi.getParameter("content");

BoardDAO dao = new BoardDAO();

int boardNo = dao.selectBoardNo();

BoardVO board = new BoardVO();
board.setTitle(title);
board.setWriter(writer);
board.setContent(content);
board.setNo(boardNo);

dao.insert(board);

// 2. 게시물의 첨부파일 저장
Enumeration files =  multi.getFileNames();

while(files.hasMoreElements()) {
	
	String fileName = (String)files.nextElement();
	File f = multi.getFile(fileName);
	if(f != null) {
		
		String fileOriName = multi.getOriginalFileName(fileName);
		String fileSaveName = multi.getFilesystemName(fileName);
		
		BoardFileVO fileVO = new BoardFileVO();
		fileVO.setFileOriName(fileOriName);
		fileVO.setFileSaveName(fileSaveName);
		fileVO.setFileSize((int)f.length());
		fileVO.setBoardNo(boardNo);
		
		dao.insertFile(fileVO);
	}
}



// 파일첨부전 입력코드
// String title = request.getParameter("title");
// String writer = request.getParameter("writer");
// String content = request.getParameter("content");

// BoardDAO dao = new BoardDAO();
// BoardVO board = new BoardVO();
// board.setTitle(title);
// board.setWriter(writer);
// board.setContent(content);
//dao.insert(board);
%>

<script>
	alert('게시물이 등록되었습니다.');
	location.href = "list.jsp";
</script>























