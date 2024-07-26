package talentFour.wonder.dao;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import static talentFour.common.JDBCTemplate.*;

import talentFour.wonder.vo.Pagination;
import talentFour.wonder.vo.wonderBoard;

public class wonderDAO {
	
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Properties prop;


	public wonderDAO() {

		try {
			prop = new Properties();
			String filePath = wonderDAO.class.getResource("/talentFour/sql/wonder-sql.xml").getPath();

			prop.loadFromXML(new FileInputStream(filePath));


		}catch(Exception e) {
			e.printStackTrace();
		}

	}

	/** 게시판 이름 조회 DAO
	 * @param conn
	 * @param type
	 * @return boardName
	 * @throws Exception
	 */
	public String selectBoardName(Connection conn, int type) throws Exception{
		
		String boardName= null;
		
		try {
			String sql = prop.getProperty("selectBoardName");
			pstmt = conn.prepareStatement(sql);
			pstmt. setInt(1, type);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				boardName = rs.getString(1);
			}
			
		}finally{
			close(rs);
			close(pstmt);
			
		}
		
		return boardName;
		
		
	}


	/** 게시글 목록 조회 DAO
	 * @param conn
	 * @param type
	 * @return listCount
	 * @throws Exception 
	 * 
	 */
	
	public int getListCount(Connection conn, int type) throws Exception {
		int listCount = 0;
		
		try {
			String sql = prop.getProperty("getListCount");
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, type);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
			
		}finally{
			close(rs);
			close(pstmt);
			
		}

		return listCount;
	}


	/** 특정 게시판에서 일정한 범위의 목록 조회 dAO
	 * @param conn
	 * @param type
	 * @param pagination
	 * @return
	 * @throws Exception 
	 */
	public List<wonderBoard> selectBoardList(Connection conn, int type, Pagination pagination) throws Exception {
		
		List<wonderBoard> boardList = new ArrayList<>();
		
		try {
			String sql = prop.getProperty("selectBoardList");
			
			int start = (pagination.getCurrentPage() -1) * pagination.getLimit()+1;
			int end = start + pagination.getLimit() -1;
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,type);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
		}finally {
			
		}
		
		
		return null;
	}



	

}
