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
	        String command = uri.substring((contextPath + "/tutor/dashboard").length());

	        TutorService service = new TutorService();
	        HttpSession session = req.getSession();
	        Member loginMember = (Member) session.getAttribute("loginMember");
	        int memberNo = loginMember.getMemberNo();

	        if (command.equals("/paid")) {
	            List<Dashboard> paidgraph = service.selectPaidCount(memberNo);
	            resp.setContentType("application/json");
	            resp.setCharacterEncoding("UTF-8");
	            new Gson().toJson(paidgraph, resp.getWriter());
	            return;
	        }
	        
	        if (command.equals("/reviews")) {
	            List<Dashboard> reviewgraph = service.selectReviewCount(memberNo);
	            resp.setContentType("application/json");
	            resp.setCharacterEncoding("UTF-8");
	            new Gson().toJson(reviewgraph, resp.getWriter());
	            return;
	        }
	        
	        if (command.equals("/scatter")) {
	            List<Dashboard> scattergraph  = service.selectReviewPaidCount(memberNo);
	            resp.setContentType("application/json");
	            resp.setCharacterEncoding("UTF-8");
	            new Gson().toJson(scattergraph, resp.getWriter());
	            return;
	        }

	        int count = service.allCountPaid(memberNo);
	        
	        int count2 = service.allCountReview(memberNo);
	        int count3 =0;
	        if(count2>0&&count>0) {
	        	count3 = count2*100/count;
	        }
	        
	        req.setAttribute("countPaid", count);
	        req.setAttribute("countReview", count2);
	        req.setAttribute("percent", count3);
	        req.getRequestDispatcher("/WEB-INF/views/tutor/dashBoard.jsp").forward(req, resp);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	
	
}
