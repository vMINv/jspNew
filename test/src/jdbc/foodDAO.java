// 작성자 : 변예린

package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import util.ConnectionPool;

public class foodDAO {
	//가게 등록
	public static int inserttemp(String fname, String fphoto, String flocation, String ftime,
						         String fmenu, String fprice, String id) throws SQLException, NamingException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO food(fname, fphoto, flocation, ftime, fmenu, fprice, fpro, id) "
						+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, fname);
				pstmt.setString(2, fphoto);
				pstmt.setString(3, flocation);
				pstmt.setString(4, ftime);
				pstmt.setString(5, fmenu);
				pstmt.setString(6, fprice);
				pstmt.setString(7, "0");
				pstmt.setString(8, id);
				
			return pstmt.executeUpdate();	//성공하면 1, 실패하면 0을 가지고 나감
			
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
	}
	
	//가게 정보 수정
	public static int updatefood(String fname, String fphoto, String flocation, String ftime, String fmenu,
								 String fprice, String fno) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "UPDATE food SET fname = ?, fphoto = ?, flocation = ?, ftime = ?, "
					+ "fmenu = ?, fprice = ? WHERE fno = ?";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, fname);
				pstmt.setString(2, fphoto);
				pstmt.setString(3, flocation);
				pstmt.setString(4, ftime);
				pstmt.setString(5, fmenu);
				pstmt.setString(6, fprice);
				
			return pstmt.executeUpdate();	//성공하면 1, 실패하면 0을 가지고 나감
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	//가게 삭제
	public static int deletefood(String fno) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "DELETE FROM food WHERE fno = ?";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, fno);
				
			return pstmt.executeUpdate();	//성공하면 1, 실패하면 0을 가지고 나감
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	//가게 승인 절차
		public static int insertadmin(String fno) throws SQLException, NamingException {
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				String sql = "UPDATE food SET fpro = ? WHERE fno = ?";
				conn = ConnectionPool.get();
				pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "1");
					pstmt.setString(2, fno);
					
				return pstmt.executeUpdate();	//성공하면 1, 실패하면 0을 가지고 나감
				
			} finally {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
			
		}
		
	//가게 승인 거부 절차
	public static int deleteadmin(String fno) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "DELETE FROM food WHERE fno = ?";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, fno);
			
			return pstmt.executeUpdate();	//성공하면 1, 실패하면 0을 가지고 나감
					
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) pstmt.close();
		}
	}
	
//	//가게 이름 가져오기
//	   public static String getName(int fno) throws SQLException {
//	      String sql = "SELECT fname FROM food WHERE fno = ?";
//
//	      Connection conn = null;
//	      PreparedStatement pstmt = null;
//	      ResultSet rs = null;
//
//	      String name = null;
//
//	      try {
//
//	         conn = ConnectionPool.get();
//	         pstmt = conn.prepareStatement(sql);
//	         pstmt.setInt(1, fno);
//
//	         rs = pstmt.executeQuery();
//
//	         while(rs.next()) {
//	            name = rs.getString(1);
//	         }
//
//	         return name;
//	      } catch (Exception e) {
//	         e.printStackTrace();
//	         return name;
//	      } finally {
//	         if (rs != null) pstmt.close();
//	         if (pstmt != null) pstmt.close();
//	         if (conn != null) conn.close();
//	      }
//	   }
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//
//
//	//가게 이름 가져오기
//	public static String getName(int fno) throws SQLException {
//		String sql = "SELECT fname FROM food WHERE fno = ?";
//
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
//		String name = null;
//
//		try {
//
//			conn = ConnectionPool.get();
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, fno);
//
//			rs = pstmt.executeQuery();
//
//			while(rs.next()) {
//				name = rs.getString(1);
//			}
//
//			return name;
//		} catch (Exception e) {
//			e.printStackTrace();
//			return name;
//		} finally {
//			if (rs != null) pstmt.close();
//			if (pstmt != null) pstmt.close();
//			if (conn != null) conn.close();
//		}
//	}
	
//	//자신의 푸드 트럭 가게 보기
//	public static ArrayList<foodDTO> getList(String id) throws NamingException, SQLException{
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		try {
//			String sql = "SELECT * FROM food WHERE id = ?";
//			conn = ConnectionPool.get();
//			pstmt = conn.prepareStatement(sql);
//				pstmt.setString(1, id);
//				
//			rs = pstmt.executeQuery();
//			
//			ArrayList<foodDTO> foods = new ArrayList<foodDTO>();
//			
//			while(rs.next()) {
//				foods.add(new foodDTO(rs.getString(1),
//									  rs.getString(2),
//									  rs.getString(3),
//									  rs.getString(4),
//									  rs.getString(5),
//									  rs.getString(6),
//									  rs.getString(7),
//									  rs.getString(8),
//									  rs.getString(9))
//						);
//			}
//			
//			return foods;
//		} finally {
//			if(rs != null) rs.close();
//			if(pstmt != null) pstmt.close();
//			if(conn != null) conn.close();
//		}
//	}	

	
	
	
	//가게하나상세보기
	public static String oneStoreInfoList(String fno) throws NamingException, SQLException {	
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int fno2 = Integer.parseInt(fno);//디비에 int로 넣어야해서 타입 변경
		
		try {
			String sql = "SELECT * FROM food WHERE fno=?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, fno2);

			rs = pstmt.executeQuery();
			
			JSONArray infos = new JSONArray();
			
			while(rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("fno", rs.getString(1));
				obj.put("fname", rs.getString(3));
				obj.put("fphoto", rs.getString(4));
				obj.put("flocation", rs.getString(5));
				obj.put("ftime", rs.getString(6));
				obj.put("fmenu", rs.getString(7));
				obj.put("fprice", rs.getString(8));
			
				infos.add(obj);
			}
				
			return infos.toJSONString();
			
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
	}
	
	//주소에 검색 키워드 포함 된 가게 목록 
	public static String search(String search) throws NamingException, SQLException {	
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM food WHERE fname LIKE ? OR flocation LIKE ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, '%'+search+'%');
				pstmt.setString(2, '%'+search+'%');
			rs = pstmt.executeQuery();
			
			JSONArray results = new JSONArray();
			
			while(rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("fno", rs.getString(1));
				obj.put("fname", rs.getString(3));
				obj.put("fphoto", rs.getString(4));
				obj.put("flocation", rs.getString(5));
				obj.put("flat", rs.getString(10));
				obj.put("flon", rs.getString(11));
				
				results.add(obj);
			}
			
			return results.toJSONString();
			
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
	}
}
