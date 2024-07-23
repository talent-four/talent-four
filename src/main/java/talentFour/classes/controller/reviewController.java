package talentFour.classes.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import talentFour.classes.model.service.BoardService;
import talentFour.member.model.service.MemberService;
import talentFour.member.model.vo.Member;
import talentFour.member.model.vo.Review;


@WebServlet("/review/*")
public class reviewController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		BoardService service = new BoardService();
		
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = uri.substring(  (contextPath + "/review").length()  );
		
		HttpSession session = req.getSession();
		
		Member loginMember =  (Member) session.getAttribute("loginMember");
		
		try {
			if(command.isEmpty()) {
			
				req.getRequestDispatcher("/WEB-INF/views/review/review.jsp").forward(req, resp);			
			}
			if(command.equals("/view")) {
				List<Review> reviewList= new ArrayList<Review>();
				
				reviewList = service.selectReview();
				new Gson().toJson(reviewList , resp.getWriter());
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
