package talentFour.group.dao;

import static talentFour.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import talentFour.group.model.vo.GroupMain;

public class GroupDAO {
	
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Properties prop;
	
	public GroupDAO() {
		try {
			prop = new Properties();
			
			String filePath = GroupDAO.class.getResource("/talentFour/sql/group-sql.xml").getPath();
			prop.loadFromXML(new FileInputStream(filePath));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<GroupMain> selectBoardList(Connection conn) throws Exception {

		List<GroupMain> GroupBoardList = new ArrayList<>();
		
		
		try {
			
			
			String sql = prop.getProperty("selectBoardList");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			
			while(rs.next()) {
				
				GroupMain GroupMain = new GroupMain();
				
				GroupMain.setStudyStatus(rs.getString(1));
				GroupMain.setTagName(rs.getString(2));
				GroupMain.setStartDate(rs.getDate(3));
				GroupMain.setBoardContent(rs.getString(4));
				GroupMain.setMemberNickname(rs.getString(5));
				GroupMain.setStudyNumber(rs.getInt(6));
				GroupMain.setReadCount(rs.getInt(7));
				GroupMain.setTagImage(rs.getString(8));
				
				GroupBoardList.add(GroupMain);
				
			}
			
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return GroupBoardList;
	}

}
