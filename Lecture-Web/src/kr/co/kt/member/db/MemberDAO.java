package kr.co.kt.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import kr.co.kt.util.ConnectionFactory;
import kr.co.kt.util.JDBCClose;

public class MemberDAO {
	public List<MemberVO> selectAll(){
		List<MemberVO> list = new ArrayList<>();
		Connection con = new ConnectionFactory().getConnection();
		PreparedStatement pstmt = null;
		StringBuilder sql = new StringBuilder();

		sql.append("select id, name, email_id, email_domain, tel1, tel2, tel3,  ");
		sql.append(" to_char(reg_date, 'yyyy-mm-dd') reg_date ");
		sql.append(" from t_member ");
		sql.append(" order by reg_date desc ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				MemberVO mv = new MemberVO();
				mv.setId(rs.getString("id"));
				mv.setName(rs.getString("name"));
				mv.setEmail_id(rs.getString("email_id"));
				mv.setEmail_domain(rs.getString("email_domain"));
				mv.setTel1(rs.getString("tel1"));
				mv.setTel2(rs.getString("tel2"));
				mv.setTel3(rs.getString("tel3"));
				mv.setReg_date(rs.getString("reg_date"));
				list.add(mv);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCClose.close(con, pstmt);
		}
		return list;

	}
	public MemberVO selectByNo(String id){
		MemberVO member = null;
		Connection con = new ConnectionFactory().getConnection();
		StringBuilder sql = new StringBuilder();
		PreparedStatement pstmt = null;
		
		sql.append("select * ");
		sql.append(" from t_member ");
		sql.append(" where id = ? ");
		sql.append(" order by reg_date desc ");

		try {
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			member = new MemberVO(rs.getString("id"), rs.getString("name") , rs.getString("password") , rs.getString("email_id") ,
					rs.getString("email_domain") , rs.getString("tel1") , rs.getString("tel2") , rs.getString("tel3") ,
					rs.getString("post") , rs.getString("basic_addr") , rs.getString("detail_addr") , rs.getString("type").charAt(0) ,
					new SimpleDateFormat("yyyy-MM-dd").format( rs.getDate("reg_date")) );
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			JDBCClose.close(con, pstmt);
		}
		return member;
	}
	public boolean insert(MemberVO mv){
		
		Connection con = new ConnectionFactory().getConnection();
		StringBuilder sql = new StringBuilder();
		PreparedStatement pstmt = null;
		sql.append("insert into t_member ");
		sql.append(" values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'U', sysdate)");
		int chk;
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, mv.getId());
			pstmt.setString(2, mv.getName());
			pstmt.setString(3, mv.getPassword());
			pstmt.setString(4, mv.getEmail_id());
			pstmt.setString(5, mv.getEmail_domain());
			pstmt.setString(6, mv.getTel1());
			pstmt.setString(7, mv.getTel2());
			pstmt.setString(8, mv.getTel3());
			pstmt.setString(9, mv.getPost());
			pstmt.setString(10, mv.getBasic_addr());
			pstmt.setString(11, mv.getDetail_addr());
			chk = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}finally{
			JDBCClose.close(con, pstmt);
		}
		if(chk > 0) return true;
		else return false;
		
		
	}

	public boolean update(MemberVO mv){
		Connection con = new ConnectionFactory().getConnection();
		StringBuilder sql = new StringBuilder();
		PreparedStatement pstmt = null;
		sql.append("UPDATE t_member SET name = ?, password = ?, email_id = ?, email_domain = ?, ");
		sql.append(" tel1 = ?, tel2 = ?, tel3 = ?, post = ?, basic_addr = ?, detail_addr = ?, reg_date = sysdate ");
		sql.append("where id = ?");
		int chk = 0;

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(11, mv.getId());
			pstmt.setString(1, mv.getName());
			pstmt.setString(2, mv.getPassword());
			pstmt.setString(3, mv.getEmail_id());
			pstmt.setString(4, mv.getEmail_domain());
			pstmt.setString(5, mv.getTel1());
			pstmt.setString(6, mv.getTel2());
			pstmt.setString(7, mv.getTel3());
			pstmt.setString(8, mv.getPost());
			pstmt.setString(9, mv.getBasic_addr());
			pstmt.setString(10, mv.getDetail_addr());

			chk = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}finally{
			JDBCClose.close(con, pstmt);
		}
		if(chk > 0) return true;
		else return false;
	}
	public boolean delete(String id){
		Connection con = new ConnectionFactory().getConnection();
		StringBuilder sb = new StringBuilder();
		PreparedStatement pstmt = null;
		sb.append("delete t_member where id = ?");
		int chk;
		try {
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			chk = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}finally{
			JDBCClose.close(con, pstmt);
		}
		if(chk > 0) return true;
		else return false;
	}
}
