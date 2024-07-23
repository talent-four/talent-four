package talentFour.classes.model.service;

import talentFour.classes.model.dao.BoardDAO;
import talentFour.classes.model.vo.Chatting;
import talentFour.member.model.vo.Review;

import static talentFour.common.JDBCTemplate.*;

import java.sql.Connection;
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
}
