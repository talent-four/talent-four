package talentFour.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// 로그인시, 메인 페이지 로그인 여부 확인
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	// *DB 연동 안됬으니 임시 아이디, 비밀번호
	private String tempId = "test";
	private String tempPw = "pass";
	
	// 로그인 페이지 이동 get요청
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "/WEB-INF/views/sign/sign.jsp";
		req.getRequestDispatcher(path).forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String path = "";
		
		HttpSession session = req.getSession();
		
		// *임시 로그인 과정, service, dao로 분리 필요
		if(tempId.equals(id) && tempPw.equals(pw)) {
			// *아이디, 비밀번호 같을 시 로그인
			session.setAttribute("loginMember", id);
			path = req.getContextPath();
		} else {
			session.setAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
			path = "login";
		}
		resp.sendRedirect(path);
	}
}
