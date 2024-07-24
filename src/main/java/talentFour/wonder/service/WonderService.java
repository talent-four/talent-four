package talentFour.wonder.service;


import static talentFour.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import talentFour.wonder.dao.wonderDAO;
import talentFour.wonder.vo.Pagination;
import talentFour.wonder.vo.wonderBoard;



public class WonderService {
	private wonderDAO dao = new wonderDAO();

	/** 자유게시판 리스트
	 * @param cp 
	 * @param type 
	 * @param board_cd
	 * @param wonderType
	 * @return
	 */
	public Map<String, Object> selectlistFree(int type, int cp) throws Exception {
		Connection conn = getConnection();
		String boardName =  dao.selectBoardName(conn,type);
		
		int listCount = dao.getListCount(conn,type);
		
		Pagination pagination = new Pagination(cp,listCount);
		
		List<wonderBoard> wonderFreeList = dao.selectBoardList(conn, type, pagination);
		
		close(conn);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("boardName", boardName);
		map.put("pagingation", pagination);
		map.put("boardList", wonderFreeList);
		
		close(conn);

		return map;
	}

	public Map<String, Object> searchFreeBoardList(int type, int cp, String key, String query) {
		return null;
	}

}
