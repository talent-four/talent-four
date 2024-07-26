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

	/** 게시글 삽입 메소드
	 * @param c
	 * @param loginMember
	 * @return classNo
	 * @throws Exception
	 */
	public int insertClass(Class c, Member loginMember) throws Exception {
		
		Connection conn = getConnection();
		
		// 삽입할 클래스 번호 얻어오기
		int classNo = dao.nextClassNo(conn);
		
		// 가져온 클래스 번호를 클래스 vo에 삽입
		c.setClassNo(classNo);
		
		// 클래스 데이터 삽입
		int result = dao.insertClass(conn, c, loginMember);
		
		if(result > 0) commit(conn);
		else {
			classNo = 0; // 삽입 실패했으면, 0번으로 바꿔서 실패 전달
			rollback(conn);
		}
		
		close(conn);
		
		return classNo;
	}

	/** 메인 카테고리 받아서, 서브 카테고리 찾아 반환
	 * @param main
	 * @param categoryList
	 * @return subCategorys
	 */
	public List<Category> getSubCategory(String main, List<Category> categoryList) {
		// 카테고리 리스트 중, 선택한 메인 카테고리에 해당하는 서브 카테고리 찾기
		for(Category subCategory : categoryList) { 
			if(subCategory.getCategoryCode().equals(main)) {
				List<Category> subCategorys = subCategory.getSubCategory();
				return subCategorys;
			}
		}
		return null;
	}

}
