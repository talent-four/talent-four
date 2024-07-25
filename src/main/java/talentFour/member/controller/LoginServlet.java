package talentFour.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import talentFour.common.Util;
import talentFour.member.model.service.MemberService;
import talentFour.member.model.vo.Member;

// 로그인시, 메인 페이지 로그인 여부 확인
@WebServlet("/login")
public class LoginServlet extends HttpServlet {


	// 로그인 페이지 이동 get요청
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "/WEB-INF/views/sign/sign.jsp";
		req.getRequestDispatcher(path).forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		
		// encoding된 pw파라미터를 가져온다.
		String encondingPw = Util.encodingPw(req.getParameter("pw"));
		String path = "";
		
		
		MemberService service = new MemberService();
		
		Member mem = Member.builder()
					.memberEmail(id)
					.memberPw(encondingPw)
					.build();
		
		HttpSession session = req.getSession();
		
		try {
			Member loginMember = service.login(mem);
			if(loginMember == null) {
				System.out.println("로긴멤버가 널값임");
				session.setAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
				path = "login";
			} else {
				System.out.println("나는 sql이 가져온 멤버야"+loginMember);
				session.setAttribute("message", "로그인이 성공하였습니다.");
				session.setAttribute("loginMember", loginMember);
				path = req.getContextPath();
				session.setMaxInactiveInterval(3600); 
			}
			resp.sendRedirect(path);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		


	}
}
