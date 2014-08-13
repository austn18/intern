package kt.c.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import kt.c.vo.BoardFileVO;
import kt.c.vo.BoardVO;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("boardDAO")
public class BoardDAO {
	@Autowired
	DataSource dataSource;
	
	@Autowired
	SqlSessionFactory sqlSessionFactory;

	public int selectBoardNo() throws Exception{
		StringBuilder sql = new StringBuilder();
		sql.append("select seq_t_board_no.nextval from dual");
		int boardNo = 0;
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();

			rs.next();
			boardNo = rs.getInt(1);
		} catch (Exception e) {
			throw e;
		} finally {
			try{pstmt.close();}catch(Exception e){}
			try{rs.close();}catch(Exception e){}
			
			//DataSource�κ��� ���� Ŀ�ؼ� ��ü�� close()�� ȣ���ϸ�
			//DB�������� ������ �ݴ� ���� �ƴ϶� DataSource���� Ŀ�ؼ��� �ݳ��Ѵ�.
			try{con.close();} catch(Exception e){}
			
		}

		return boardNo;

	}

	public List<BoardVO> selectAll() throws Exception{
		//SqlSessionFactory 객체로부터 SqlSession 객체를 얻는다.
		//=> SqlSession 객체는 SQL 문을 실행한다. => 물론 내부에서 JDBC를 사용하여 처리한다.
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			//첫번째 : 맵퍼파일에 정의된 namespace이름 + . + SQL문 아이디
			//두번째 : sql문을 수행하는데 필요한 데이터, 없으면 넘기지 않는다.			
			return sqlSession.selectList("kt.c.dao.BoardDAO.selectAll");
		}  catch (Exception e) {
			throw e;
		} finally {
			try{sqlSession.close();}catch(Exception e){}
		}

	}

	public BoardVO selectByNo(int no) throws Exception{

		BoardVO board = new BoardVO();

		StringBuilder sql = new StringBuilder();
		sql.append("select no, title, writer, content, view_cnt, ");
		sql.append("    to_char(reg_date, 'yyyy-mm-dd') reg_date ");
		sql.append(" from t_board ");
		sql.append(" where no = ? ");
		
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			rs.next();

			board.setNo(no);
			board.setTitle(rs.getString("title"));
			board.setWriter(rs.getString("writer"));
			board.setContent(rs.getString("content"));
			board.setViewCnt(rs.getInt("view_cnt"));
			board.setRegDate(rs.getString("reg_date"));

		}  catch (Exception e) {
			throw e;
		} finally {
			try{pstmt.close();}catch(Exception e){}
			try{rs.close();}catch(Exception e){}
			try{con.close();} catch(Exception e){}
			
		}

		return board;
	}

	public void insert(BoardVO board) throws Exception{
		StringBuilder sql = new StringBuilder();
		sql.append("insert into t_board(no, title, writer, content )");
		sql.append("  values(?, ?, ?, ?) ");

		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			int index = 1;
			pstmt.setInt(index++, board.getNo());
			pstmt.setString(index++, board.getTitle());
			pstmt.setString(index++, board.getWriter());
			pstmt.setString(index++, board.getContent());

			pstmt.executeUpdate();
		}  catch (Exception e) {
			throw e;
		} finally {
			try{pstmt.close();}catch(Exception e){}
			try{con.close();} catch(Exception e){}
			
		}
	}

	public void updateViewCnt(int no) throws Exception{
		SqlSession sqlSession = sqlSessionFactory.openSession();

		try {
			//jdk5 에 추가된 기능 : auto boxing int 값이 integer 객체로 자동 포장되어 전달된다.
			//기본형 (byte.short,int...) => wrapper 객체(java.lang.byte....)
			sqlSession.update("kt.c.dao.BoardDAO.updateViewCnt", no/* new Integer(no) */);
			sqlSession.commit();//insert, update, delete인경우 
		} catch (Exception e) {
			throw e;
		} finally {
			try{sqlSession.close();}catch(Exception e){}
			
		}
	}

	public void update(BoardVO board) throws Exception{

		String sql = "update t_board ";
		sql += "  set title = ? ";
		sql += "    , content = ? ";
		sql += " where no = ? ";
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setInt(3, board.getNo());
			pstmt.executeUpdate();
		}  catch (Exception e) {
			throw e;
		} finally {
			try{pstmt.close();}catch(Exception e){}
			try{con.close();} catch(Exception e){}
			
		}
	}

	public void delete(int no) throws Exception{
		StringBuilder sql = new StringBuilder();
		sql.append("delete t_board ");
		sql.append(" where no = ? ");
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		}  catch (Exception e) {
			throw e;
		} finally {
			try{pstmt.close();}catch(Exception e){}
			try{con.close();} catch(Exception e){}
			
		}
	}

	public void insertFile(BoardFileVO fileVO) throws Exception{
		StringBuilder sql = new StringBuilder();
		sql.append("insert into t_board_file( ");
		sql.append("  no, board_no, file_ori_name, file_save_name, file_size) ");
		sql.append("  values(seq_t_board_file_no.nextval, ?, ?, ?, ?) ");

		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			int index = 1;
			pstmt.setInt(index++, fileVO.getBoardNo());
			pstmt.setString(index++, fileVO.getFileOriName());
			pstmt.setString(index++, fileVO.getFileSaveName());
			pstmt.setInt(index++, fileVO.getFileSize());

			pstmt.executeUpdate();
		} catch (Exception e) {
			throw e;
		} finally {
			try{pstmt.close();}catch(Exception e){}
			try{con.close();} catch(Exception e){}
			
		}
	}

	public List<BoardFileVO> selectFileBoard(int boardNo) throws Exception{

		List<BoardFileVO> list = new ArrayList<>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();

			StringBuilder sb = new StringBuilder();
			sb.append("select no, file_ori_name, file_save_name, ");
			sb.append("       file_size ");
			sb.append("  from t_board_file ");
			sb.append(" where board_no = ? ");

			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, boardNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
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

		} catch (Exception e) {
			throw e;
		} finally {
			try{pstmt.close();}catch(Exception e){}
			try{rs.close();}catch(Exception e){}
			try{con.close();} catch(Exception e){}
			
		}

		return list;
	}

	public void deleteFile(int boardNo) throws Exception{
		StringBuilder sql = new StringBuilder();
		sql.append("delete t_board_file ");
		sql.append(" where board_no = ? ");
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, boardNo);
			pstmt.executeUpdate();
		}  catch (Exception e) {
			throw e;
		} finally {
			try{pstmt.close();}catch(Exception e){}
			try{con.close();} catch(Exception e){}
			
		}
	}
}
