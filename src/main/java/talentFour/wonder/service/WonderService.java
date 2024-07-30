package talentFour.wonder.service;

import static talentFour.common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import talentFour.wonder.dao.wonderDAO;
import talentFour.wonder.vo.Pagination;
import talentFour.wonder.vo.wonderBoard;

public class WonderService {
    private wonderDAO dao = new wonderDAO();

    public Map<String, Object> selectlistFree(int type, int cp, int itemsPerPage) throws SQLException {
        Connection conn = null;
        Map<String, Object> map = new HashMap<>();
        
        try {
            conn = getConnection();
            
            String boardName = dao.selectBoardName(conn, type);
            int listCount = dao.getListCount(conn, type);
            
            // Pagination 객체 생성
            Pagination pagination = new Pagination(cp, listCount, itemsPerPage);
            
            // 게시글 리스트 가져오기
            List<wonderBoard> wonderFreeList = dao.selectBoardList(conn, type, pagination);
            
            // 결과를 맵에 담기
            map.put("boardName", boardName);
            map.put("pagination", pagination);
            map.put("boardList", wonderFreeList);
        } finally {
            // 연결 종료
            close(conn);
        }
        
        return map;
    }

    public Map<String, Object> selectBoardById(String id) throws Exception {
    	Connection conn = null;
        Map<String, Object> result = new HashMap<>();
       
        try {
            conn = getConnection();

        	 wonderBoard board = dao.getBoardById(conn,id);
            
        	result.put("board", board);
        }finally {
        	close(conn);
        }
        
        return result;
    }

	/** 글쓰기
	 * @param title
	 * @param content
	 * @param memberNo
	 * @return
	 */
	public int writeBoard(String title, String content, int memberNo) throws Exception {
		int result =0;
		Connection conn = null;
		try {
	        conn = getConnection();
	        conn.setAutoCommit(false); // Begin transaction

	        result = dao.insertBoard(conn, title, content, memberNo);

	        if (result > 0) {
	            conn.commit();
	        } else {
	            conn.rollback();
	        }
	    }finally {
	    	close(conn);
	    }
		return result;
		
	}
}
