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
import talentFour.member.model.vo.Member;
import talentFour.tutor.model.vo.Dashboard;
import talentFour.tutor.model.vo.TutorCalculate;
import talentFour.tutor.model.vo.TutorClass;
import talentFour.tutor.model.vo.TutorClassSell;
import talentFour.tutor.model.vo.TutorRegister;
import talentFour.tutor.model.vo.tutorProfile;

import static talentFour.common.JDBCTemplate.*;

public class TutorDAO {

	private Statement stmt;
	private PreparedStatement pstmt;
	private PreparedStatement pstmt2;
	private PreparedStatement pstmt3;
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
			pstmt.setInt(2, memberNo);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				TutorClass tutorclass = new TutorClass();
				tutorclass.setClassNo(rs.getInt(1));
				tutorclass.setClassPhoto(rs.getString(2));
				tutorclass.setClassName(rs.getString(3));
				tutorclass.setClassStatus(rs.getInt(4));
				tutorclass.setClassCreateDate(rs.getString(5));
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
				tutorclassfin.setClassNo(rs.getInt(1));
				tutorclassfin.setClassPhoto(rs.getString(2));
				tutorclassfin.setClassName(rs.getString(3));
				tutorclassfin.setClassStatus(rs.getInt(4));
				tutorclassfin.setClassCreateDate(rs.getString(5));
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
	 * @param memberNo 
	 * @return
	 * @throws Exception
	 */
	public List<TutorCalculate> selectCalculateList(Connection conn, int status, int memberNo) throws Exception {
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

	/** 정산하기 상태 업데이트
	 * @param conn
	 * @param intValue
	 * @param stringValue
	 * @return
	 * @throws Exception
	 */
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

	/** 정산하기 중 총정산금액, 결제완료 금액, 총 정산금액 조회하기
	 * @param conn
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
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
			close(pstmt2);
		}

		return calculatemoney;
	}

	/** 리뷰수 그래프 그리기
	 * @param conn
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public List<Dashboard> selectReviewCount(Connection conn, int memberNo) throws Exception {
		
		List<Dashboard> reviewgraph = new ArrayList<>();
		try {
			
			String sql = prop.getProperty("selectReviewCount");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Dashboard review = new Dashboard();
				review.setClassNo(rs.getInt(1));
				review.setClassName(rs.getNString(2));
				review.setReviewCount(rs.getInt(3));
				
				reviewgraph.add(review);
			}
			
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return reviewgraph;
	}
	
	/** 총 리뷰수 구하기
	 * @param conn
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public int allCountReview(Connection conn, int memberNo) throws Exception {
		int result = 0;
		
		try {
			
			String sql = prop.getProperty("allCountReview");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	/** 클래스별 결제수 조회하기
	 * @param conn
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public List<Dashboard> selectPaidCount(Connection conn, int memberNo) throws Exception {
		
		List<Dashboard> paidgraph = new ArrayList<>();
		try {
			
			String sql = prop.getProperty("selectPaidCount");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Dashboard paid = new Dashboard();
				paid.setClassNo(rs.getInt(1));
				paid.setClassName(rs.getNString(2));
				paid.setPaidCount(rs.getInt(3));
				
				paidgraph.add(paid);
			}
			
		} finally {
			close(rs);
			close(pstmt);
		}
		return paidgraph;
	}

	/** 총 결제수 조회하기
	 * @param conn
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public int allCountPaid(Connection conn, int memberNo) throws Exception {

		int result = 0;
		
		try {
			
			String sql = prop.getProperty("allCountPaid");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	/** 클래스별 리뷰수, 결제수 비교하는 그래프 조회하기
	 * @param conn
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public List<Dashboard> selectReviewPaidCount(Connection conn, int memberNo) throws Exception {
		List<Dashboard> scattergraph = new ArrayList<>();
		try {
			
			String sql = prop.getProperty("selectReviewPaidCount");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Dashboard paidreview = new Dashboard();
				paidreview.setClassNo(rs.getInt(1));
				paidreview.setClassName(rs.getNString(2));
				paidreview.setReviewCount(rs.getInt(3));
				paidreview.setPaidCount(rs.getInt(4));
				
				scattergraph.add(paidreview);
			}
			
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return scattergraph;
	}
	
	public int classCount(Connection conn, int memberNo) throws Exception{
		
		int classCount = 0;
		
		try {
			
			String sql = prop.getProperty("classCount");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				classCount = rs.getInt(1);
			}
			
		} finally {
			close(rs);
			close(pstmt);
		}
		return classCount;
	}
	
	

	/** 프로필 조회하기
	 * @param conn
	 * @param memberNo
	 * @return
	 */
	public tutorProfile selectProfile(Connection conn, int memberNo) throws Exception {
		
		tutorProfile tutorProfile = new tutorProfile();
		
		try {
			
			String sql = prop.getProperty("selectProfile");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				tutorProfile.setTutorTel(rs.getString("TUTOR_TEL"));
	            tutorProfile.setTutorProfile(rs.getString("TUTOR_PROFILE"));
	            tutorProfile.setTutorIntroduce(rs.getString("TUTOR_INTRODUCER"));
	            tutorProfile.setAccount(rs.getString("TUTOR_ACCOUNT"));
	            tutorProfile.setBankName(rs.getString("BANK_NAME"));
	            tutorProfile.setTutorName(rs.getString("ACCOUNT_NAME"));
				
			}
			
		} finally {
			close(rs);
			close(pstmt);
		}
		return tutorProfile;
	}

	/** 튜터 프로필 변경하기
	 * @param conn
	 * @param updateProfile
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public int updateProfile(Connection conn, tutorProfile updateProfile, int memberNo) throws Exception {
		
		int result = 0; // 두개 성공시 반환 예정
		int result1 = 0; // sql문 update 성공여부 확인
		int result2 = 0; // sql2문 update 성공여부 확인
		
		try {
			
			// 두개의 테이블 동시에 UPDATE하는 거 불가능해서 SQL문 2개 사용 예정
			
			String sql = prop.getProperty("updateProfile");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, updateProfile.getTutorTel());
			pstmt.setString(2, updateProfile.getTutorProfile());
			pstmt.setString(3, updateProfile.getTutorIntroduce());
			pstmt.setInt(4,memberNo);
			
			result1 = pstmt.executeUpdate();
			
			String sql2 = prop.getProperty("updateAccount");
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setString(1,updateProfile.getAccount());
			pstmt2.setString(2,updateProfile.getBankName());
			pstmt2.setString(3,updateProfile.getTutorName());
			pstmt2.setInt(4,memberNo);
			
			result2 = pstmt2.executeUpdate();
			
			if(result1 ==1 && result2 ==1) {
				result = 1;
			}
			
			System.out.println(result);
			
		} finally {
			close(pstmt2);
			close(pstmt);
		}
		
		return result;
	}

	/** 튜터 등록하기
	 * @param conn
	 * @param register
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public int register(Connection conn, TutorRegister register, int memberNo) throws Exception {
		
		int result = 0;
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		
		try {
			
			String sql = prop.getProperty("registerTutor");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			result1 = pstmt.executeUpdate();
			System.out.println("result1 : " + result1);
			
			if(result1>0) conn.commit();
			else conn.rollback();
			
			String sql2 = prop.getProperty("registerTutorInfo");
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setInt(1, memberNo);
			pstmt2.setString(2, register.getEducation());
			pstmt2.setString(3, register.getTutorTel());
			pstmt2.setString(4, register.getTutorProfile());
			pstmt2.setString(5, register.getTutorIntroduce());
			
			result2 = pstmt2.executeUpdate();
			System.out.println("result2 : " + result2);
			
			if(result2>0) conn.commit();
			else conn.rollback();
			
			
			String sql3 = prop.getProperty("registerAccount");
			pstmt3 = conn.prepareStatement(sql3);
			pstmt3.setInt(1, memberNo);
			pstmt3.setString(2, register.getAccountName());
			pstmt3.setString(3,register.getBankName());
			pstmt3.setString(4,register.getAccount());
			
			result3 = pstmt3.executeUpdate();
			System.out.println("result3 : " + result3);
			
			if(result3>0) conn.commit();
			else conn.rollback();
			
			
			if (result1 == 1 && result2 == 1 && result3 == 1) {
	            result = 1;
	        } 
			
		} finally {
			close(pstmt);
		}
		return result;
	}

	/** 튜터 등록하기(회원 상태 변경)
	 * @param conn
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public int registerTutor(Connection conn, int memberNo) throws Exception {
		
		int result1 = 0;
		
		try {
			String sql = prop.getProperty("registerTutor");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			result1 = pstmt.executeUpdate();
			
		} finally {
			close(pstmt);
		}
		return result1;
	}

	/** 튜터 등록하기(튜터 정보 입력)
	 * @param conn
	 * @param register
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public int registerTutorInfo(Connection conn, TutorRegister register, int memberNo) throws Exception {
		int result2 = 0;
		
		try {
			String sql = prop.getProperty("registerTutorInfo");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			pstmt.setString(2, register.getEducation());
			pstmt.setString(3, register.getTutorTel());
			pstmt.setString(4, register.getTutorProfile());
			pstmt.setString(5, register.getTutorIntroduce());
			
			result2 = pstmt.executeUpdate();
			
		} finally {
			close(pstmt);
		}
		return result2;
	}

	/**튜터 등록하기(정산 계좌 입력)
	 * @param conn
	 * @param register
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public int registerAccount(Connection conn, TutorRegister register, int memberNo) throws Exception {
		int result3 = 0;
		
		try {
			String sql = prop.getProperty("registerAccount");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			pstmt.setString(2, register.getAccountName());
			pstmt.setString(3, register.getBankName());
			pstmt.setString(4, register.getAccount());
			
			result3 = pstmt.executeUpdate();
			System.out.println("result3:"+ result3);
			
		} finally {
			close(pstmt);
		}
		return result3;
	}

	/** 튜터등록한 맴버 정보 업데이트
	 * @param conn
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public Member updatetutor(Connection conn, int memberNo) throws Exception {
		
		Member loginmember2 = new Member();
		try {
			
			String sql = prop.getProperty("updatetutor");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				loginmember2.setMemberStatus(rs.getInt(1));
			}
			
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return loginmember2;
	}


}
