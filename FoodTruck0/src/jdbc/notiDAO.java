/*
        최초작성자 : 강세빈 (qz6789.sk@gmail.com)
        최초작성일 : 2023/02/15

        버전  기록 : 0.1(시작 23/02/15)
*/

package jdbc;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import util.ConnectionPool;

import javax.naming.NamingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class notiDAO {

    public static String notiList(int page) throws SQLException {
        String sql = "SELECT * " +
                "FROM noti " +
                "ORDER BY nno DESC " +
                "LIMIT ?, 10";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = ConnectionPool.get();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,  (page-1) * 10);

            rs = pstmt.executeQuery();

            JSONArray notices = new JSONArray();

            while(rs.next()) {
                JSONObject obj = new JSONObject();

                obj.put("nno", rs.getString(1));
                obj.put("ntitle", rs.getString(2));
                obj.put("ncontent", rs.getString(3));
                obj.put("nregtime", rs.getString(4));
                obj.put("nupdatetime", rs.getString(5));

                notices.add(obj);
            }

            return notices.toJSONString();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close();
            if(conn != null) conn.close();
        }
    }

    // 전체 페이지 최대값 계산
    public static int paging() throws SQLException {
        String sql = "SELECT count(*) FROM noti";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int totalContent = 0;
        int totalPage = 0;

        try {
            conn = ConnectionPool.get();
            pstmt = conn.prepareStatement(sql);

            rs = pstmt.executeQuery();

            // 전체 게시물 갯수로 총 페이지 수 산출
            while (rs.next()) {
                totalContent += rs.getInt(1);
            }
            totalPage = totalContent / 10; // 최종 전체 페이지 갯수 (5개 단위로 나눈다)
            if (totalContent % 10 > 0) {
                totalPage++;   // 나머지가 있다면 1을 더해줌
            }
            if(totalPage == 0) {
                totalPage = 1;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close();
            if(conn != null) conn.close();
        }
        return totalPage;
    }

    public static notiDTO info(int nno) throws NamingException, SQLException {
        String sql = "SELECT * FROM noti WHERE nno=?";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = ConnectionPool.get();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, nno);

            rs = pstmt.executeQuery();
            notiDTO notiDTO = new notiDTO();

            if(rs.next()) {
                notiDTO.setNtitle(rs.getString(2));
                notiDTO.setNcontent(rs.getString(3));
                notiDTO.setNregtime(rs.getString(4));
                notiDTO.setNupdatetime(rs.getString(5));
            }

            return notiDTO;

        }finally {
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close();
            if(conn != null) conn.close();
        }
    }

    //공지 등록
    public static int insert(String ntitle, String ncontent) throws SQLException {

        String sql = "INSERT INTO noti(ntitle, ncontent) VALUES(?,?)";

        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = ConnectionPool.get();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, ntitle);
            pstmt.setString(2, ncontent);
            int result = pstmt.executeUpdate();

            return result;
        }catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
        finally {
            if(pstmt != null) pstmt.close();
            if(conn != null) conn.close();
        }
    }

    //공지 수정
    public static int edit(String nno, String ntitle, String ncontent) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        conn = ConnectionPool.get();

        try {
            String sql = "UPDATE noti SET ntitle=?, ncontent=?, nupdatetime=CURRENT_TIMESTAMP WHERE nno=?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, ntitle);
            pstmt.setString(2, ncontent);
            pstmt.setString(3, nno);

            return pstmt.executeUpdate();

        }finally {
            if(pstmt != null) pstmt.close();
            if(conn != null) conn.close();
        }
    } // end of edit

    //공지 삭제
    public static int delete(String nno) throws NamingException, SQLException {
        String sql = "DELETE FROM noti WHERE nno=?";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = ConnectionPool.get();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, nno);

            return   pstmt.executeUpdate(); //성공1, 실패0 을 가지고 나간다.
        }finally {
            if(pstmt != null) pstmt.close();
            if(conn != null) conn.close();
        }
    }

}