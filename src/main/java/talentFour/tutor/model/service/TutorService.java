package talentFour.tutor.model.service;

import static talentFour.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import talentFour.common.*;
import talentFour.member.model.vo.Member;
import talentFour.tutor.dao.TutorDAO;
import talentFour.tutor.model.vo.Dashboard;
import talentFour.tutor.model.vo.TutorCalculate;
import talentFour.tutor.model.vo.TutorClass;
import talentFour.tutor.model.vo.TutorClassSell;
import talentFour.tutor.model.vo.TutorRegister;
import talentFour.tutor.model.vo.tutorProfile;

public class TutorService {
	private TutorDAO dao = new TutorDAO();
	private Connection conn;
	
	/** 운영중인 클래스 조회
	 * @param status
	 * @param memberNo 
	 * @return
	 * @throws Exception
	 */
	public List<TutorClass> selectClassesList(int status, int memberNo) throws Exception {
		
		Connection conn = getConnection();
		
		List<TutorClass> tutorclasses = dao.selectClassesList(conn, status, memberNo);
		
		close(conn);
		return tutorclasses;
	}
	
	/** 운영중인 클래스 갯수 조회
	 * @param status
	 * @param memberNo 
	 * @return
	 * @throws Exception
	 */
	public TutorClass classingCount(int status, int memberNo) throws Exception {
		
		Connection conn = getConnection();
		
		TutorClass counting = dao.classingCount(conn, status, memberNo);
		
		close(conn);
		return counting;
	}
	

	/** 만료된 클래스 조회
	 * @param statusfin
	 * @param memberNo 
	 * @return
	 * @throws Exception
	 */
	public List<TutorClass> selectClassesFinList(int statusfin, int memberNo) throws Exception {
		
		Connection conn = getConnection();
		
		List<TutorClass> tutorclassesfin = dao.selectClassesFinList(conn,statusfin, memberNo);
		
		close(conn);
		
		return tutorclassesfin;
	}

	/** 만료된 클래스 갯수 조회
	 * @param statusfin
	 * @param memberNo 
	 * @return
	 * @throws Exception
	 */
	
	public TutorClass classfinCount(int statusfin, int memberNo) throws Exception {
		Connection conn = getConnection();
		
		TutorClass countfin = dao.classfinCount(conn, statusfin, memberNo);
		
		close(conn);
		return countfin;
	}
	
	
	/** 클래스 판매현황 조회
	 * @param memberNo 
	 * @return
	 * @throws Exception
	 */
	public List<TutorClassSell> selectClassSellList(int memberNo) throws Exception {
		Connection conn = getConnection();
		
		List<TutorClassSell> tutorclassSell = dao.selectClassSellList(conn,memberNo);
		
		close(conn);
		
		return tutorclassSell;
	}

	
	/** 정산하기 조회
	 * @param status 
	 * @param memberNo 
	 * @return
	 * @throws Exception
	 */
	public List<TutorCalculate> selectCalculateList(int status, int memberNo) throws Exception {
		Connection conn = getConnection();
		
		List<TutorCalculate> tutorcalculateList = dao.selectCalculateList(conn,status, memberNo);
		
		close(conn);
		
		return tutorcalculateList;
	}

	/** 정산 계좌 조회하기
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public TutorCalculate getaccount(int memberNo) throws Exception {
		Connection conn = getConnection();
		
		TutorCalculate tutorcalculate = dao.getaccount(conn,memberNo);
		
		close(conn);
		
		return tutorcalculate;
	}
 
	/** 정산상태 변경하기
	 * @param intValue
	 * @param stringValue
	 * @return
	 */
	public int updateSettleStatus(int intValue, String stringValue) throws Exception {
		Connection conn = getConnection();
		
		int result = dao.updateSettleStatus(conn, intValue, stringValue);
		
		if(result>0) conn.commit();
		else         conn.rollback();
		
		close(conn);
		
		return result;
	}

	/** 정산 금액 조회하기
	 * @param status
	 * @return
	 * @throws Exception
	 */
	public TutorCalculate calculatemoney(int memberNo) throws Exception {
		
		Connection conn = getConnection();
		
		TutorCalculate calculatemoney = dao.calculatemoney(conn,memberNo);
		close(conn);
		
		return calculatemoney;
		
	}
	
	/** 리뷰수 그래프 그리기
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public List<Dashboard> selectReviewCount(int memberNo) throws Exception{
		Connection conn = getConnection();
		
		List<Dashboard> reviewgraph = dao.selectReviewCount(conn,memberNo);
		
		close(conn);
		
		return reviewgraph;
	}
	
	/** 클래스 총 리뷰수 구하기
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public int allCountReview(int memberNo) throws Exception {
		Connection conn = getConnection();
		int count = dao.allCountReview(conn, memberNo);
		
		close(conn);
		
		return count;
	}

	/** 결제수 그래프 그리기
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public List<Dashboard> selectPaidCount(int memberNo)throws Exception{
		
		Connection conn = getConnection();
		
		List<Dashboard> paidgraph = dao.selectPaidCount(conn,memberNo);
		
		close(conn);
		
		return paidgraph;
	}

	/** 클래스 총 결제수 조회하기
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public int allCountPaid(int memberNo) throws Exception {

		Connection conn = getConnection();
		int count = dao.allCountPaid(conn, memberNo);
		
		close(conn);
		
		return count;
	}

	
	/** 클래스별 결제수 / 리뷰수 조회하기
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public List<Dashboard> selectReviewPaidCount(int memberNo) throws Exception {
		Connection conn = getConnection();
		List<Dashboard> scattergraph = dao.selectReviewPaidCount(conn, memberNo);
		
		close(conn);
		
		return scattergraph;
	}
	
	
	/** 튜터가 개설한 총 클래스 수 구하기
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public int classCount(int memberNo) throws Exception{
		Connection conn = getConnection();
		int classCount = dao.classCount(conn,memberNo);
		close(conn);
		
		return classCount;
	}

	
	/** 튜터 프로필 조회하기
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public tutorProfile selectProfile(int memberNo) throws Exception {
		
		Connection conn = getConnection();
		tutorProfile tutorProfile = dao.selectProfile(conn,memberNo);
		
		close(conn);
		
		return tutorProfile;
		
	}

	
	/** 튜터 프로필 수정하기
	 * @param updateProfile
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public int updateProfile(tutorProfile updateProfile, int memberNo) throws Exception {
		
		Connection conn = getConnection();
		
		updateProfile.setTutorIntroduce(Util.XSSHandling(updateProfile.getTutorIntroduce()));
		// 2) 개행 문자 처리(내용)
//		updateProfile.setTutorIntroduce(Util.newLineHandling(updateProfile.getTutorIntroduce()));
		
		int result = dao.updateProfile(conn, updateProfile, memberNo);
		
		if(result>0) conn.commit();
		else         conn.rollback();
		
		close(conn);
		
		return result;
	}


	/** 튜터 등록하기(회원 정보 변경)
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public int registerTutor(int memberNo) throws Exception {
		Connection conn = getConnection();
		int result1 = dao.registerTutor(conn, memberNo);
		
		if(result1>0) conn.commit();
		else         conn.rollback();
		
		close(conn);
		
		return result1;
	}
 
	/** 튜터 등록하기(튜터 정보 입력)
	 * @param memberNo
	 * @param register
	 * @return
	 * @throws Exception
	 */
	public int registerTutorInfo(int memberNo, TutorRegister register) throws Exception {
		Connection conn = getConnection();
		int result2 = dao.registerTutorInfo(conn, register, memberNo);
		
		register.setTutorIntroduce(Util.XSSHandling(register.getTutorIntroduce()));
		if(result2>0) conn.commit();
		else         conn.rollback();
		
		close(conn);
		
		return result2;
	}

	/** 튜터 등록하기(정산 계좌 입력)
	 * @param memberNo
	 * @param register
	 * @return
	 * @throws Exception
	 */
	public int registerAccount(int memberNo, TutorRegister register) throws Exception{
		Connection conn = getConnection();
		int result3 = dao.registerAccount(conn, register, memberNo);
		
		if(result3>0) conn.commit();
		else         conn.rollback();
		
		close(conn);
		
		return result3;
	}

	/** 등록한 튜터 정보 얻어오기
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public Member updatetutor(int memberNo) throws Exception {
		Connection conn = getConnection();
		Member loginmember2 = dao.updatetutor(conn,memberNo);
		
		close(conn);
		
		return loginmember2;
	}


	
	

	

	

	

	

	
	
}
