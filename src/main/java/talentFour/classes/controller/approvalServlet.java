package talentFour.classes.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/approval")
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
            return;
        } else {
        	try {
        		DetailPageService service = new DetailPageService();
        		System.out.println(req.getParameter("classNo"));
        		int boardNo = Integer.parseInt(req.getParameter("classNo"));
				Class c = service.getClass(boardNo);
				req.setAttribute("classInfo", c);

				path = "/WEB-INF/views/approval/approval.jsp";
				
			} catch (Exception e) {
				e.printStackTrace();
			}
        }
		
		req.getRequestDispatcher(path).forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getParameter("paid").equals("true")) {
			DetailPageService service = new DetailPageService();
			int classNo = Integer.parseInt(req.getParameter("classNo"));
			int memberNo = Integer.parseInt(req.getParameter("memberNo"));
			String payment = req.getParameter("creditSelect");
			
			try {
				int result = service.insertPaid(classNo, memberNo, payment);
				if(result > 0) System.out.println("PAID 추가 완료");
				else System.out.println("PAID 추가 실패");
				
				resp.sendRedirect(req.getContextPath() + "/detailedPage/class?classNo=" + classNo);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	}
	
}
