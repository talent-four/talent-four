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
			// 클래스 목록 
			ClassPageService classService = new ClassPageService();
			List<Class> classList = new ArrayList(classService.getAllClasses().subList(0, 30));
			req.setAttribute("classList", classList);
			
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
