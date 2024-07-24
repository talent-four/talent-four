package talentFour.tutor.dao;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import talentFour.group.dao.GroupDAO;
import talentFour.tutor.model.vo.TutorCalculate;
import talentFour.tutor.model.vo.TutorClass;
import talentFour.tutor.model.vo.TutorClassSell;

import static talentFour.common.JDBCTemplate.*;

public class TutorDAO {
	
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Properties prop;
	
	public TutorDAO() {
		try {
			prop = new Properties();
			
			String filePath = GroupDAO.class.getResource("/talentFour/sql/tutor-sql.xml").getPath();
			prop.loadFromXML(new FileInputStream(filePath));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/** 운영중인 클래스 조회
	 * @param conn
	 * @param status
	 * @param memberNo 
	 * @return
	 * @throws Exception
	 */
	public List<TutorClass> selectClassesList(Connection conn, int status, int memberNo) throws Exception {
		
		List<TutorClass> tutorclasses = new ArrayList<>();
		
		try {
			
			String sql = prop.getProperty("selectClassesList");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, status);
			pstmt.setInt(2, memberNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				TutorClass tutorclass = new TutorClass();
				tutorclass.setClassPhoto(rs.getString(1));
				tutorclass.setClassName(rs.getString(2));
				tutorclass.setClassStatus(rs.getInt(3));
				tutorclass.setClassCreateDate(rs.getString(4));
				tutorclasses.add(tutorclass);
			}
		} finally {
			close(rs);
			close(pstmt);
		}
		return tutorclasses;
	}
	
	
	/** 운영중인 클래스 갯수 조회
	 * @param conn
	 * @param status
	 * @param memberNo 
	 * @return
	 * @throws Exception
	 */
	public TutorClass classingCount(Connection conn, int status, int memberNo) throws Exception {
		TutorClass counting = new TutorClass();
		
		try {

			// 운영중인 클래스 갯수세기
			String sql = prop.getProperty("classcount");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, status);
			pstmt.setInt(2, memberNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				counting.setClassCount(rs.getString(1));
			}
			
		} finally {
			close(rs);
			close(pstmt);
		}
		return counting;
	}
	

	/** 만료된 클래스 리스트 조회
	 * @param conn
	 * @param statusfin
	 * @param memberNo 
	 * @return
	 * @throws Exception
	 */
	public List<TutorClass> selectClassesFinList(Connection conn, int statusfin, int memberNo) throws Exception {
		List<TutorClass> tutorclassesfin = new ArrayList<>();
		
		try {
			
			String sql = prop.getProperty("selectClassesList");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, statusfin);
			pstmt.setInt(2, memberNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				TutorClass tutorclassfin = new TutorClass();
				tutorclassfin.setClassPhoto(rs.getString(1));
				tutorclassfin.setClassName(rs.getString(2));
				tutorclassfin.setClassStatus(rs.getInt(3));
				tutorclassfin.setClassCreateDate(rs.getString(4));
				tutorclassesfin.add(tutorclassfin);
				
			}

		} finally {
			close(rs);
			close(pstmt);
		}
		return tutorclassesfin;
	}

	/** 만료된 클래스 갯수 조회
	 * @param conn
	 * @param statusfin
	 * @param memberNo 
	 * @return
	 * @throws Exception
	 */
	public TutorClass classfinCount(Connection conn, int statusfin, int memberNo) throws Exception {
		TutorClass countfin = new TutorClass();
		
		try {

			// 운영중인 클래스 갯수세기
			String sql = prop.getProperty("classcount");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, statusfin);
			pstmt.setInt(2, memberNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				countfin.setClassCount(rs.getString(1));
			}
			
		} finally {
			close(rs);
			close(pstmt);
		}
		return countfin;
	}
	
	

	/** 클래스 판매 현황 조회
	 * @param conn
	 * @param memberNo 
	 * @return
	 * @throws Exception
	 */
	public List<TutorClassSell> selectClassSellList(Connection conn, int memberNo) throws Exception {
		List<TutorClassSell> tutorclassSell = new ArrayList<>();
		try {
			
			String sql = prop.getProperty("selectClassSellList");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				TutorClassSell tutorsell = new TutorClassSell();
				tutorsell.setStartDate(rs.getString(1));
				tutorsell.setMemberNickname(rs.getString(2));
				tutorsell.setBoardTitle(rs.getString(3));
				tutorsell.setPaymentStatus(rs.getString(4));
				tutorclassSell.add(tutorsell);
			}
		} finally {
			close(rs);
			close(stmt);
		}
		return tutorclassSell;
	}


	/** 정산하기 조회
	 * @param conn
	 * @param status 
	 * @return
	 * @throws Exception
	 */
	public List<TutorCalculate> selectCalculateList(Connection conn, int status) throws Exception {
		List<TutorCalculate> tutorcalculateList = new ArrayList<>();
		
		// 정산예정금액을 담을 변수
		int price = 0;
		
		// 총 정산예정 금액을 담을 변수
		int sum = 0;
		
		try {
			
			String sql = prop.getProperty("selectCalculateList");
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, status);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				TutorCalculate tutorcalculate = new TutorCalculate();
				tutorcalculate.setSettleStatus(rs.getInt(1));
				tutorcalculate.setMemberNickname(rs.getString(2));
				tutorcalculate.setBoardTitle(rs.getString(3));
				tutorcalculate.setClassPrice(rs.getInt(4));
				tutorcalculate.setCommission(rs.getInt(5));
				tutorcalculate.setSettleDate(rs.getString(6));
				// 클래스 가격 * (1-(수수료/100)
				
				price = (int) (tutorcalculate.getClassPrice()*(1-(tutorcalculate.getCommission()/100.0)));
				// 총 정산예정 금액으로 대입
				sum += price;
				// 정산 예정금액으로 변환
				tutorcalculate.setClassPrice(price);
				
				// 총 정산 예정금액으로 반환
				tutorcalculate.setIngsum(sum);
				
				
				tutorcalculateList.add(tutorcalculate);
			}
		} finally {
			close(rs);
			close(stmt);
		}
		return tutorcalculateList;
	}


	


	

}
