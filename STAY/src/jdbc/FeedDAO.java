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

public class FeedDAO {
	
	//등록
	public static boolean insert(String id, String content) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO feed(id, content) VALUES(?,?)";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, content);
			
			return (pstmt.executeUpdate()==1) ? true : false;
			
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	//전체목록 관리자용
	public static ArrayList<FeedDTO> getAllList() throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM feed";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			ArrayList<FeedDTO> feeds = new ArrayList<FeedDTO>();
			while(rs.next()) {
				feeds.add(new FeedDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
			}
			
			return feeds;
			
		} finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	//전체목록 회원용
	public static ArrayList<FeedDTO> getList(String id) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM feed WHERE id=? ORDER BY ts DESC";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			ArrayList<FeedDTO> feeds = new ArrayList<FeedDTO>();
			while(rs.next()) {
				feeds.add(new FeedDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
			}
			
			return feeds;
			
		} finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	//전체목록 관리자용 AJAX
	public static String getListAJAX() throws NamingException, SQLException {
		
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
			
		} finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
}
