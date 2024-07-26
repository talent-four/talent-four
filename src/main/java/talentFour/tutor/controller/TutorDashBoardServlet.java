package talentFour.tutor.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import talentFour.member.model.vo.Member;
import talentFour.tutor.model.service.TutorService;
import talentFour.tutor.model.vo.Dashboard;
import talentFour.tutor.model.vo.TutorClass;
@WebServlet("/tutor/dashboard/*")
public class TutorDashBoardServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			String uri = req.getRequestURI();
			String contextPath = req.getContextPath();
			String command = uri.substring(  (contextPath + "/tutor/dashboard/").length()  );
			
			TutorService service = new TutorService();
			
			HttpSession session = req.getSession();
			Member loginMember = (Member)session.getAttribute("loginMember");
			int memberNo = loginMember.getMemberNo();
			
			int count = service.allCountPaid(memberNo);
			
			
			if(command.equals("views")) {
				
				List<Dashboard> paidgraph = service.selectPaidCount(memberNo);

				Dashboard paidcount = new Dashboard();
				System.out.println(paidgraph);
				new Gson().toJson(paidgraph,resp.getWriter());
			}
			
			
			
			req.setAttribute("countPaid", count);
			
			req.getRequestDispatcher("/WEB-INF/views/tutor/dashBoard.jsp").forward(req, resp);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
}
