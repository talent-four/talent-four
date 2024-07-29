package talentFour.classes.model.service;

import talentFour.classes.model.dao.DetailPageDAO;
import talentFour.classes.model.vo.Class;
import static talentFour.common.JDBCTemplate.*;

import java.sql.Connection;

public class DetailPageService {
	
	private DetailPageDAO dao = new DetailPageDAO();
	
	public Class getClass(int classNo) throws Exception {
		Connection conn = getConnection();
		
		Class c = dao.getClass(conn, classNo);
				
		close(conn);
		
		return c;
	}

}
