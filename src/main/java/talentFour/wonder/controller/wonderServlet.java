package talentFour.wonder.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

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
		

		try {
			if(command.equals("free")) {
				
				int type =Integer.parseInt(req.getParameter("type"));
				
				int cp = 1;
				
				if(req.getParameter("cp")!=null) {
					cp = Integer.parseInt(req.getParameter("cp"));
				}
				
				WonderService service = new WonderService();

				Map<String, Object> map = null;
				
				if(req.getParameter("key")==null) {
					map = service.selectlistFree(type,cp);
				}else {
					//검색 목록 조회
					String key = req.getParameter("key");
					String query = req.getParameter("query");
					
					map = service.searchFreeBoardList(type,cp,key,query);
				}
				
				
//				List<wonderBoard> freeList = service.selectlistFree();
//                req.setAttribute("freeList", freeList);
				
				req.setAttribute("map", map);
                req.getRequestDispatcher("/WEB-INF/views/wonder/wonderFree.jsp").forward(req, resp);

				System.out.println(map);
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
