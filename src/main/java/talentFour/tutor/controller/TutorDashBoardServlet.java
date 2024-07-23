package talentFour.tutor.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/tutor/dashboard")
public class TutorDashBoardServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			
			
			req.getRequestDispatcher("/WEB-INF/views/tutor/dashBoard.jsp").forward(req, resp);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
	
		
		
		
	}
	
	
	
	
	
	
	
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
//		String inputImage = req.getParameter("inputImage");
//		String inputTel = req.getParameter("inputTel");
//		String inputIntroduce = req.getParameter("inputIntroduce");
//		String accountName = req.getParameter("accountName");
//		String bankName = req.getParameter("bankName");
//		String accountNumber = req.getParameter("accountNumber");
//		String[] university = req.getParameterValues("university");
//		String license = req.getParameter("license");
//		
//		
//	
//	}
}
