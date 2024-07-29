package talentFour.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import talentFour.member.model.service.MemberService;
import talentFour.member.model.vo.Member;

// 회원 가입 페이지
@WebServlet("/signUp")
public class SignUpServlet extends HttpServlet {

	// 회원 가입 페이지로 이동
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "/WEB-INF/views/sign/signUp.jsp";
		req.getRequestDispatcher(path).forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//INSERT INTO MEMBER VALUES (SEQ_MEMBER_NO.NEXTVAL , 'PIG@NAVER.COM', '귤동이3', '비밀번호', SYSDATE, DEFAULT, DEFAULT , NULL)
		
		String memberEmail = req.getParameter("email");
		System.out.println(memberEmail);
		String memberNickname = req.getParameter("inputid");
		System.out.println(memberNickname);
		String memberPw = req.getParameter("password");
		System.out.println(memberPw);
		
		Member member= Member.builder()
					   .memberEmail(memberEmail)
					   .memberNickname(memberNickname)
					   .memberPw(memberPw)
					   .build();
		HttpSession session = req.getSession();
		MemberService service = new MemberService();
		String path = "";
		
		try {
			
			int result = service.signUp(member);
			
			if(result>0) {
				
				Member mem = Member.builder()
						.memberEmail(member.getMemberEmail())
						.memberPw(member.getMemberPw())
						.build();
				
				Member loginMember = service.login(mem);

				session.setAttribute("message", "회원 가입에 성공하였습니다.");
				session.setAttribute("loginMember", loginMember);
				path = req.getContextPath();
				session.setMaxInactiveInterval(3600); 
				

				
			} else {
				session.setAttribute("message", "회원 가입에 실패했습니다.");
				path = "signUp";
			}
			resp.sendRedirect(path);

			
			
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
