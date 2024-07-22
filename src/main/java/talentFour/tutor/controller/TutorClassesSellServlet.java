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
import talentFour.tutor.model.vo.TutorClassSell;
@WebServlet("/tutor/classessell")
public class TutorClassesSellServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
//			TutorService service = new TutorService();
//			
//			List<TutorClassSell> tutorclassSell = new ArrayList<>();
//			
//			tutorclassSell = service.selectClassSellList();
//			
//			req.setAttribute("tutorclassSell", tutorclassSell);
			
			req.getRequestDispatcher("/WEB-INF/views/tutor/classesSell.jsp").forward(req, resp);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
}
