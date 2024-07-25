package talentFour.classes.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/approval/*")
public class approvalServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String path = "";
		HttpSession session = req.getSession();
		
		
		System.out.println("loginMember : " + session.getAttribute("loginMember"));
		System.out.println("req.getContextPath() : " + req.getContextPath());
		
		if(session.getAttribute("loginMember") == null) {
            // 로그인 안하면, 로그인 화면으로
            // 현재 요청 URL을 세션에 저장
            resp.sendRedirect(req.getContextPath() + "/member/login");
        } else {
            path = "/WEB-INF/views/approval/approval.jsp";
        }
		
		req.getRequestDispatcher(path).forward(req, resp);
	}
	
}
