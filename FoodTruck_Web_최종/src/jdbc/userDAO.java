
/*최초작성자 : 강남욱 (redsky6301@naver.com)
최초작성일 : 2023/02/15

*/

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


public class userDAO {

	public static int perCheck(String id) throws SQLException, NamingException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT per FROM user WHERE id=?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("per").equals("ceo")) {
					return 1;//ceo일 때 1 
				} else if(rs.getString("per").equals("user")) {
					return 0;//user일 때 0
				}
			}
			
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		return 2;//admin
	}

	public static int insert(String id, String per, String password, String mail ,String name) throws NamingException, SQLException {
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				String sql = "INSERT INTO user(id,per,password,mail,name) VALUES(?,?,?,?,?)";
				
				conn = ConnectionPool.get();
				pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);
					pstmt.setString(2, per);
					pstmt.setString(3, password);
					pstmt.setString(4, mail);
					pstmt.setString(5, name);
					
				return	pstmt.executeUpdate(); //성공1, 실패0 을 가지고 나간다.
				
			}finally {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}	
		}
	
	public static int login(String id, String password) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT id, password FROM user WHERE id = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				
			rs = pstmt.executeQuery();
			
			if(!rs.next()) return 1; //1 아이디가 존재하지 않는 경우
			if(!password.equals(rs.getString("password"))) return 2;//아이디는 존재하지만 비번이 일치하지 않는 경우
			return 0;
			
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
		}
	
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
			
			return rs.next(); //조회한 아이디가 DB에 존재하면 true 없으면 false
			
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}	
	}
	
	public static String findid(String name, String mail) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
			
		try {
			
			String sql = "SELECT id FROM user WHERE mail = ? AND NAME = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mail);
				pstmt.setString(2, name);
		
			rs = pstmt.executeQuery(); 
			
			String uid = null;
			
			if(rs.next()) {
				
				uid = rs.getString(1);
			}
			
			return uid; //조회한 아이디가 DB에 존재하면 true 없으면 false
			
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}	
	}
	
	public static String findpass(String id, String name, String mail) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
			
		try {
			
			String sql = "SELECT password FROM user WHERE id = ? AND NAME = ? AND mail = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, name);
				pstmt.setString(3, mail);
				
			rs = pstmt.executeQuery(); 
			
			String upass = null;
			
			if(rs.next()) {
				
				upass = rs.getString(1);
			}
			
			return upass; //조회한 아이디가 DB에 존재하면 true 없으면 false
			
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}	
	}
	
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
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getMail());
			pstmt.executeLargeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	   }
		public ArrayList<userDTO> getAllList(){
		ArrayList<userDTO> userList = new ArrayList<>();
		getCon();
		try {
			String sql = "select * from MEMBER_PRAC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				userDTO dto = new userDTO();
				dto.setId(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setMail(rs.getString(3));
				userList.add(dto);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userList;
	}
		
	public static userDTO info(String id) throws NamingException, SQLException {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = ConnectionPool.get();

			String sql = "SELECT * FROM user WHERE id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			userDTO userDTO = new userDTO();

			if(rs.next()) {
				userDTO.setId(rs.getString(1));
				userDTO.setPassword(rs.getString(2));
				userDTO.setMail(rs.getString(3));
				userDTO.setName(rs.getString(4));
			}

			return userDTO;

		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	} // end of info

	//정보 수정
	public static int edit(String id, String password, String name, String mail) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			String sql = "UPDATE user SET password=?, name=?, mail=? WHERE id=?";

			conn = ConnectionPool.get();
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