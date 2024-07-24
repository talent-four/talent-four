package talentFour.classes.model.service;

import talentFour.classes.model.dao.DetailPageDAO;
import talentFour.classes.model.vo.Class;
import static talentFour.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.HashMap;
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

}
