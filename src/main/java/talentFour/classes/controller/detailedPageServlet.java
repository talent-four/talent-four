package talentFour.classes.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import talentFour.classes.model.service.DetailPageService;
import talentFour.classes.model.vo.Class;

@WebServlet("/detailedPage/*")
public class detailedPageServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int classNo =  Integer.parseInt(req.getParameter("classNo"));
		
		DetailPageService service = new DetailPageService();
		try {
			Class c = service.getClass(classNo);
			
			if(c != null) {
				req.setAttribute("classInfo", c);
				String url = req.getRequestURI() + "?" + req.getQueryString();
				req.setAttribute("currUrl", url);
			} else {
				req.setAttribute("message", "잘못된 요청");
			}
			
			req.getRequestDispatcher("detailedPage");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		req.getRequestDispatcher("/WEB-INF/views/pages/detailedPage.jsp").forward(req, resp);
	}
	
}
