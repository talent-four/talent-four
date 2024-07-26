package talentFour.tutor.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import talentFour.member.model.vo.Member;
import talentFour.tutor.model.service.TutorService;
import talentFour.tutor.model.vo.TutorClass;

@WebServlet("/tutor/classes")
public class TutorClassesServlet extends HttpServlet {
	
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			TutorService service = new TutorService();
			
			HttpSession session = req.getSession();
			Member loginMember = (Member)session.getAttribute("loginMember");
			int memberNo = loginMember.getMemberNo();
			
			List<TutorClass> tutorclasses = new ArrayList<>();
			int status = 1;
			tutorclasses = service.selectClassesList(status, memberNo);
			
			List<TutorClass> tutorclassesfin = new ArrayList<>();
			int statusfin = 2;
			tutorclassesfin = service.selectClassesFinList(statusfin, memberNo);
			
			TutorClass counting = new TutorClass();
			counting = service.classingCount(status, memberNo);
			
			TutorClass countfin = new TutorClass();
			countfin = service.classfinCount(statusfin, memberNo);
			
			req.setAttribute("counting", counting);
			req.setAttribute("countfin", countfin);
			req.setAttribute("tutorclasses", tutorclasses);
			req.setAttribute("tutorclassesfin", tutorclassesfin);
			
			req.getRequestDispatcher("/WEB-INF/views/tutor/classes.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}