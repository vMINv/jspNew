package jdbc;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.NamingException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import util.ConnectionPool;

public class userDAO {
	
	//회원 가입
	public static int insert(String id, String password, String name) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO user(id,password,name) VALUES(?,?,?)";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, password);
				pstmt.setString(3, name);
				
			return pstmt.executeUpdate(); //성공 1, 실패 0 을 가지고 나간다. 
			
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	//회원 정보 수정
	public static int edit(String id, String password, String name) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "UPDATE user SET password = ?, name = ?  WHERE id = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, password);
				pstmt.setString(2, name);
				pstmt.setString(3, id);
				
			return pstmt.executeUpdate(); //성공 1, 실패 0 을 가지고 나간다. 
			
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	//회원 가입시 아이디가 이미 존재하는 지 여부 확인
	public static boolean exist(String id) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT id FROM user WHERE id = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);

				
			rs = pstmt.executeQuery(); 
			
			return rs.next();  // 조회한 아이디가 DB에 존재하면 true 없으면 false
			
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	// 회원 탈퇴
	public static int delete(String id) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "DELETE FROM user WHERE id = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				
			return pstmt.executeUpdate(); //성공 1, 실패 0 을 가지고 나간다. 
			
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	//회원 로그인
	public static int login(String id, String upassword) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT id, password FROM user WHERE id = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				
			rs = pstmt.executeQuery();
			
			if(!rs.next()) return 1; // 1 아이디가 존재하지 않는 경우 
			if(!upassword.equals(rs.getString("password"))) return 2; //아이디는 존재하지만 비번이 일치하지 않는 경우
			return 0;  // 로그인 성공 
			
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}

	//회원 목록, 꺼내기 연습용
	public static ArrayList<userDTO> list() throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM user ORDER BY ts DESC";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				
			rs = pstmt.executeQuery(); 
			
			ArrayList<userDTO> users = new ArrayList<userDTO>();
			
			while(rs.next()) {
				users.add(new userDTO(rs.getString(1),
									  rs.getString(2),
									  rs.getString(3),
									  rs.getString(4)));

			}return users;
			
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	
	
	//ajax 꺼내기 연습용getListAJAX
	public static String getListAJAX() throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM user ORDER BY ts DESC";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				
			rs = pstmt.executeQuery(); 
			
			
			JSONArray feeds = new JSONArray();
			
			while(rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("id", rs.getString(1));
				obj.put("password", rs.getString(2));
				obj.put("name", rs.getString(3));
				obj.put("ts", rs.getString(4));
			
				feeds.add(obj);
			}
				
			return feeds.toJSONString();
			
			
			
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	
}
