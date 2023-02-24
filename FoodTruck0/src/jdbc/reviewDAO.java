/**
 * 최초작성자 : 심현민 (nimnuyhmihs@gmail.com)
 * 최초작성일 : 2023/02/15
 * 
 * 버전 기록 : 0.1(시작 23/02/15)
 * 버전 기록 : 0.1(시작 23/02/21) -박성준 매서드 추가.
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
	//내 리뷰 목록
			public static String getMyReviewList(String id) throws NamingException, SQLException {
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				try {
					
					String sql = " SELECT r.rno, r.fno, r.point, r.rcontent, r.rregtime, r.rupdatetime, r.id, f.fname " +
							" FROM `review` r " +
							" JOIN food f ON f.fno=r.fno " +
							" WHERE r.id = ? " +
							" ORDER BY r.rno DESC ";

					
					conn = ConnectionPool.get();
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);
					
					rs = pstmt.executeQuery();
					
					JSONArray reviews = new JSONArray();
					
					while(rs.next()) {
						JSONObject obj = new JSONObject();
						obj.put("rno", rs.getString(1));
						obj.put("fno", rs.getString(2));
						obj.put("point", rs.getString(3));
						obj.put("rcontent", rs.getString(4));
						obj.put("rregtime", rs.getString(5));
						obj.put("rupdatetime", rs.getString(6));
						obj.put("id", rs.getString(7));
						obj.put("fname", rs.getString(8));
						
						reviews.add(obj);
					}
					return reviews.toJSONString();
				} finally {
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}
			}
		// 내 리뷰 업뎃 -별점, 내용, 번호, 시간
		public static int editMyReview(String point, String rcontent, String rno) throws NamingException, SQLException {
			Connection conn = null;
			PreparedStatement pstmt = null;
			conn = ConnectionPool.get();
			
			try {
				String sql =" UPDATE review "+
							" SET point=?, rcontent=?  "+ 
							" WHERE rno=? ";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, point);
				pstmt.setString(2, rcontent);
				pstmt.setString(3, rno);

				return pstmt.executeUpdate(); //성공 1, 실패 0 을 가지고 나간다.

			}finally {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
		} 
		// 내 리뷰 삭제 rno
		public static int deleteMyReview(int rno) throws NamingException, SQLException {

			Connection conn = null;
			PreparedStatement pstmt = null;

			try {
				String sql = "DELETE FROM `review` WHERE rno=?";

				conn = ConnectionPool.get();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, rno);

				return	pstmt.executeUpdate(); //성공1, 실패0 을 가지고 나간다.
			}finally {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
		}
		//내 리뷰 찾기 rno 값
		public static reviewDTO getMyReview(int rno) throws NamingException, SQLException {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			reviewDTO rDTO = null; 
			try {
				conn = ConnectionPool.get();
				String sql = "SELECT r.rno, r.fno, r.point, r.rcontent, r.rregtime, r.rupdatetime " + 
							 "FROM review r " +
							 "WHERE r.rno = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, rno);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					rDTO = new reviewDTO();
					rDTO.setRno(rs.getString("rno"));
					rDTO.setFno(rs.getString("fno"));
					rDTO.setPoint(rs.getString("point"));
					rDTO.setRcontent(rs.getString("rcontent"));
					rDTO.setRregtime(rs.getString("rregtime"));
					rDTO.setRupdatetime(rs.getString("rupdatetime"));
				}
			} finally {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			}
			return rDTO; 
		}
}
