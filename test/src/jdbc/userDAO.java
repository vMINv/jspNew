package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import util.ConnectionPool;

//import org.apache.tomcat.jdbc.pool.ConnectionPool;

public class userDAO {
	userDAO dao = new userDAO();
	List<userDTO> userList = dao.userList();
	private List<userDTO> userList() {
		return null;
	}
	
	PreparedStatement pstmt;
	ResultSet rs;
	Connection con;
	
	public void getCon() {
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");
			DataSource dsc = (DataSource) envctx.lookup("jdbc/foodtruck");
			con = dsc.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void userInsert(userDTO dto) {
		getCon();
		try {
			String sql = "insert into user(?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getMname());
			pstmt.setString(3, dto.getMail());
			pstmt.executeLargeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	   }
//		public ArrayList<userDTO> getAllList(){
//		ArrayList<userDTO> userList = new ArrayList<>();
//		getCon();
//		try {
//			String sql = "select * from MEMBER_PRAC";
//			pstmt = con.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				userDTO dto = new userDTO();
//				dto.setId(rs.getString(1));
//				dto.setMname(rs.getString(2));
//				dto.setMail(rs.getString(3));
//				userList.add(dto);
//			}
//			con.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return userList;
//	}
	
//	public static userDTO info(String id) throws NamingException, SQLException {
//
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
//		try {
//			conn = ConnectionPool.get();
//
//			String sql = "SELECT * FROM user WHERE id=?";
//
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, id);
//			rs = pstmt.executeQuery();
//			userDTO userDTO = new userDTO();
//
//			if(rs.next()) {
//				userDTO.setId(rs.getString(1));
//				userDTO.setPassword(rs.getString(2));
//				userDTO.setMail(rs.getString(3));
//				userDTO.setMname(rs.getString(4));
//			}
//
//			return userDTO;
//
//		}finally {
//			if(rs != null) rs.close();
//			if(pstmt != null) pstmt.close();
//			if(conn != null) conn.close();
//		}
//	} // end of info

	//정보 수정
	public static int edit(String id, String password, String name, String mail) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		conn = ConnectionPool.get();
		
		try {
			String sql = "UPDATE user SET password=?, name=?, mail=? WHERE id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, password);
			pstmt.setString(2, name);
			pstmt.setString(3, mail);
			pstmt.setString(4, id);

			return pstmt.executeUpdate(); //성공 1, 실패 0 을 가지고 나간다.

		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	} // end of edit

	public static int delete(String id) throws NamingException, SQLException {

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			String sql = "DELETE FROM user WHERE id=?";

			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			return	pstmt.executeUpdate(); //성공1, 실패0 을 가지고 나간다.
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
}
