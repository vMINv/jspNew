/**
 * 최초작성자 : 심현민 (nimnuyhmihs@gmail.com)
 * 최초작성일 : 2023/02/15
 * 
 * 버전 기록 : 0.1(시작 23/02/15)
 * 			 0.1(수정 23/02/21)
 * 			 0.1(종료 23/02/21)
 */
package jdbc;

import java.sql.*;
import javax.naming.NamingException;
import org.json.simple.*;
import util.ConnectionPool;

public class reviewDAO {
	
	//리뷰 등록 
	public static int insert(String fno, String id, String point, String rcontent) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int fno2 = Integer.parseInt(fno);//디비에 int로 넣어야해서 타입 변경
		int point2 = Integer.parseInt(point);//디비에 int로 넣어야해서 타입 변경
		try {
			String sql = "INSERT INTO review (fno, id, point, rcontent) VALUES(?,?,?,?)";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, fno2);
				pstmt.setString(2, id);
				pstmt.setInt(3, point2);
				pstmt.setString(4, rcontent);
			int result = pstmt.executeUpdate();
				
			return result;
				
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}

	//리뷰목록
	public static String getlist(String fno) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int fno2 = Integer.parseInt(fno);//디비에 int로 넣어야해서 타입 변경
		
		try {
			String sql = "SELECT * FROM review WHERE fno=? ORDER BY rregtime DESC";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, fno2);

			rs = pstmt.executeQuery();
			
			JSONArray reviews = new JSONArray();
			
			while(rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("id", rs.getString(2));
				obj.put("point", rs.getString(3));
				obj.put("rcontent", rs.getString(4));
				obj.put("rregtime", rs.getString(5));
			
				reviews.add(obj);
			}
				
			return reviews.toJSONString();
			
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
	}

	//가게에 해당하는 리뷰 목록
	public static String getCeoReviewList(int fno, int page) throws SQLException {
		String sql = "SELECT * FROM review WHERE fno = ? ORDER BY rregtime DESC LIMIT 0, ?";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fno);
			pstmt.setInt(2,  (page * 5));

			rs = pstmt.executeQuery();

			JSONArray reviews = new JSONArray();

			while (rs.next()) {
				JSONObject obj = new JSONObject();

				obj.put("id", rs.getString(2));
				obj.put("point", rs.getString(3));
				obj.put("rcontent", rs.getString(4));
				obj.put("rregtime", rs.getString(5));
				obj.put("rupdatetime", rs.getString(6));

				reviews.add(obj);
			}

			return reviews.toJSONString();

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (rs != null) pstmt.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
	}

	//전체 리뷰 개수 카운트
	public static int totalReview(int fno) throws SQLException {
		String sql = "SELECT count(*) FROM review WHERE fno = ?";
		int totalContent = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fno);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				totalContent += rs.getInt(1);
			}

			return totalContent;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			if (rs != null) pstmt.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
	}

	//가게 페이지 최대값 계산
	public static int ceoPaging(int fno) throws SQLException {
		String sql = "SELECT count(*) FROM review WHERE fno = ?";
		int totalContent = 0;
		int totalPage = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fno);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				totalContent += rs.getInt(1);
			}
			totalPage = totalContent / 5; // 최종 전체 페이지 갯수 (5개 단위로 나눈다)
			if (totalContent % 5 > 0) {
				totalPage++;	// 나머지가 있다면 1을 더해줌
			}
			if(totalPage == 0 ){
				totalPage = 1; //최소 1페이지
			}
			
			return totalPage;
		} catch (Exception e) {
			e.printStackTrace();

			return 1;
		} finally {
			if (rs != null) pstmt.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
	}
}
