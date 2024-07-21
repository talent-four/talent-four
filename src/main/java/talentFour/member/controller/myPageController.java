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


@WebServlet("/mypage/*")
public class myPageController extends HttpServlet{
	
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemberService service = new MemberService();
		
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = uri.substring(  (contextPath + "/mypage").length()  );
		
		HttpSession session = req.getSession();
		
		Member loginMember =  (Member) session.getAttribute("loginMember");
		
		try {
		
			if(command.isEmpty()) {
				req.getRequestDispatcher("/WEB-INF/views/mypage/mypage.jsp").forward(req, resp);			
			}
		
			if(command.equals("/checkId")) {
			
				System.out.println(req.getParameter("id"));
				String id = req.getParameter("id");
				
				// 아이디 체크
				int result = service.checkId(id);
				
				if(result==0) {
					// 아이디 수정
					String memberNickname = loginMember.getMemberNickname();
					int upResult = service.updateId(id ,memberNickname);
					
					if(upResult == 1) {
						// 아이디 변경 성공시 2를 반환
						upResult=2;
						loginMember.setMemberNickname(id);
						session.setAttribute("loginMember", loginMember);
						resp.getWriter().print(upResult);	
					} else {
						// 아이디 변경 실패시 3을 반환
						upResult=3;
						resp.getWriter().print(upResult);
					}
					
				} else {
					// 아이디 중복시 1을 반환
					resp.getWriter().print(result);					
				}

			}
			
			
			if(command.equals("/changePw")) {

				String newPw1 = req.getParameter("newPw1");
				String newPw2 = req.getParameter("newPw2");
				String currentPw = req.getParameter("currentPw");
				
				//현재 비밀번호 검사
				int result = service.checkPw(currentPw, loginMember);
				
			}
		
			
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	
		doGet(req,resp); 
	}
}
