package talentFour.classes.model.dao;

import static talentFour.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import talentFour.classes.model.vo.Category;
import talentFour.classes.model.vo.Class;
import talentFour.member.model.vo.Member;

public class DetailPageDAO {

	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;

	private Properties prop;
	
	public DetailPageDAO() {
		try {
			prop = new Properties();
			
			String filePath = ClassPageDAO.class.getResource("/talentFour//sql/board-sql.xml").getPath();
			prop.loadFromXML(new FileInputStream(filePath));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	public Class getClass(Connection conn, int classNo) throws Exception {
		Class c = new Class();
		String sql = prop.getProperty("getClass");
		
		try {
			// 대분류 가져오기
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, classNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				c = new Class();
				c.setClassNo(rs.getInt(1));
				c.setClassName(rs.getString(2));
				c.setClassIntro(rs.getString(3));
				c.setClassPhoto(rs.getString(4));
				c.setClassUrl(rs.getString(5));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				c.setClassCreateDt(sdf.format(rs.getDate(6)));
				c.setClassStatus(rs.getInt(7));
				c.setClassPrice(rs.getInt(8));
				c.setMemberNo(rs.getInt(9));
				c.setCategoryCode(rs.getString(10));
				c.setMemberNickname(rs.getString(11));
				c.setMemberProfile(rs.getString(12));
				c.setSub(rs.getString(13));
				c.setMain(rs.getString(14));
				c.setReviews(rs.getInt(15));
				c.setScore(rs.getFloat(16));
			}
			
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return c;
	}


	public String[] getTutorIntro(Connection conn, int memberNo) throws Exception {
		String[] getTutorInfo = new String[3];
		
		String sql = prop.getProperty("getTutorIntro");
		
		try {
			// 대분류 가져오기
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memberNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				getTutorInfo[0] = rs.getString(1);
				getTutorInfo[1] = rs.getString(2);
				getTutorInfo[2] = rs.getString(3);
			}
			
		} finally {
			
		}
		
		return getTutorInfo;
	}


	/** 클래스 번호에 클래스 삽입
	 * @param conn
	 * @param c
	 * @param loginMember
	 * @return result
	 * @throws Exception
	 */
	public int insertClass(Connection conn, Class c, Member loginMember) throws Exception {
		int result = 0;
		
		try {
			String sql = prop.getProperty("insertClass");
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, c.getClassNo());
			pstmt.setString(2, c.getClassName());
			pstmt.setString(3, c.getClassIntro());
			pstmt.setString(4, c.getClassPhoto());
			pstmt.setString(5, c.getClassUrl());
			pstmt.setInt(6, c.getClassPrice());
			pstmt.setInt(7, loginMember.getMemberNo());
			pstmt.setString(8, c.getSub());
			
			result = pstmt.executeUpdate();
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	/** 클래스 번호 가져오기
	 * @param conn
	 * @return classNo
	 * @throws Exception
	 */
	public int nextClassNo(Connection conn)  throws Exception {
		int classNo = 0;
		
		try {
			String sql = prop.getProperty("nextClassNo");
			
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				classNo = rs.getInt(1);
			}
			
		} finally {
			close(rs);
			close(stmt);
		}
		
		return classNo;
	}


	/** 클래스 번호로 튜터 조회
	 * @param conn
	 * @param classNo
	 * @return
	 */
	public String[] getTutorInfoClass(Connection conn, int classNo) throws Exception {
		String[] getTutorInfo = new String[3];
		
		String sql = prop.getProperty("getTutorIntroClass");
		
		try {
			// 대분류 가져오기
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, classNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				getTutorInfo[0] = rs.getString(1);
				getTutorInfo[1] = rs.getString(2);
				getTutorInfo[2] = rs.getString(3);
			}
			
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return getTutorInfo;
	}


	/** 클래스 번호로 클래스 지우기
	 * @param conn
	 * @param classNo
	 * @return result
	 * @throws Exception
	 */
	public int deleteClass(Connection conn, int classNo) throws Exception {
		int result = 0;
		
		String sql = prop.getProperty("deleteClass");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, classNo);
			
			result = pstmt.executeUpdate();
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	/** 클래스 번호와 클래스 정보로 업데이트
	 * @param conn
	 * @param classNo
	 * @param c
	 * @return result
	 * @throws Exception
	 */
	public int updateClass(Connection conn, Class c) throws Exception {
		int result = 0;
		
		String sql = prop.getProperty("updateClass");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, c.getClassName());
			pstmt.setString(2, c.getClassIntro());
			pstmt.setString(3, c.getClassPhoto());
			pstmt.setString(4, c.getClassUrl());
			pstmt.setInt(5, c.getClassPrice());
			pstmt.setString(6, c.getSub());
			pstmt.setInt(7, c.getClassNo());
			
			result = pstmt.executeUpdate();
			System.out.println("result : " + result);
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public Boolean checkMyClass(Connection conn, int memberNo, int classNo) throws Exception {
		Boolean result = false;
		
		String sql = prop.getProperty("checkMyClass");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, classNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = true;
			}
			
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return result;
	}


	public Boolean checkPaidClass(Connection conn, int memberNo, int classNo) throws Exception {
		Boolean result = false;
		
		String sql = prop.getProperty("checkPaidClass");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, classNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = true;
			}
			
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return result;
	}


	public int insertPaid(Connection conn, int classNo, int memberNo, String payment) throws Exception {
		int result = 0;
		
		String sql = prop.getProperty("insertPaid");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, classNo);
			pstmt.setString(3, payment);
			
			result = pstmt.executeUpdate();
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
