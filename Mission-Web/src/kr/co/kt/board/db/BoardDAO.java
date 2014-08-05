package kr.co.kt.board.db;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.kt.util.ConnectionFactory;
import kr.co.kt.util.JDBCClose;

/**
 * 게시판 등록, 수정, 삭제, 조회(CRUD)
 * @author bitacademy
 *
 */

public class BoardDAO {
	public List<BoardVO> selectSearch(String name, String value){
		List<BoardVO> list = new ArrayList<>();
		Connection con = new ConnectionFactory().getConnection();

		StringBuilder sql = new StringBuilder();

		sql.append("select no, title, writer, ");
		sql.append(" to_char(reg_date, 'yyyy-mm-dd') reg_date ");
		sql.append(" from t_board ");
		sql.append(" where "+name+" like '%" + value + "%' ");
		sql.append(" order by no desc ");
		System.out.println(sql.toString());
		PreparedStatement pstmt = null;
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			//pstmt.setString(1, name);
			//pstmt.setString(2, value);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String regDate = rs.getString("reg_date");
				
				BoardVO board = new BoardVO();
				board.setNo(no);
				board.setTitle(title);
				board.setWriter(writer);
				board.setRegDate(regDate);
				
				list.add(board);
			}	
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCClose.close(con, pstmt);
		}
		return list;

	}
	
	public List<BoardVO> selectAll(){
		List<BoardVO> list = new ArrayList<>();
		Connection con = new ConnectionFactory().getConnection();

		StringBuilder sql = new StringBuilder();

		sql.append("select no, title, writer, ");
		sql.append(" to_char(reg_date, 'yyyy-mm-dd') reg_date ");
		sql.append(" from t_board ");
		sql.append(" order by no desc ");

		PreparedStatement pstmt = null;
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String regDate = rs.getString("reg_date");
				
				BoardVO board = new BoardVO();
				board.setNo(no);
				board.setTitle(title);
				board.setWriter(writer);
				board.setRegDate(regDate);
				
				list.add(board);
			}	
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCClose.close(con, pstmt);
		}
		return list;

	}
	public int seqNo(){
		Connection con = new ConnectionFactory().getConnection();
		PreparedStatement pstmt = null; 
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT SEQ_T_BOARD_NO.NEXTVAL FROM dual");
		
		int seqNo = 0;
		try {
			pstmt = con.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			seqNo = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCClose.close(con, pstmt);
		}
		return seqNo;
	}
	public BoardVO selectByNo(int no){
		BoardVO board = new BoardVO();
		Connection con = new ConnectionFactory().getConnection();
		PreparedStatement pstmt = null; 
		
		
		StringBuilder sql = new StringBuilder();

		
		sql.append("select no, title, writer, content, view_cnt, ");
		sql.append(" to_char(reg_date, 'yyyy-mm-dd') reg_date ");
		sql.append(" from t_board ");
		sql.append(" where no = ?");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			board.setNo(no);
			board.setTitle(rs.getString("title"));
			board.setWriter(rs.getString("writer"));
			board.setContent(rs.getString("content"));
			board.setViewCnt(rs.getInt("view_cnt"));
			board.setRegDate(rs.getString("reg_date"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCClose.close(con, pstmt);
		}
		return board;
	}
	public void insert(BoardVO board){
		Connection con = new ConnectionFactory().getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append("insert into t_board(no, title, writer, content, view_cnt )");
		sql.append(" values(?, ?, ?, ?, 0)");
		PreparedStatement pstmt = null;
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, board.getNo());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getWriter());
			pstmt.setString(4, board.getContent());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCClose.close(con, pstmt);
		} 
	}
	public void updateViewCnt(int no){
		Connection con = new ConnectionFactory().getConnection();
		PreparedStatement pstmt = null; 
		StringBuilder sql = new StringBuilder();

		try {
			sql.append("UPDATE T_BOARD SET view_cnt = view_cnt+1 WHERE NO = ?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			int cnt = pstmt.executeUpdate();
			System.out.println(cnt);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}finally{
			JDBCClose.close(con, pstmt);
		} 
	}
	public void update(BoardVO board){
		Connection con = new ConnectionFactory().getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append("UPDATE T_BOARD SET title = ?, writer = ?, CONTENT = ?, reg_date = sysdate WHERE NO = ?");
		PreparedStatement pstmt = null;

		 try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getWriter());
			pstmt.setString(3, board.getContent());
			pstmt.setInt(4, board.getNo());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void delete(int no){
		Connection con = new ConnectionFactory().getConnection();
		StringBuilder sb = new StringBuilder();
		PreparedStatement pstmt = null;
		
		sb.append("delete t_board where no = "+no);
		try {
			pstmt = con.prepareStatement(sb.toString());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCClose.close(con, pstmt);
		}
		
	}	
	public void deleteFile(int BoardNo){
		Connection con = new ConnectionFactory().getConnection();
		StringBuilder sb = new StringBuilder();
		PreparedStatement pstmt = null;
		
		sb.append("delete t_board_file where board_no = "+BoardNo);
		try {
			pstmt = con.prepareStatement(sb.toString());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCClose.close(con, pstmt);
		}
		
	}	
	//파일관련 CRUD
	public void insertFile(BoardFileVO fileVO){
		Connection con = new ConnectionFactory().getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append("insert into t_board_file (no, board_no, file_ori_name, file_save_name, file_size  )");
		sql.append(" values(seq_t_board_file_no.nextval, ?, ?, ?, ?)");
		PreparedStatement pstmt = null;
		try {
			pstmt = con.prepareStatement(sql.toString());
			int index = 1;
			pstmt.setInt(index++, fileVO.getBoardNo());
			pstmt.setString(index++, fileVO.getFileOriName());
			pstmt.setString(index++, fileVO.getFileSaveName());
			pstmt.setInt(index++, fileVO.getFileSize());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCClose.close(con, pstmt);
		} 
	}
	public List<BoardFileVO> selectFileBoard(int boardNO){
		Connection con = new ConnectionFactory().getConnection();
		PreparedStatement pstmt = null;
		List<BoardFileVO> list = new ArrayList<>();
		
		try{
			StringBuilder sb = new StringBuilder();
			sb.append("select no, file_ori_name, file_save_name, file_size ");
			sb.append(" from t_board_file ");
			sb.append(" where board_no = ? ");
			
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, boardNO);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				int no = rs.getInt("no");
				String fileOriName = rs.getString("file_ori_name");
				String fileSaveName = rs.getString("file_save_name");
				int fileSize = rs.getInt("file_size");
			BoardFileVO fileVO = new BoardFileVO();
			fileVO.setNo(no);
			fileVO.setFileOriName(fileOriName);
			fileVO.setFileSaveName(fileSaveName);
			fileVO.setFileSize(fileSize);
			list.add(fileVO);
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JDBCClose.close(con, pstmt);
		}
		
		return list;
	}
}
