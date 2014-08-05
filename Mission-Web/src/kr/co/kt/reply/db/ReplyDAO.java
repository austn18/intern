package kr.co.kt.reply.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import kr.co.kt.util.ConnectionFactory;
import kr.co.kt.util.JDBCClose;

public class ReplyDAO {
	public void insert(ReplyVO reply){
		Connection con = new ConnectionFactory().getConnection();	
		StringBuilder sql = new StringBuilder();
		PreparedStatement pstmt = null;
		
		sql.append("insert into t_reply ");
		sql.append(" (no, link_no, board_no, deps, writer, content) ");
		sql.append(" values(t_reply_no.nextval, ?, ?, ?, ?, ?) ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			int index = 0;
			pstmt.setInt(++index, reply.getLink_no());
			pstmt.setInt(++index, reply.getBoard_no());
			pstmt.setInt(++index, reply.getDeps());
			pstmt.setString(++index, reply.getWriter());
			pstmt.setString(++index, reply.getContent());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCClose.close(con, pstmt);
		}
		
	}
	public void delete(int boardNo, int no){
		List<ReplyVO> list = totalList(boardNo);
		System.out.println(list.toString());
		deleteRecall(list, no);
	}
	
	public void deleteRecall(List<ReplyVO> list, int no){
		for(ReplyVO rv : list){
			int childNo = rv.getLink_no();
			if(childNo == no){
				deleteRecall(list, rv.no);
			}
		}
		deleteChild(no);
	}
	public void deleteChild(int no){
		Connection con = new ConnectionFactory().getConnection();	
		StringBuilder sql = new StringBuilder();
		PreparedStatement pstmt = null;
		
		sql.append("delete t_reply ");
		sql.append("where no = ?");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCClose.close(con, pstmt);
		}
	}
	public List<ReplyVO> getList(int boardNo){
		List<ReplyVO> list = totalList(boardNo);
		List<ReplyVO> reverseList = new ArrayList<ReplyVO>();
		System.out.println("size : "+list.size());
		for(int i = list.size(); i > 0 ; i--){
			reverseList.add(list.get(i-1));
			
		}
		List<ReplyVO> showList = new ArrayList<ReplyVO>();
		for(ReplyVO rv : list){
			if(rv.link_no == 0){
				showList.add(rv);
				getListRecall(reverseList, showList, rv.no);
			}
		}
		
		return showList;
	}
	public void getListRecall(List<ReplyVO> total, List<ReplyVO> showList, int no){
		for(ReplyVO rv : total){
			if(rv.link_no == no){
				showList.add(rv);
				getListRecall(total, showList, rv.no);
			}
		}
		
	}
	public int getDeps(int no){
		Connection con = new ConnectionFactory().getConnection();	
		StringBuilder sql = new StringBuilder();
		PreparedStatement pstmt = null;
		int dep = 0;
		sql.append("select deps ");
		sql.append("from t_reply ");
		sql.append("where no = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			dep = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCClose.close(con, pstmt);
		}
		return dep;
	}
	public List<ReplyVO> totalList(int boardNo){
		Connection con = new ConnectionFactory().getConnection();	
		StringBuilder sql = new StringBuilder();
		PreparedStatement pstmt = null;
		List<ReplyVO> list= new ArrayList<>();
		
		sql.append("select no, to_char(reg_date, 'yyyy-mm-dd') reg_date, ");
		sql.append(" link_no, deps, writer, content ");
		sql.append("from t_reply ");
		sql.append("where board_no = ? ");
		sql.append("order by no desc ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, boardNo);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				int index = 0;
				ReplyVO rv = new ReplyVO();
				rv.setBoard_no(boardNo);
				rv.setNo(rs.getInt(++index));
				rv.setReg_date(rs.getString(++index));
				rv.setLink_no(rs.getInt(++index));
				rv.setDeps(rs.getInt(++index));
				rv.setWriter(rs.getString(++index));
				rv.setContent(rs.getString(++index));
				list.add(rv);
			}
		} catch (SQLException e) {
			 return null;
		}finally{
			JDBCClose.close(con, pstmt);
		}
		return list;
	}
	
	public void update(ReplyVO rv){
		Connection con = new ConnectionFactory().getConnection();	
		StringBuilder sql = new StringBuilder();
		PreparedStatement pstmt = null;
		
		sql.append("update t_reply set content = ? , reg_date = sysdate ");
		sql.append("where no = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, rv.getContent());
			pstmt.setInt(2, rv.getNo());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCClose.close(con, pstmt);
		}
	}
	
	public ReplyVO getDetail(int no){
		Connection con = new ConnectionFactory().getConnection();	
		StringBuilder sql = new StringBuilder();
		PreparedStatement pstmt = null;
		ReplyVO rv = new ReplyVO();
		
		sql.append("select ");
		sql.append(" content ");
		sql.append("from t_reply ");
		sql.append("where no = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			rv.setNo(no);
			rv.setContent(rs.getString(1));
		} catch (SQLException e) {
			 return null;
		}finally{
			JDBCClose.close(con, pstmt);
		}
		return rv;
	}
	
}
