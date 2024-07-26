package talentFour.member.model.service;

import talentFour.member.model.dao.MemberDAO;
import talentFour.member.model.vo.Member;
import talentFour.member.model.vo.Paid;
import talentFour.member.model.vo.Review;

import static talentFour.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;


public class MemberService {

	private MemberDAO dao = new MemberDAO();

	
	
	/**로그인 서비스
	 * @param mem
	 * @return loginMember
	 * @throws Exception
	 */
	public Member login(Member mem) throws Exception{
		
		Connection conn = getConnection();
		
		Member loginMember = dao.login(conn,mem);
		
		close(conn);
		
		return loginMember;
	}

	/** 아이디 찾기
	 * @param id
	 * @return result
	 * @throws Exception
	 */
	public int checkId(String id) throws Exception {
		
		Connection conn = getConnection();
		
		int result = dao.checkId(conn, id);
		
		close(conn);
		
		return result;
	}

	
	/** 아이디 수정
	 * @param id
	 * @throws Exception
	 */
	public int updateId(String id, String memberNickname) throws Exception{
		
		Connection conn = getConnection();
		
		int result = dao.updateId(conn,id, memberNickname);
		
		if(result==1) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	/** 현재 비밀번호 일치 검사
	 * @param currentPw
	 * @param memberNo
	 * @return result
	 */
	public int checkCurrentpw(String currentPw, int memberNo) throws Exception {
		
		Connection conn= getConnection();
		
		int result = dao.checkCurrentpw(currentPw, memberNo, conn);
		
		close(conn);
		
		return result;
	}

	
	
	
	/** 비밀번호 변경
	 * @param newPw
	 * @param memberNo
	 * @return result
	 */
	public int changePw(String newPw, int memberNo) throws Exception {
		
		Connection conn = getConnection();
		
		int result = dao.changePw(newPw, memberNo, conn);
		
		if(result==1) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	/** 회원 탈퇴
	 * @param memberNo
	 * @return result
	 */
	public int secession(int memberNo) throws Exception {
		
		Connection conn = getConnection();
		
		int result = dao.secession(conn, memberNo);
		
		if(result==1) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	/** 리뷰 검색
	 * @return List<Review>
	 */
	public List<Review> selectReview(int memberNo) throws Exception {
		
		Connection conn = getConnection();
		
		List<Review> reviewList = dao.selectReview(conn, memberNo);
		
		close(conn);
		
		return reviewList;
	}

	/** 상세 페이지 리뷰 조회
	 * @param memberNo
	 * @return reviewList
	 * @throws Exception
	 */
	public List<Review> getDetailPageReview(int classNo) throws Exception {
		
		Connection conn = getConnection();
		
		List<Review> reviewList = dao.getDetailPageReview(conn, classNo);
		
		close(conn);
		
		return reviewList;
	}
	
	/** 결제 내역 조회
	 * @param memberNo
	 * @return List<Paid>
	 * @throws Exception
	 */
	public List<Paid> selectPaid(int memberNo) throws Exception {
		
		Connection conn = getConnection();
		
		List<Paid> paidList = dao.selectPaid(conn, memberNo);
		
		close(conn);
		
		return paidList;
	}


	
}
