package talentFour.member.model.service;

import talentFour.member.model.dao.MemberDAO;
import talentFour.member.model.vo.Member;

import static talentFour.common.JDBCTemplate.*;

import java.sql.Connection;


public class MemberService {

	private MemberDAO dao = new MemberDAO();

	
	
	/**로그인 서비스
	 * @param mem
	 * @return loginMember
	 * @throws Exception
	 */
	public Member login(Member mem) throws Exception{
		
		Connection conn = getConnection();
		
		Member loginMember = dao.login(conn,mem);
		
		close(conn);
		
		return loginMember;
	}

	/** 아이디 찾기
	 * @param id
	 * @return result
	 * @throws Exception
	 */
	public int checkId(String id) throws Exception {
		
		Connection conn = getConnection();
		
		int result = dao.checkId(conn, id);
		
		close(conn);
		
		return result;
	}

	
	/** 아이디 수정
	 * @param id
	 * @throws Exception
	 */
	public int updateId(String id, String memberNickname) throws Exception{
		
		Connection conn = getConnection();
		
		int result = dao.updateId(conn,id, memberNickname);
		
		if(result==1) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
}
