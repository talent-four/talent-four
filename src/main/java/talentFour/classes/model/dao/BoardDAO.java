package talentFour.classes.model.dao;

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

import talentFour.classes.model.vo.Chatting;
import talentFour.classes.model.vo.Class;
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


	/** 리뷰 최신순 정렬
	 * @param conn
	 * @return reviewList
	 * @throws Exception
	 */
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
						.classPhoto(rs.getString(16))
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
	public List<Chatting> chatting(Connection conn, int memberNo,String toId) throws Exception {
		
		List<Chatting> chattingList = new ArrayList<>();
		
		try {
			
			String sql = prop.getProperty("chatting");
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, memberNo);
			pstmt.setString(2, toId);
			pstmt.setInt(3, memberNo);
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


	public List<Class> myLecture(Connection conn, int memberNo) throws Exception {
		
		List<Class> lectureList = new ArrayList<>();
		
		try {
			
			String sql = prop.getProperty("myLecture");
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, memberNo);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				Class c = new Class();
				c.setClassNo(rs.getInt(1));
				c.setClassName(rs.getString(2));
				lectureList.add(c);
			}
			
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return lectureList;
	}


	/** 리뷰 작성
	 * @param conn
	 * @param review
	 * @return result
	 */ 
	public int reviewWrite(Connection conn, Review review) throws Exception {
		
		int result=0;
		
		try {
			String sql = prop.getProperty("writeBoard");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,review.getBoardTitle());
			pstmt.setString(2,review.getBoardContent());
			pstmt.setInt(3,review.getMemberNo());
			
			result=pstmt.executeUpdate();
			close(pstmt);
			
			if(result>0) {
				// 리뷰 파라미터 재설정
				sql=prop.getProperty("writeReview");
			    pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,review.getParents());
				pstmt.setDouble(2,review.getReviewStar());
				result=pstmt.executeUpdate();
				close(pstmt);
				if(result>0) {
					
					sql=prop.getProperty("writeTag");
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, review.getTag());
					result=pstmt.executeUpdate();
				}
				
			}
			
			
		} finally {
			close(pstmt);
		}
		
		
		
		return result;
	}


	/**
	 * @param conn
	 * @param boardNo
	 * @return Review
	 * @throws Exception
	 */
	public Review updateForm(Connection conn, int boardNo) throws Exception {
		
		Review review = new Review();
		
		try {
			
			String sql = prop.getProperty("updateForm");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);

			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				review = Review.builder()
						.boardTitle(rs.getString(2))
						.boardContent(rs.getString(3))
						.tag(rs.getString(10))
						.lectureName(rs.getString(14))
						.reviewStar(rs.getDouble(8))
						.build();
			}
			
			
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		
		return review;
	}


	/** 리뷰 수정
	 * @param boardNo
	 * @param conn
	 * @return result
	 * @throws Exception
	 */
	public int updateReview(int boardNo, Review review, Connection conn) throws Exception {
		
		int result = 0;
		
		try {
			String sql = prop.getProperty("updateBoard");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,review.getBoardTitle());
			pstmt.setString(2,review.getBoardContent());
			pstmt.setInt(3,boardNo);
			
			result=pstmt.executeUpdate();
			
			close(pstmt);
			if(result>0) {
				sql=prop.getProperty("updateReview");
			    pstmt = conn.prepareStatement(sql);
				pstmt.setDouble(1,review.getReviewStar());
				pstmt.setInt(2,boardNo);
				result=pstmt.executeUpdate();
				close(pstmt);
				if(result>0) {
					
					sql=prop.getProperty("updateTag");
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1,review.getTag());
					pstmt.setInt(2,boardNo);
					result=pstmt.executeUpdate();
					close(pstmt);
				} 
				
				
				
				
			}
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	/** 리뷰 추천순 정렬
	 * @param conn
	 * @return reviewList
	 * @throws SQLException
	 */
	public List<Review> selectReviewThumbs(Connection conn) throws SQLException {

		List<Review> reviewList= new ArrayList<>();
		
		try {
			
			String sql = prop.getProperty("selectReviewThumbs");
			
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
						.classPhoto(rs.getString(16))
						.build();
				reviewList.add(review);
			}
			
			
		} finally {
			close(pstmt);
		}
		
		
		return reviewList;
	}


	public int deleteReview(int boardNo, Connection conn) throws SQLException {
		
		int result = 0;
		
		try {
			
			String sql = prop.getProperty("deleteReview");
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			result=pstmt.executeUpdate();
			
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}


	/** 리뷰 추천
	 * @param boardNo
	 * @param conn
	 * @return result
	 */
	public int thumbsReview(int boardNo, String memberNick,Connection conn) {

		int result = 0;

		String sql = prop.getProperty("thumbsReview");
		
		try {
			
			
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			pstmt.setString(2, memberNick);
			
			result=pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			
			System.out.println("추천 무결성 위배 상태");			
			close(pstmt);

			try {
				sql = prop.getProperty("delThumbsReview");
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, boardNo);
				pstmt.setString(2, memberNick);
				result=pstmt.executeUpdate();
				if(result==1) {
					result=2;
				}
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	/** 리뷰 총 갯수 반환
	 * @param boardNo
	 * @param conn
	 * @return countThumbs
	 */
	public int countThumbs(int boardNo, Connection conn) {
		
		int countThumbs=0;
		
		try {
		
			String sql = prop.getProperty("countThumbs");
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				countThumbs = rs.getInt(1);
				
			}
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return countThumbs;
	}


	/** 리뷰 검색
	 * @param searchReview
	 * @param conn
	 * @return reviewList
	 * @throws Exception
	 */
	public List<Review> searchReview(String searchReview, Connection conn) throws Exception {

		List<Review> reviewList= new ArrayList<>();
		
		try {
			
			String sql = prop.getProperty("searchReview");
			
			pstmt=conn.prepareStatement(sql);

			pstmt.setString(1, "%"+searchReview+"%");
			pstmt.setString(2, "%"+searchReview+"%");
			pstmt.setString(3, "%"+searchReview+"%");
			pstmt.setString(4, "%"+searchReview+"%");
			pstmt.setString(5, "%"+searchReview+"%");
			
			
			rs=pstmt.executeQuery();
			
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
						.classPhoto(rs.getString(16))
						.build();
				reviewList.add(review);
			}
			
			
		} finally {
			close(pstmt);
		}
		
		
		return reviewList;

	}
}
