package talentFour.tutor.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import talentFour.tutor.model.service.TutorService;
import talentFour.tutor.model.vo.TutorCalculate;
@WebServlet("/tutor/calculate")
public class TutorcalculateServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {

			TutorService service = new TutorService();
			
			List<TutorCalculate> tutorcalculateList = new ArrayList<>();
			int status = Integer.parseInt(req.getParameter("cp"));
			tutorcalculateList = service.selectCalculateList(status);
			
			req.setAttribute("tutorcalculateList", tutorcalculateList);
			
			req.getRequestDispatcher("/WEB-INF/views/tutor/calculate.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
	
}
