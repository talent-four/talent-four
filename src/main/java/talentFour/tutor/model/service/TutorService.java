package talentFour.tutor.model.service;

import static talentFour.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

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
		
		List<TutorClass> tutorclasses = dao.selectClassesList(conn,status,memberNo);
		
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
		
		List<TutorClass> tutorclassesfin = dao.selectClassesFinList(conn,statusfin,memberNo);
		
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
	 * @return
	 * @throws Exception
	 */
	public List<TutorCalculate> selectCalculateList(int status) throws Exception {
		Connection conn = getConnection();
		
		List<TutorCalculate> tutorcalculateList = dao.selectCalculateList(conn,status);
		
		close(conn);
		
		return tutorcalculateList;
	}

	

	
	
}
