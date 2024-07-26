package talentFour.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// 회원 가입 페이지
@WebServlet("/signUp")
public class SignUpServlet extends HttpServlet {

	// 회원 가입 페이지로 이동
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "/WEB-INF/views/sign/signUp.jsp";
		req.getRequestDispatcher(path).forward(req, resp);
	}
}
