package talentFour.tutor.model.service;

import static talentFour.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import talentFour.tutor.dao.TutorDAO;
import talentFour.tutor.model.vo.TutorCalculate;
import talentFour.tutor.model.vo.TutorClass;
import talentFour.tutor.model.vo.TutorClassSell;

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
		
		int result = dao.updateSettleStatus(conn,intValue, stringValue);
		
		if(result>0) {
			conn.commit();
		}
		else {
			conn.rollback();
		}
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

	/** 튜터가 개설한 클래스 번호들 얻어오기
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public List<TutorClass> selectClassNo(int memberNo) throws Exception {
		Connection conn = getConnection();
		
		int[] classNoArray = dao.selectClassNo(conn,memberNo);
		
		close(conn);
		return null;
	}

	

	
	
}
