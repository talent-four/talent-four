package talentFour.classes.model.dao;

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

import static talentFour.common.JDBCTemplate.*;

public class ClassPageDAO {
	
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;

	private Properties prop;
	
	public ClassPageDAO() {
		try {
			prop = new Properties();
			
			String filePath = ClassPageDAO.class.getResource("/talentFour/sql/board-sql.xml").getPath();
			prop.loadFromXML(new FileInputStream(filePath));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	/** 카테고리 리스트 가져오기 대분류, 소분류
	 * @param conn
	 * @return mainCategoryList
	 * @throws Exception
	 */
	public List<Category> getCategory(Connection conn) throws Exception {
		List<Category> mainCategoryList = new ArrayList<>();
		String sql = prop.getProperty("getMainCategory");
		
		try {
			// 대분류 가져오기
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			while(rs.next()) {
				Category category = new Category();
				category.setCategoryCode(rs.getString(1));
				category.setCategoryName(rs.getString(2));
				
				mainCategoryList.add(category);
			}
			
			// 소분류 가져오기
			for(Category mainCategory : mainCategoryList) {
				List<Category> subCategoryList = new ArrayList<>();
				sql = prop.getProperty("getSubCategory");
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mainCategory.getCategoryCode());
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					Category subCategory = new Category();
					subCategory.setCategoryCode(rs.getString(1));
					subCategory.setCategoryName(rs.getString(2));
					subCategory.setParentId(rs.getString(3));
					
					subCategoryList.add(subCategory);
				}
				mainCategory.setSubCategory(subCategoryList);
			}
			
		} finally {
			close(rs);
			close(stmt);
			close(pstmt);
		}
		
		return mainCategoryList;
	}


	public List<Class> getClasses(Connection conn, String subCategoryCode, String orderBy) throws Exception {
		List<Class> classList = new ArrayList<>();
		
		try {
			String sql = prop.getProperty("getClasses") + orderBy;
				
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, subCategoryCode);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Class c = new Class();
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
				c.setReviews(rs.getInt(12));
				c.setScore(rs.getFloat(13));
				classList.add(c);
			}
			
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return classList;
	}


	public List<Class> getMainClasses(Connection conn, String mainCategoryCode, String orderBy) throws Exception {
		List<Class> classList = new ArrayList<>();
		
		try {
			String sql = prop.getProperty("getMainClasses") + orderBy;
				
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mainCategoryCode);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Class c = new Class();
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
				c.setReviews(rs.getInt(12));
				c.setScore(rs.getFloat(13));
				classList.add(c);
			}
			
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return classList;
	}


	public List<Class> getAllClasses(Connection conn, String orderBy) throws Exception {
		List<Class> classList = new ArrayList<>();
		
		try {
			String sql = prop.getProperty("getAllClasses") + orderBy;
				
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				Class c = new Class();
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
				c.setReviews(rs.getInt(12));
				c.setScore(rs.getFloat(13));
				classList.add(c);
			}
			
		} finally {
			close(rs);
			close(stmt);
		}
		
		return classList;
	}


	public List<Class> getQueryClasses(Connection conn, String orderBy, String query) throws Exception {
		List<Class> classList = new ArrayList<>();
		
		try {
			String sql = prop.getProperty("getQueryClasses") + orderBy;
				
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%" + query + "%");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Class c = new Class();
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
				c.setReviews(rs.getInt(12));
				c.setScore(rs.getFloat(13));
				classList.add(c);
			}
			
		} finally {
			close(rs);
			close(stmt);
		}
		
		return classList;
	}

}
