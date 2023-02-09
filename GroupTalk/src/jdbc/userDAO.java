package jdbc;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.NamingException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import util.ConnectionPool;

public class userDAO {
	
	
	// 관리자가 임시 테이블 자료를 유저테이블로 가입 승인 절차
	public static int insertadmin(String id) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			// temp 에서 id 값으로 데이터 조회해오기 select
			
			String sql = "SELECT * FROM temp WHERE id = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);

				
			rs = pstmt.executeQuery(); 
			
			rs.next();
			
			String tid = rs.getString(1);
			String tpassword = rs.getString(2);
			String tname = rs.getString(3);
			
			
			// 조회한 데이터를 user 에 넣기 insert
			String sql2 = "INSERT INTO user(id,password,name) VALUES(?,?,?)";
			
			pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, tid);
				pstmt.setString(2, tpassword);
				pstmt.setString(3, tname);
				
			pstmt.executeUpdate(); //성공 1, 실패 0 을 가지고 나간다. 
			
			
			
			// temp 에서 해당 데이터 삭제하기  delete
			

				String sql3 = "DELETE FROM temp WHERE id = ?";
				
				pstmt = conn.prepareStatement(sql3);
					pstmt.setString(1, id);
					
			return pstmt.executeUpdate();
			
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	
	
	// 회원 가입 신청
	public static int inserttemp(String id, String password, String name) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO temp(id,password,name) VALUES(?,?,?)";
			
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
	
	
	
	//임시 테이블 목록 보기
	public static String gettemp() throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM temp ORDER BY ts DESC";
			
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
			
			
			
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	//신청회원 거부
	public static int deletetemp(String id) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "DELETE FROM temp WHERE id = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				
			return pstmt.executeUpdate(); //성공 1, 실패 0 을 가지고 나간다. 
			
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
}