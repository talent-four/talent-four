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
				c.setMain(rs.getString(13));
				c.setSub(rs.getString(14));
				c.setReviews(rs.getInt(15));
				c.setScore(rs.getFloat(16));
			}
			
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return c;
	}


	public String[] getTutorIntro(Connection conn, Class c) throws Exception {
		String[] getTutorInfo = new String[2];
		
		String sql = prop.getProperty("getTutorIntro");
		
		try {
			// 대분류 가져오기
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, c.getMemberNo());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				getTutorInfo[0] = rs.getString(1);
				getTutorInfo[1] = rs.getString(2);
			}
			
		} finally {
			
		}
		
		return getTutorInfo;
	}


	public int insertClass(Connection conn, Class c, Member loginMember) throws Exception {
		int classNo = 0;
		String sql = prop.getProperty("insertClass");
		
		try {
			
			
		} finally {
			
		}
		
		return classNo;
	}

}
