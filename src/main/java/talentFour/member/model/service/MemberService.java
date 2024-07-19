package talentFour.member.model.service;

import talentFour.member.model.dao.MemberDAO;
import talentFour.member.model.vo.Member;

import static talentFour.common.JDBCTemplate.*;

import java.sql.Connection;


public class MemberService {

	private MemberDAO dao = new MemberDAO();

	public Member login(Member mem) throws Exception{
		
		Connection conn = getConnection();
		
		Member loginMember = dao.login(conn,mem);
		
		close(conn);
		
		return loginMember;
	}
	
}
