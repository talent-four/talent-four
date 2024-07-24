package talentFour.wonder.service;


import static talentFour.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import talentFour.wonder.dao.wonderDAO;
import talentFour.wonder.vo.wonderBoard;



public class WonderService {
	private wonderDAO dao = new wonderDAO();

	/** 자유게시판 리스트
	 * @param board_cd
	 * @param wonderType
	 * @return
	 */
	public List<wonderBoard> selectlistFree() throws Exception {
		Connection conn = getConnection();
		
		List<wonderBoard>  wonderfreeboard = dao.selectlistFree(conn);
		
		close(conn);

		return wonderfreeboard;
	}

}
