package talentFour.classes.controller;

import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import talentFour.classes.model.vo.Class;
import talentFour.member.model.vo.Review;
import talentFour.classes.model.service.BoardService;
import talentFour.classes.model.service.ClassPageService;

@WebServlet("")
public class mainPageServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			// 클래스 목록1
			ClassPageService classService = new ClassPageService();
			List<Class> classList1 = new ArrayList(classService.getAllClasses("review").subList(0, 15));
			req.setAttribute("classList1", classList1);
			
			// 클래스 목록2
			List<Class> classList2 = new ArrayList(classService.getAllClasses("date").subList(0, 15));
			req.setAttribute("classList2", classList2);
			
			// 수강후기 목록
			BoardService reviewService = new BoardService();
			List<Review> reviewList = new ArrayList(reviewService.selectReview().subList(0, 5));
			req.setAttribute("reviewList", reviewList);
			
			// 공부해요 목록
			
			
			// 궁금해요 목록
			
			req.getRequestDispatcher("/index.jsp").forward(req, resp);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
