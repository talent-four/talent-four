package talentFour.classes.model.service;

import talentFour.classes.model.dao.DetailPageDAO;
import talentFour.classes.model.vo.Category;
import talentFour.classes.model.vo.Class;
import talentFour.member.model.vo.Member;

import static talentFour.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DetailPageService {
	
	private DetailPageDAO dao = new DetailPageDAO();
	
	public Map<String, Object> getClass(int classNo) throws Exception {
		Connection conn = getConnection();
		
		// 클래스 정보 가져오기
		Class c = dao.getClass(conn, classNo);
		
		// 튜터 정보 가져오기
		String[] tutorInfo = dao.getTutorIntro(conn, c);
		
		
		Map<String, Object> classMap = new HashMap<>();
		classMap.put("classDetail", c);
		classMap.put("tutorInfo", tutorInfo);
		
		close(conn);
		
		return classMap;
	}

	public int insertClass(Class c, Member loginMember) throws Exception {
		
		Connection conn = getConnection();
		
		int classNo = dao.insertClass(conn, c, loginMember);
		
		if(classNo > 0) commit(conn);
		else rollback(conn);
		
		
		return 0;
	}

	public List<Category> getSubCategory(String main, List<Category> categoryList) {
		// 카테고리 리스트 중, 선택한 메인 카테고리에 해당하는 서브 카테고리 찾기
		for(Category subCategory : categoryList) { 
			if(subCategory.getCategoryName().equals(main)) {
				List<Category> subCategorys = subCategory.getSubCategory();
				return subCategorys;
			}
		}
		return null;
	}

}
