package talentFour.wonder.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static talentFour.common.JDBCTemplate.*;
import talentFour.wonder.service.WonderService;
import talentFour.wonder.vo.wonderBoard;

@WebServlet("/wonder/*")
public class wonderServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = uri.substring(  (contextPath + "/wonder/").length()  );
		
		WonderService service = new WonderService();

		try {
			if(command.equals("free")) {
				List<wonderBoard> freeList = service.selectlistFree();
                req.setAttribute("freeList", freeList);
                req.getRequestDispatcher("/WEB-INF/views/wonder/wonderFree.jsp").forward(req, resp);

				System.out.println(freeList);
			}
			if(command.equals("class")) {
				
				req.getRequestDispatcher("/WEB-INF/views/wonder/wonderClass.jsp").forward(req, resp);}
			
			
		
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req,resp); 
		
	}

	

}
