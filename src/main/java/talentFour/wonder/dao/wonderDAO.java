package talentFour.wonder.dao;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import static talentFour.common.JDBCTemplate.*;
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
	
	/** 자유로운궁금증
	 * @param conn
	 * @param board_cd
	 * @param wonderType
	 * @return
	 * @throws Exception
	 */
	public List<wonderBoard> selectlistFree(Connection conn) throws Exception {
		
		List<wonderBoard> wonderFreeList = new ArrayList<>();
		
		try {
			String sql = prop.getProperty("selectlistFree");
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				wonderBoard wonderBoard = new wonderBoard();

				wonderBoard.setBoardNo(rs.getInt("BOARD_NO"));
				wonderBoard.setBoardTitle("BOARD_TITLE");
				wonderBoard.setBoardContent("BOARD_CONTENT");
				wonderBoard.setCreateDate(rs.getString("CREATED_DT"));
				wonderBoard.setReadCount(rs.getInt("READ_COUNT"));
				wonderBoard.setMemberNickname("MEMBER_NM");
				wonderBoard.setQaStatus(rs.getString("QA_STATUS"));
				wonderBoard.setWonderType("WONDER_TYPE");

				wonderFreeList.add(wonderBoard);
			}

		}finally {
			close(rs);
			close(stmt);
			
		}
		
		
			
		
		return wonderFreeList;
	}


	

}
