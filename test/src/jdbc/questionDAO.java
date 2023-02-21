/*
        최초작성자 : 강세빈 (qz6789.sk@gmail.com)
        최초작성일 : 2023/02/17

        버전  기록 : 0.1(시작 23/02/17)
*/

package jdbc;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import smtp.GoogleSMTP;
import util.ConnectionPool;

import java.sql.*;
import java.util.*;

public class questionDAO {

    public static boolean addQuestion(String id, String qtitle, String mail, String qcon) throws SQLException {
        String sql = "INSERT INTO question(id, qtitle, mail, qcon, qpro) VALUES (?, ?, ?, ?, ?)";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = ConnectionPool.get();

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, qtitle);
            pstmt.setString(3, mail);
            pstmt.setString(4, qcon);
            pstmt.setInt(5, 0);

            return (pstmt.executeUpdate()==1) ? true : false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if(pstmt != null) pstmt.close();
            if(conn != null) conn.close();
        }
    }

    public static boolean sendQuestion(String mail,  String qtitle, String qcontent) {
        Map<String, String> emailInfo = new HashMap<String, String>();

        emailInfo.put("from", "qz6789.sk@gmail.com"); //보내는 사람
        emailInfo.put("to", "qeqe6789@naver.com"); //받는사람
        emailInfo.put("subject", qtitle); //메일 제목

        String content = qcontent.replace("\r\n", "<br/>"); //줄바꿈을 html 형식으로 변환

        String htmlContent = content + "<br>작성자 이메일 : " + mail;

        // 변경 내용 저장
        emailInfo.put("content", htmlContent); //메일 내용
        emailInfo.put("format", "text/html;charset=UTF-8");
        try {
            GoogleSMTP smtpServer = new GoogleSMTP(); //메일 전송 객체 생성
            smtpServer.emailSending(emailInfo);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    //문의 내용 보기 (1개)
    public static String getMyQuestion(String qno) throws SQLException {
        String sql = "SELECT * FROM question WHERE qno = ?";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            conn = ConnectionPool.get();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, qno);

            rs = pstmt.executeQuery();

            JSONArray reviews = new JSONArray();

            while (rs.next()) {
                JSONObject obj = new JSONObject();

                obj.put("id", rs.getString(2));
                obj.put("qtitle", rs.getString(3));
                obj.put("mail", rs.getString(4));
                obj.put("qcon", rs.getString(5));
                obj.put("qpro", rs.getString(6));

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


    //내가 보낸 문의 목록
    public static String getMyQuestList(String id, int page) throws SQLException {
        String sql = "SELECT * FROM question WHERE id = ? LIMIT ?, 10";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            conn = ConnectionPool.get();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setInt(2,  (page-1) * 10);

            rs = pstmt.executeQuery();

            JSONArray reviews = new JSONArray();

            while (rs.next()) {
                JSONObject obj = new JSONObject();

                obj.put("qno", rs.getString(1));
                obj.put("qtitle", rs.getString(3));
                obj.put("qpro", rs.getString(6));

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

    // 전체 페이지 최대값 계산
    public static int paging(String sid) throws SQLException {
        String sql = "SELECT count(*) FROM question WHERE id= ?";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int totalContent = 0;
        int totalPage = 0;

        try {
            conn = ConnectionPool.get();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, sid);

            rs = pstmt.executeQuery();

            // 전체 게시물 갯수로 총 페이지 수 산출
            while (rs.next()) {
                totalContent += rs.getInt(1);
            }
            totalPage = totalContent / 10; // 최종 전체 페이지 갯수 (5개 단위로 나눈다)
            if (totalContent % 10 > 0) {
                totalPage++;	// 나머지가 있다면 1을 더해줌
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

}
