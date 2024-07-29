package talentFour.member.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import talentFour.member.model.service.MemberService;


@WebServlet("/signUp/checkId")
public class checkIdServlet extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberService service = new MemberService();
		String id = req.getParameter("id");
		try {
			
			int result = service.checkId(id);
			resp.getWriter().print(result);	
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
}
