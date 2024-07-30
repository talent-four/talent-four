package talentFour.classes.model.service;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import talentFour.classes.model.dao.ClassPageDAO;
import talentFour.classes.model.vo.Category;

import static talentFour.common.JDBCTemplate.*;
import talentFour.classes.model.vo.Class;

public class ClassPageService {

	private ClassPageDAO dao = new ClassPageDAO();
	

	/** 대분류 소분류 카테고리 서비스
	 * @return categoryList
	 * @throws Exception
	 */
	public List<Category> getCategory() throws Exception {
		List<Category> categoryList;
		
		Connection conn = getConnection();
		
		categoryList = dao.getCategory(conn);
		
		close(conn);
		
		return categoryList;
	}

	public List<Class> getClasses(String subCategoryCode, String orderTag) throws Exception {
		List<Class> classList;
		
		Connection conn = getConnection();
		
		String orderBy = sort(orderTag);
		
		classList = dao.getClasses(conn, subCategoryCode, orderBy);
		
		close(conn);
		
		return classList;
	}

	public List<Class> getMainClasses(String mainCategoryCode, String orderTag) throws Exception {
		List<Class> classList;
		
		Connection conn = getConnection();
		
		String orderBy = sort(orderTag);
		
		classList = dao.getMainClasses(conn, mainCategoryCode, orderBy);
		
		close(conn);
		
		return classList;
	}

	public List<Class> getAllClasses(String orderTag) throws Exception {
		List<Class> classList;
		
		Connection conn = getConnection();
		
		String orderBy = sort(orderTag);
		
		classList = dao.getAllClasses(conn, orderBy);
		
		close(conn);
		
		return classList;
	}
	
	private String sort(String orderTag) {
		String result = "";
		if(orderTag == null) return result;
		
		switch (orderTag) {
		case "date": result = " ORDER BY 날짜 DESC"; break;
		case "review": result = " ORDER BY 리뷰수 DESC"; break;
		case "score": result = " ORDER BY 평점 DESC"; break;
		default: result = ""; break;
		}
		
		return result;
	}

	public List<Class> getQueryClasses(String orderTag, String query) throws Exception {
		List<Class> classList;
		
		Connection conn = getConnection();
		
		String orderBy = sort(orderTag);
		
		classList = dao.getQueryClasses(conn, orderBy, query);
		
		close(conn);
		
		return classList;
	}
	

}
