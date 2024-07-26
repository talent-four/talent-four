package talentFour.classes.model.service;

import talentFour.classes.model.dao.BoardDAO;
import talentFour.classes.model.vo.Chatting;
import talentFour.classes.model.vo.Class;
import talentFour.common.Util;
import talentFour.member.model.vo.Review;
import static talentFour.common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class BoardService {
	private BoardDAO dao = new BoardDAO();

	/** 리뷰 페이지 리뷰보기
	 * @return reviewList
	 */
	public List<Review> selectReview() throws Exception {
		
		Connection conn = getConnection();
		
		List<Review> reviewList = dao.selectReview(conn);
		
		close(conn);
		
		return reviewList;
	}

	/** 채팅하기 정보 불러오기
	 * @param memberNickname
	 * @return List<Chatting>
	 */
	public List<Chatting> chatting(String memberNickname , String toId) throws Exception {
		
		Connection conn = getConnection();
		
		List<Chatting> chattingList = dao.chatting(conn,memberNickname, toId);
		
		close(conn);
		
		return chattingList;
	}

	public List<Class> myLecture(int memberNo) throws Exception {
		
		Connection conn = getConnection();
		
		List<Class> lectureList = dao.myLecture(conn,memberNo);
		
		close(conn);
		
		return lectureList;
	}

	/** 리뷰 작성
	 * @param review
	 * @return result
	 * @throws Exception
	 */
	public int reviewWrite(Review review) throws Exception {
		
		Connection conn = getConnection();
		// XSS 방지 처리 (제목/내용)
		review.setBoardTitle(Util.XSSHandling(review.getBoardTitle()));
		review.setBoardContent(Util.XSSHandling(review.getBoardContent()));
		
		// 개행 문자 처리 (내용)
		review.setBoardContent(Util.newLineHandling(review.getBoardContent()));
		
		
		int result = dao.reviewWrite(conn, review);
		
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	/** 리뷰 수정 value값 불러오기
	 * @param boardNo
	 * @return review
	 */
	public Review updateForm(int boardNo) throws Exception {

		Connection conn = getConnection();
		
		Review review = dao.updateForm(conn, boardNo);
		
		close(conn);
				
		return review;
	}

	/** 리뷰 수정
	 * @param boardNo
	 * @return result
	 * @throws Exception
	 */
	public int updateReview(int boardNo, Review review) throws Exception {
		
		Connection conn = getConnection();
		
		int result = dao.updateReview(boardNo, review, conn);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public List<Review> selectReviewThumbs() throws SQLException {
		
		Connection conn = getConnection();
		
		List<Review> reviewList = dao.selectReviewThumbs(conn);
		
		close(conn);
		
		return reviewList;
	}

	public int deleteReview(int boardNo) throws SQLException {
		
		Connection conn = getConnection();
		
		int result = dao.deleteReview(boardNo, conn);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	/** 리뷰 추천
	 * @param boardNo
	 * @param memberNick
	 * @return result
	 */
	public List<Integer> thumbsReview(int boardNo, String memberNick) {
		
		Connection conn = getConnection();
		// 1은 삽입 상태, 2는 삭제 상태 반환
		int result = dao.thumbsReview(boardNo, memberNick,conn);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		int countThumbs = dao.countThumbs(boardNo, conn);
		
		List<Integer> resultList = new ArrayList<>();
		
		resultList.add(result);
		resultList.add(countThumbs);
		close(conn);
		
		return resultList;
	}

	/** 리뷰 검색
	 * @param searchReview
	 * @return reviewList
	 * @throws Exception
	 */
	public List<Review> searchReview(String searchReview) throws Exception {
		
		Connection conn = getConnection();
		
		List<Review> reviewList = dao.searchReview(searchReview , conn);
		
		close(conn);
		
		return reviewList;
	}
}
