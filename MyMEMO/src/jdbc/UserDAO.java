package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import util.ConnectionPool;

public class UserDAO {
	
	//가입
	public static int insert(String id, String password, String name) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO user(id, password, name) VALUES(?,?,?)";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, password);
				pstmt.setString(3, name);
			
			return pstmt.executeUpdate();//성공1, 실패0 
			
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	//존재여부 
	public static boolean exsist(String id) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM user WHERE id=?";
			conn = ConnectionPool.get();
			
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			return rs.next();
			
		} finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
	}
	
	//탈퇴 
	public static int delete(String id) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "DELETE FROM user WHERE id =?";
			conn = ConnectionPool.get();
			
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
			
			return pstmt.executeUpdate();//성공1, 실패0 
			
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	//로그인체크
	public static int login(String id, String upassword) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT id, password FROM user WHERE id=?";

			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(!rs.next()) return 1;//디비에 회원 정보가 전혀 없는 경우 
			if(!upassword.equals(rs.getString(2))) return 2;//아이디 일치, 비밀번호 불일치  
			return 0;//로그인 성공 
			
		} finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	//회원목록
	public static ArrayList<UserDTO> list() throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM user ORDER BY ts DESC";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			ArrayList<UserDTO> users = new ArrayList<UserDTO>();
			while(rs.next()) {
				users.add(new UserDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
			}
			
			return users;
			
		} finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	//회원목록 AJAX
	public static String listAJAX() throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM user ORDER BY ts DESC";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			JSONArray users = new JSONArray();
			while(rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("id", rs.getString(1));
				obj.put("password", rs.getString(2));
				obj.put("name", rs.getString(3));
				obj.put("ts", rs.getString(4));
				
				users.add(obj);
			}
			
			return users.toJSONString();
			
		} finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
}
