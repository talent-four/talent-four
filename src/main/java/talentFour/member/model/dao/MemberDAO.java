package talentFour.member.model.dao;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;
import static talentFour.common.JDBCTemplate.*;
import talentFour.member.model.vo.Member;

public class MemberDAO {

	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Properties prop;
	
	public MemberDAO() {
		try {
			
			prop=new Properties();
			String filePath = MemberDAO.class.getResource("/talentFour/sql/member-sql.xml").getPath();
			
			prop.loadFromXML(new FileInputStream(filePath));
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public Member login(Connection conn, Member mem) throws Exception {
		
		Member loginMember = null;
		
		try {
			
			String sql = prop.getProperty("login");
			//테스트용
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, mem.getMemberEmail());
			pstmt.setString(2, mem.getMemberPw());
			rs= pstmt.executeQuery();
			if(rs.next()) {
				
				loginMember=Member.builder()
						.memberNo(rs.getInt(1))
						.memberEmail(rs.getString(2))
						.memberNickname(rs.getString(3))
						.memberPw(rs.getString(4))
						.memberStatus(rs.getInt(5))
						.memberProfile(rs.getString(6))
						.build();
				System.out.println(loginMember);
			}
			
		} finally {
			close(pstmt);
		}
		
		return loginMember;
	}


	/** 아이디 체크
	 * @param conn
	 * @param id
	 * @return result
	 * @throws Exception
	 */
	public int checkId(Connection conn, String id) throws Exception {
		int result = 0;
		try {
			
			String sql = prop.getProperty("checkId");
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int updateId(Connection conn, String id, String memberNickname) throws Exception {
		int result = 0;
		
		try {
			
			String sql = prop.getProperty("updateId");
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, memberNickname);
			
			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

}
