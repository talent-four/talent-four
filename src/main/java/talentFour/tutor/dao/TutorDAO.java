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
	private Statement stmt2;
	private PreparedStatement pstmt;
	private PreparedStatement pstmt2;
	private ResultSet rs;
	private ResultSet rs2;

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
	 * @return
	 * @throws Exception
	 */
	public List<TutorClass> selectClassesList(Connection conn, int status, int memberNo) throws Exception {
		List<TutorClass> tutorclasses = new ArrayList<>();

		try {

			String sql = prop.getProperty("selectClassesList");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, status);
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
	 * @return
	 * @throws Exception
	 */
	public TutorClass classingCount(Connection conn, int status) throws Exception {
		TutorClass counting = new TutorClass();

		try {

			// 운영중인 클래스 갯수세기
			String sql = prop.getProperty("classcount");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, status);
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
	 * @return
	 * @throws Exception
	 */
	public List<TutorClass> selectClassesFinList(Connection conn, int statusfin) throws Exception {
		List<TutorClass> tutorclassesfin = new ArrayList<>();

		try {

			String sql = prop.getProperty("selectClassesList");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, statusfin);
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
	 * @return
	 * @throws Exception
	 */
	public TutorClass classfinCount(Connection conn, int statusfin) throws Exception {
		TutorClass countfin = new TutorClass();

		try {

			// 운영중인 클래스 갯수세기
			String sql = prop.getProperty("classcount");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, statusfin);
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
	 * @return
	 * @throws Exception
	 */
	public List<TutorClassSell> selectClassSellList(Connection conn) throws Exception {
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
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, status);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				TutorCalculate tutorcalculate = new TutorCalculate();
				tutorcalculate.setSettleStatus(rs.getInt(1));
				tutorcalculate.setMemberNickname(rs.getString(2));
				tutorcalculate.setMemberNo(rs.getInt(3));
				tutorcalculate.setClassName(rs.getString(4));
				tutorcalculate.setClassPrice(rs.getInt(5));
				tutorcalculate.setCommission(rs.getInt(6));
				tutorcalculate.setSettleDate(rs.getString(7));

				// 클래스 가격 * (1-(수수료/100)
				price = (int)((tutorcalculate.getClassPrice())*(1-(tutorcalculate.getCommission()/100.0)));
				// 정산 예정금액으로 변환
				tutorcalculate.setClassPrice(price);

				// 총 정산 예정금액으로 반환
				tutorcalculateList.add(tutorcalculate);

			}
		} finally {
			close(rs);
			close(pstmt);
		}

		return tutorcalculateList;
	}

	/** 정산 계좌 조회하기
	 * @param conn
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public TutorCalculate getaccount(Connection conn, int memberNo) throws Exception{

		TutorCalculate tutorcalculate = new TutorCalculate();

		try {

			String sql = prop.getProperty("getaccount");
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				tutorcalculate.setBankName(rs.getString(1));
				tutorcalculate.setAccount(rs.getString(2));
				tutorcalculate.setAccountName(rs.getString(3));
			}

		} finally {
			close(rs);
			close(pstmt);
		}
		return tutorcalculate;
	}

	public int updateSettleStatus(Connection conn, int intValue, String stringValue) throws Exception{
		int result = 0;

		try {
			String sql = prop.getProperty("updateSettleStatus");

			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, intValue);
			pstmt.setString(2, stringValue);

			result = pstmt.executeUpdate();

		} finally {
			close(pstmt);
		}
		return result;
	}

	public TutorCalculate calculatemoney(Connection conn, int memberNo) throws Exception {

		TutorCalculate calculatemoney = new TutorCalculate();
		TutorCalculate calculatemoney2 = new TutorCalculate();
		int price = 0;
		int price2 = 0;
		int sum = 0;
		int sum2 = 0;

		try {
			String sql = prop.getProperty("seleceing");

			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);

			rs = pstmt.executeQuery();

			while(rs.next()) {
				calculatemoney.setSettleStatus(rs.getInt(1));
				calculatemoney.setMemberNickname(rs.getString(2));
				calculatemoney.setMemberNo(rs.getInt(3));
				calculatemoney.setClassName(rs.getString(4));
				calculatemoney.setClassPrice(rs.getInt(5));
				calculatemoney.setCommission(rs.getInt(6));
				calculatemoney.setSettleDate(rs.getString(7));

				// 클래스 가격 * (1-(수수료/100)
				price = (int)((calculatemoney.getClassPrice())*(1-(calculatemoney.getCommission()/100.0)));

				// 정산 예정금액으로 변환
				calculatemoney.setClassPrice(price);

				sum += price;

				calculatemoney.setIngsum(sum);

			}
			
			String sql2 = prop.getProperty("selecrfin");
			pstmt2= conn.prepareStatement(sql2);
			pstmt2.setInt(1, memberNo);

			rs2 = pstmt2.executeQuery();
			
			while(rs2.next()) {
				calculatemoney2.setSettleStatus(rs2.getInt(1));
				calculatemoney2.setMemberNickname(rs2.getString(2));
				calculatemoney2.setMemberNo(rs2.getInt(3));
				calculatemoney2.setClassName(rs2.getString(4));
				calculatemoney2.setClassPrice(rs2.getInt(5));
				calculatemoney2.setCommission(rs2.getInt(6));
				calculatemoney2.setSettleDate(rs2.getString(7));

				// 클래스 가격 * (1-(수수료/100)
				price2 = (int)((calculatemoney2.getClassPrice())*(1-(calculatemoney2.getCommission()/100.0)));

				// 정산 예정금액으로 변환
				calculatemoney2.setClassPrice(price2);

				sum2 += price2;

				calculatemoney2.setFinsum(sum2);

			}
			int sum3 = calculatemoney.getIngsum();
			int sum4 = calculatemoney2.getFinsum();
			
			calculatemoney.setIngsum(sum3);
			calculatemoney.setFinsum(sum4);
			
		} finally {
			close(rs);
			close(pstmt);
		}

		return calculatemoney;
	}

	public int[] selectClassNo(Connection conn, int memberNo) throws Exception {
		
		int[] classNoArray = new int[];
		
		try {
			
			String sql = prop.getProperty("selectClassNo");
			
			
		} finally {
			
			
			
		}
		
		
		
		return null;
	}







}
