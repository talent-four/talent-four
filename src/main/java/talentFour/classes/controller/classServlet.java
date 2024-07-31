package talentFour.classes.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import talentFour.classes.model.vo.Class;

import talentFour.classes.model.service.DetailPageService;


@WebServlet("/class/*")
public class classServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int classNo = Integer.parseInt(req.getParameter("classNo"));
		try {
			DetailPageService service = new DetailPageService();
			Class c = service.getClass(classNo);
			req.setAttribute("classInfo", c);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		req.getRequestDispatcher("/WEB-INF/views/class/class.jsp").forward(req, resp);
	
	}
	
}
