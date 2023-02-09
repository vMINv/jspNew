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

public class feedDAO {
	
	public static int delete(String no) 
			throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "DELETE FROM feed WHERE no = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, no);
			int result = pstmt.executeUpdate();
				
			return result;
				
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	
	
	
	
	public static int insert(String id, String content) 
			throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO feed (id, content) VALUES(?,?)";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, content);
			int result = pstmt.executeUpdate();
				
			return result;
				
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	
	
	public static String getlist() 
			throws NamingException, SQLException {
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM feed ORDER BY ts DESC";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			
			JSONArray feeds = new JSONArray();
			
			while(rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("no", rs.getString(1));
				obj.put("id", rs.getString(2));
				obj.put("content", rs.getString(3));
				obj.put("ts", rs.getString(4));
			
				feeds.add(obj);
			}
				
			return feeds.toJSONString();
			
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
	}

}
