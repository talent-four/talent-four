package talentFour.member.model.dao;

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

import talentFour.classes.model.vo.Message;
import talentFour.member.model.vo.Member;
import talentFour.member.model.vo.Paid;
import talentFour.member.model.vo.Review;

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


	public int checkCurrentpw(String currentPw, int memberNo, Connection conn) throws Exception {
		
		int result = 0;
		
		try {
			
			String sql= prop.getProperty("checkCurrentpw");
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, currentPw);
			pstmt.setInt(2, memberNo);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				result=rs.getInt(1);
			}
			
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}


	/** 비밀번호 변경
	 * @param newPw
	 * @param memberNo
	 * @param conn
	 * @return result
	 */
	public int changePw(String newPw, int memberNo, Connection conn) throws Exception {
		
		int result = 0;
		
		String sql = prop.getProperty("changePw");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1,newPw);
			pstmt.setInt(2, memberNo);
			
			result = pstmt.executeUpdate();
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	/** 회원 탈퇴
	 * @param conn
	 * @param memberNo
	 * @return result
	 */
	public int secession(Connection conn, int memberNo) throws Exception {
		
		int result =0;
		
		try {
			
			String sql = prop.getProperty("secession");
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, memberNo);
			
			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
		}
		
		return result;
	}


	/** 리뷰 검색
	 * @param conn
	 * @return reviewList
	 */
	public List<Review> selectReview(Connection conn ,int memberNo) throws Exception {
		
		List<Review> reviewList= new ArrayList<>();
		
		try {
			
			String sql = prop.getProperty("selectReview");
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, memberNo);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				Review review = new Review();
				review = Review.builder()
						.boardNo(rs.getInt(1))
						.boardTitle(rs.getString(2))
						.boardContent(rs.getString(3))
						.createdDate(rs.getString(4))
						.updateDate(rs.getString(5))
						.boardStatus(rs.getInt(6))
						.memberNickname(rs.getString(7))
						.reviewStar(rs.getDouble(8))
						.parents(rs.getInt(9))
						.tag(rs.getString(10))
						.report(rs.getInt(11))
						.thumbs(rs.getInt(12))
						.profileImage(rs.getString(13))
						.build();
				
				reviewList.add(review);
			}
			
			
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return reviewList;
	}

	/** 상세 페이지 리뷰 조회
	 * @param conn
	 * @param classNo
	 * @return reviewList
	 */
	public List<Review> getDetailPageReview(Connection conn, int classNo) throws Exception {
		
		List<Review> reviewList= new ArrayList<>();
		
		try {
			
			String sql = prop.getProperty("getDetailPageReview");
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, classNo);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				Review review = new Review();
				review = Review.builder()
						.boardNo(rs.getInt(1))
						.boardTitle(rs.getString(2))
						.boardContent(rs.getString(3))
						.createdDate(rs.getString(4))
						.updateDate(rs.getString(5))
						.boardStatus(rs.getInt(6))
						.memberNickname(rs.getString(7))
						.reviewStar(rs.getDouble(8))
						.parents(rs.getInt(9))
						.report(rs.getInt(10))
						.thumbs(rs.getInt(11))
						.profileImage(rs.getString(12))
						.build();
				
				reviewList.add(review);
			}
			
			
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return reviewList;
	}

	public List<Paid> selectPaid(Connection conn, int memberNo) throws SQLException {
		
		List<Paid> paidList = new ArrayList<>();
		
		try {
			
			String sql = prop.getProperty("selectPaid");
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				Paid paid = new Paid();
				
				paid=Paid.builder()
						.classPhoto(rs.getString(1))
						.className(rs.getString(2))
						.paymentDate(rs.getString(3))
						.classNo(rs.getInt(4))
						.build();
				paidList.add(paid);
			}
			
			
		} finally {
			close(pstmt);
		}
		
		return paidList;
	}


	/** 프로필 사진 이미지 경로 변경
	 * @param conn
	 * @param loginMember
	 * @return result
	 * @throws SQLException
	 */
	public int profileImage(Connection conn, Member loginMember) throws SQLException {
		
		int result = 0 ;
		
		try {
			
			String sql=prop.getProperty("profileImage");
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, loginMember.getMemberProfile());
			pstmt.setInt(2, loginMember.getMemberNo());
			
			result = pstmt.executeUpdate();
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	/** 채팅 서비스를 위한 아이디로 memberNo 반환
	 * @param conn
	 * @param toId
	 * @return memberNo
	 */
	public int searchMemberNo(Connection conn, String toId) {
		
		int memberNo=0;
		
		try {
			
			String sql=prop.getProperty("searchMemberNo");
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, toId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				memberNo=rs.getInt(1);
			}
			
		} catch(SQLException e) {
			System.out.println("조회된 아이디는 없는 아이디임");
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return memberNo;
	}


	/** 채팅 DB 삽입
	 * @param conn
	 * @param msg
	 * @return result
	 * @throws Exception
	 */
	public int insertChatting(Connection conn, Message msg) throws Exception {
		
		int result=0;
		
		try {
			
			String sql=prop.getProperty("insertChatting");
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, msg.getFromId());
			pstmt.setString(2, msg.getToId());
			pstmt.setString(3, msg.getMessage());
					
			
			result = pstmt.executeUpdate();

			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	/** 회원 가입
	 * @param conn
	 * @param member
	 * @return result
	 * @throws SQLException
	 */
	public int signUp(Connection conn, Member member) throws SQLException {
		
		int result=0;
		
		try {
			String sql=prop.getProperty("signUp");
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getMemberEmail());
			pstmt.setString(2, member.getMemberNickname());
			pstmt.setString(3, member.getMemberPw());
					
			
			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
		}
		
		return result;
	}

}
