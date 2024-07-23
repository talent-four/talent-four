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
	
	
	/**
	 * @return
	 */
	public List<GroupMain> selectBoardList() throws Exception {

		Connection conn = getConnection();
		
		List<GroupMain> GroupBoardList = dao.selectBoardList(conn);
		
		close(conn);
		
		return GroupBoardList;
	}
}
