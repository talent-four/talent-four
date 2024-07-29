package talentFour.classes.model.service;

import talentFour.classes.model.dao.DetailPageDAO;
import talentFour.classes.model.vo.Category;
import talentFour.classes.model.vo.Class;
import talentFour.member.model.vo.Member;
import talentFour.common.Util;

import static talentFour.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DetailPageService {
	
	private DetailPageDAO dao = new DetailPageDAO();
	
	public Class getClass(int classNo) throws Exception {
		Connection conn = getConnection();
		
		// 클래스 정보 가져오기
		Class c = dao.getClass(conn, classNo);
		
		// XSS 핸들링
		c.setClassIntro(Util.unescapeXSS(c.getClassIntro()));
		
		close(conn);
		
		return c;
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
		
		// XSS 방지
		c.setClassName(Util.XSSHandling(c.getClassName()));
		c.setClassIntro(Util.XSSHandling(c.getClassIntro()));
		
		// 개행문자 처리
		c.setClassIntro(Util.newLineHandling(c.getClassIntro()));
		
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

	/** 클래스 번호로 튜터 정보 가져오기 0 : 프로필, 1 : 자기소개, 2 : 이름
	 * @param loginMember
	 * @return tutorInfo
	 */
	public String[] getTutorInfoClass(int classNo) throws Exception {
		Connection conn = getConnection();
		
		// 튜터 정보 가져오기
		String[] tutorInfo = dao.getTutorInfoClass(conn, classNo);
		
		close(conn);
		
		return tutorInfo;
	}
	
	/** 로그인한 회원으로 튜터 정보 가져오기 0 : 프로필, 1 : 자기소개, 2 : 이름
	 * @param loginMember
	 * @return tutorInfo
	 */
	public String[] getTutorInfo(int memberNo) throws Exception {
		Connection conn = getConnection();
		
		// 튜터 정보 가져오기
		String[] tutorInfo = dao.getTutorIntro(conn, memberNo);
		
		close(conn);
		
		return tutorInfo;
	}

	
	/** 클래스 번호로 클래스 삭제하기
	 * @param classNo
	 * @return
	 * @throws Exception
	 */
	public int deleteClass(int classNo) throws Exception {
		Connection conn = getConnection();
		
		// 튜터 정보 가져오기
		int result = dao.deleteClass(conn, classNo);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}

	
	/** 클래스 번호와 클래스 정보로 업데이트
	 * @param classNo
	 * @param c
	 * @return result
	 * @throws Exception
	 */
	public int updateClass(Class c) throws Exception {
		Connection conn = getConnection();
		
		// XSS 방지
		c.setClassName(Util.XSSHandling(c.getClassName()));
		c.setClassIntro(Util.XSSHandling(c.getClassIntro()));
		
		// 개행문자 처리
		c.setClassIntro(Util.newLineHandling(c.getClassIntro()));
		
		int result = dao.updateClass(conn, c);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}

}
