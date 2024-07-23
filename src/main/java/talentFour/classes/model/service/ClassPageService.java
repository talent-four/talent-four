package talentFour.classes.model.service;

import java.sql.Connection;
import java.util.List;

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

	public List<Class> getClasses(String subCategoryCode) throws Exception {
		List<Class> classList;
		
		Connection conn = getConnection();
		
		classList = dao.getClasses(conn, subCategoryCode);
		
		close(conn);
		
		return classList;
	}

	public List<Class> getMainClasses(String mainCategoryCode) throws Exception {
		List<Class> classList;
		
		Connection conn = getConnection();
		
		classList = dao.getMainClasses(conn, mainCategoryCode);
		
		close(conn);
		
		return classList;
	}

	public List<Class> getAllClasses() throws Exception {
		List<Class> classList;
		
		Connection conn = getConnection();
		
		classList = dao.getAllClasses(conn);
		
		close(conn);
		
		return classList;
	}

}
