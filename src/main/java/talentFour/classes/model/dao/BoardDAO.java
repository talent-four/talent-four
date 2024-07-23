package talentFour.classes.model.dao;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import static talentFour.common.JDBCTemplate.*;

import talentFour.classes.model.vo.Chatting;
import talentFour.member.model.dao.MemberDAO;
import talentFour.member.model.vo.Review;

public class BoardDAO {

	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Properties prop;
	
	public BoardDAO() {
		try {
			
			prop=new Properties();
			String filePath = MemberDAO.class.getResource("/talentFour/sql/board-sql.xml").getPath();
			
			prop.loadFromXML(new FileInputStream(filePath));
		}catch(Exception e) {
			e.printStackTrace();
		}
	}


	public List<Review> selectReview(Connection conn) throws Exception {
		
		List<Review> reviewList= new ArrayList<>();
		
		try {
			
			String sql = prop.getProperty("selectReview");
			
			stmt=conn.createStatement();

			rs=stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				Review review = new Review();
				review = Review.builder()
						.boardNo(rs.getInt(1))
						.boardTitle(rs.getString(2))
						.boardContent(rs.getString(3))
						.createdDate(rs.getString(4))
						.updateDate(rs.getString(5))
						.boardStatus(rs.getInt(6))
						.memberNickname(rs.getString(7))
						.reviewStar(rs.getDouble(8))
						.parents(rs.getInt(9))
						.tag(rs.getString(10))
						.report(rs.getInt(11))
						.thumbs(rs.getInt(12))
						.profileImage(rs.getString(13))
						.lectureName(rs.getString(14))
						.instructorName(rs.getString(15))
						.classURL(rs.getString(16))
						.build();
				
				reviewList.add(review);
			}
			
			
		} finally {
			close(pstmt);
		}
		
		
		return reviewList;
	}


	/**	채팅목록 받아오기
	 * @param conn
	 * @param memberNickname
	 * @return List<Chatting>
	 */
	public List<Chatting> chatting(Connection conn, String memberNickname,String toId) throws Exception {
		
		List<Chatting> chattingList = new ArrayList<>();
		
		try {
			
			String sql = prop.getProperty("chatting");
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, memberNickname);
			pstmt.setString(2, toId);
			pstmt.setString(3, memberNickname);
			pstmt.setString(4, toId);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				Chatting chatting =new Chatting();
				
				chatting = Chatting.builder()
						.fromName(rs.getString(1))
						.toName(rs.getString(2))
						.message(rs.getString(3))
						.time(rs.getString(4))
						.build();
				chattingList.add(chatting);
			}
			
		}finally {
			close(pstmt);
		}
		

		return chattingList;
	}
}
