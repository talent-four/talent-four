package talentFour.group.model.service;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import talentFour.group.dao.GroupDAO;
import talentFour.group.model.vo.GroupMain;

import static talentFour.common.JDBCTemplate.*;

public class GroupService {
	private GroupDAO dao = new GroupDAO();
	private Connection conn;
	
	
	
	/** 스터디 모집 메인 리스트 조회하기
	 * @return
	 * @throws Exception
	 */
	public List<GroupMain> selectBoardList() throws Exception {

		Connection conn = getConnection();
		
		List<GroupMain> GroupBoardList = dao.selectBoardList(conn);
		
		close(conn);
		
		return GroupBoardList;
		
		
		
		
		
	}
}
