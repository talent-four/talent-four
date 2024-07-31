package talentFour.wonder.dao;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import static talentFour.common.JDBCTemplate.*;

import talentFour.wonder.vo.Pagination;
import talentFour.wonder.vo.wonderBoard;

public class wonderDAO {

	private PreparedStatement pstmt;
	private ResultSet rs;
	private Properties prop;

	public wonderDAO() {
		try {
			prop = new Properties();
			String filePath = wonderDAO.class.getResource("/talentFour/sql/wonder-sql.xml").getPath();
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String selectBoardName(Connection conn, int type) throws SQLException {
		String sql = "SELECT BOARD_NM FROM BOARD_TYPE WHERE BOARD_CD = ?";
		String boardName = null;

		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, type);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					boardName = rs.getString("BOARD_NM");
				}
			}
		}

		return boardName;
	}

	public int getListCount(Connection conn, int type) throws SQLException {
		String sql = "SELECT COUNT(*) AS COUNT FROM BOARD WHERE BOARD_CD = ? AND BOARD_ST = '1'";
		int count = 0;

		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, type);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					count = rs.getInt("COUNT");
				}
			}
		}

		return count;
	}

	public List<wonderBoard> selectBoardList(Connection conn, int type, Pagination pagination) throws SQLException {
		List<wonderBoard> wonderFreeList = new ArrayList<>();
		String sql = prop.getProperty("selectlistFree");

		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			int itemsPerPage = pagination.getItemsPerPage();
			int startRow = (pagination.getCurrentPage() - 1) * itemsPerPage + 1; // 시작 행
			int endRow = startRow + itemsPerPage - 1; // 끝 행

			pstmt.setInt(1, startRow); // 시작 행
			pstmt.setInt(2, endRow); // 끝 행

			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					wonderBoard wonderBoard = new wonderBoard();
					wonderBoard.setBoardNo(rs.getInt("BOARD_NO"));
					wonderBoard.setBoardTitle(rs.getString("BOARD_TITLE"));
					wonderBoard.setBoardContent(rs.getString("BOARD_CONTENT"));
					wonderBoard.setCreateDate(rs.getString("CREATED_DT"));
					wonderBoard.setReadCount(rs.getInt("READ_COUNT"));
					wonderBoard.setMemberNickname(rs.getString("MEMBER_NM"));
					wonderBoard.setQaStatus(rs.getString("QA_STATUS"));
					wonderBoard.setWonderType(rs.getString("WONDER_TYPE"));
					wonderBoard.setTagName(rs.getString("TAG_NAMES"));

					wonderFreeList.add(wonderBoard);
				}
			}
		}

		return wonderFreeList;
	}

	public wonderBoard getBoardById(Connection conn, String id) throws Exception {
		wonderBoard board = null;
		String sql = prop.getProperty("boardDetail"); // SQL 쿼리를 XML 파일에서 가져옵니다.

		try (PreparedStatement pstmt = conn.prepareStatement(sql)) { // PreparedStatement 객체 생성
			pstmt.setString(1, id); // 게시글 ID를 설정합니다.

			try (ResultSet rs = pstmt.executeQuery()) { // 쿼리 실행
				if (rs.next()) { // 결과가 있는 경우
					board = new wonderBoard();
					board.setBoardNo(rs.getInt("BOARD_NO")); 
					board.setBoardTitle(rs.getString("BOARD_TITLE"));
					board.setBoardContent(rs.getString("BOARD_CONTENT"));
					board.setCreateDate(rs.getString("CREATED_DT")); 
					board.setMemberNickname(rs.getString("MEMBER_NM"));
					board.setQaStatus(rs.getString("QA_STATUS"));

				}
			}
		} finally {
			close(rs);
			close(pstmt);
		}

		return board;
	}

	/** 글쓰기 
	 * @param conn
	 * @param title
	 * @param content
	 * @param memberNo
	 * @return
	 * @throws Exception 
	 */
	public int insertBoard(Connection conn, String title, String content, int memberNo) throws Exception {
	    int result = 0;
	    String sql1 = prop.getProperty("boardWirte");
	    String sql2 = prop.getProperty("boardWirte2");

	    try (PreparedStatement pstmt1 = conn.prepareStatement(sql1, Statement.RETURN_GENERATED_KEYS);
	         PreparedStatement pstmt2 = conn.prepareStatement(sql2)) {

	        pstmt1.setString(1, title);
	        pstmt1.setString(2, content);
	        pstmt1.setInt(3, memberNo);
	        
	        result = pstmt1.executeUpdate();

	        if (result > 0) {
	            try (ResultSet rs = pstmt1.getGeneratedKeys()) {
	                if (rs.next()) {
	                    result = pstmt2.executeUpdate();
	                }
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        throw new Exception("게시글 등록 중 오류가 발생했습니다.", e);
	    }
	    return result;
	}
}
