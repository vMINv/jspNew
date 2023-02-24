/**
 * 최초작성자 : 심현민 (nimnuyhmihs@gmail.com)
 * 최초작성일 : 2023/02/15
 * 
 * 버전 기록 : 0.1(시작 23/02/16)
 */
package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import util.ConnectionPool;

public class infoDAO {
	
	//제보하기
	public static int insert(String id, String ilocation, String icontent) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO info (id, ilocation, icontent) VALUES(?,?,?)";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, ilocation);
				pstmt.setString(3, icontent);
			int result = pstmt.executeUpdate();
				
			return result;
				
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}

	//제보목록
	public static String getinfolist() throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM info ORDER BY iregtime DESC";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			
			JSONArray infos = new JSONArray();
			
			while(rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("ino", rs.getString(1));
				obj.put("id", rs.getString(2));
				obj.put("ilocation", rs.getString(3));
				obj.put("icontent", rs.getString(4));
				obj.put("iregtime", rs.getString(5));
			
				infos.add(obj);
			}
				
			return infos.toJSONString();
			
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
	}
	
	//제보 삭제
	public static int delete(String ino) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int ino1 = Integer.parseInt(ino);//디비에 int로 넣어야해서 타입 변경
		
		try {
			String sql = "DELETE FROM info WHERE ino = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ino1);
			int result = pstmt.executeUpdate();
				
			return result;
				
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	//제보 수정
	public static int edit(String ino, String ilocation, String icontent) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int ino1 = Integer.parseInt(ino);//디비에 int로 넣어야해서 타입 변경
		
		try {
			String sql = "UPDATE info SET ilocation=?, icontent=? WHERE ino = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ilocation);
			pstmt.setString(2, icontent);
			pstmt.setInt(3, ino1);
			int result = pstmt.executeUpdate();
			
			return result;
			
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
}
