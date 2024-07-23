package talentFour.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import talentFour.member.model.service.MemberService;
import talentFour.member.model.vo.Member;

// 로그인시, 메인 페이지 로그인 여부 확인
@WebServlet("/member/*")
public class MemberServlet extends HttpServlet {

	
	// req 주면 command만 빼서 반환
	public String getCommand(HttpServletRequest req){
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = uri.substring(  (contextPath + "/member/").length()  );
		
		return command;
	}
	

	// 로그인 페이지 이동 get요청
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// uri로 /member/* 부분 구하기
		String command = getCommand(req);
		String path = "";
		
		System.out.println(command);
		if(command.equals("signUp")) { // 회원가입
			path = "/WEB-INF/views/member/signUp.jsp";
			req.getRequestDispatcher(path).forward(req, resp);
		}
		
		if(command.equals("login")) { // 로그인
			path = "/WEB-INF/views/member/sign.jsp";
			req.getRequestDispatcher(path).forward(req, resp);
		}
		
		if(command.equals("logout")) { // 로그아웃
			
			// 로그인 된 세션 무효화
			HttpSession session = req.getSession();
			session.invalidate();
			
			resp.sendRedirect(req.getContextPath());
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// req로 command 가져오기
		String command = getCommand(req);
		
		// doPost가 만약, 로그인일 경우
		if(command.equals("login")) {
			String id = req.getParameter("id");
			String pw = req.getParameter("pw");
			
			MemberService service = new MemberService();
			
			Member mem = Member.builder()
						.memberEmail(id)
						.memberPw(pw)
						.build();
			
			HttpSession session = req.getSession();
			
			String path = "";
			
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
			
		} else {
			// 그 외 doGet에서 처리
			doGet(req, resp);
		}
		
	}
}
