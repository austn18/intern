package kr.co.kt.guest.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.kt.util.ConnectionFactory;
import kr.co.kt.util.JDBCClose;

public class GuestDAO {

	public void insert(GuestVO guest){
		Connection con = new ConnectionFactory().getConnection();	
		StringBuilder sql = new StringBuilder();
		PreparedStatement pstmt = null;
		
		sql.append("insert into t_guestbook ");
		sql.append(" (guestbook_id, name, email, password, content) ");
		sql.append(" values(t_guestbook_no.nextval, ?, ?, ?, ?) ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			int index = 0;
			pstmt.setString(++index, guest.getName());
			pstmt.setString(++index, guest.getEmail());
			pstmt.setString(++index, guest.getPassword());
			pstmt.setString(++index, guest.getContent());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCClose.close(con, pstmt);
		}
		
	}
	public void update(GuestVO guest){
		Connection con = new ConnectionFactory().getConnection();	
		StringBuilder sql = new StringBuilder();
		PreparedStatement pstmt = null;
		
		sql.append("update t_guestbook ");
		sql.append("set name = ?, email = ?, content = ?, register = sysdate ");
		sql.append("where guestbook_id = ?");
		try {
			pstmt = con.prepareStatement(sql.toString());
			int index = 0;
			pstmt.setString(++index, guest.getName());
			pstmt.setString(++index, guest.getEmail());
			pstmt.setString(++index, guest.getContent());
			pstmt.setInt(++index, guest.getGuestbook_id());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCClose.close(con, pstmt);
		}
	}
	public void delete(int no){
		Connection con = new ConnectionFactory().getConnection();	
		StringBuilder sql = new StringBuilder();
		PreparedStatement pstmt = null;
		
		sql.append("delete t_guestbook ");
		sql.append("where guestbook_id = ?");
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
	public List<GuestVO> getList(){
		Connection con = new ConnectionFactory().getConnection();	
		StringBuilder sql = new StringBuilder();
		PreparedStatement pstmt = null;
		List<GuestVO> list= new ArrayList<>();
		
		sql.append("select guestbook_id, to_char(register, 'yyyy-mm-dd') register, ");
		sql.append(" name, email, password, content ");
		sql.append("from t_guestbook ");
		sql.append("order by guestbook_id desc ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				int index = 0;
				GuestVO guest = new GuestVO();
				guest.setGuestbook_id(rs.getInt(++index));
				guest.setRegister(rs.getString(++index));
				guest.setName(rs.getString(++index));
				guest.setEmail(rs.getString(++index));
				guest.setPassword(rs.getString(++index));
				guest.setContent(rs.getString(++index));
				list.add(guest);
			}
		} catch (SQLException e) {
			 return null;
		}finally{
			JDBCClose.close(con, pstmt);
		}
		return list;
	}
	public GuestVO getGuestBook(int no){
		Connection con = new ConnectionFactory().getConnection();	
		StringBuilder sql = new StringBuilder();
		PreparedStatement pstmt = null;
		
		GuestVO guest = new GuestVO();
		sql.append("select guestbook_id, to_char(register, 'yyyy-mm-dd') register, ");
		sql.append(" name, email, password, content ");
		sql.append("from t_guestbook ");
		sql.append("where guestbook_id = ?");
		System.out.println(sql.toString());
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			int index = 0;
			
			guest.setGuestbook_id(rs.getInt(++index));
			guest.setRegister(rs.getString(++index));
			guest.setName(rs.getString(++index));
			guest.setEmail(rs.getString(++index));
			guest.setPassword(rs.getString(++index));
			guest.setContent(rs.getString(++index));
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCClose.close(con, pstmt);
		}
		return guest;
	}
}
