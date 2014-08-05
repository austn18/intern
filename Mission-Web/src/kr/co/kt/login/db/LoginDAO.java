package kr.co.kt.login.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.kt.util.ConnectionFactory;
import kr.co.kt.util.JDBCClose;

public class LoginDAO {
	
	public LoginVO login(LoginVO loginVO){
		LoginVO userVO = null;
		Connection con = new ConnectionFactory().getConnection();
		StringBuilder sb = new StringBuilder();
		PreparedStatement pstmt = null;
		sb.append("select id, password, type from t_member where id = ? and password = ?");
		try {
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, loginVO.getId());
			pstmt.setString(2, loginVO.getPassword());
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){
				userVO = new LoginVO();
				userVO.setId(rs.getString("id"));
				userVO.setPassword(rs.getString("Password"));
				userVO.setType(rs.getString("type"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			JDBCClose.close(con, pstmt);
		}
		return userVO;
	}
}
