package talentFour.classes.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;

import talentFour.classes.model.service.DetailPageService;
import talentFour.classes.model.vo.Category;
import talentFour.classes.model.vo.Class;
import talentFour.common.MyRenamePolicy;
import talentFour.member.model.service.MemberService;
import talentFour.member.model.vo.Member;
import talentFour.member.model.vo.Review;

@WebServlet("/detailedPage/*")
public class detailedPageServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// GET 방식 요청 처리
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = uri.substring(  (contextPath + "/detailedPage/").length()  );
		String path = null;
		
		ServletContext application = req.getServletContext();
		List<Category> categoryList = (List<Category>) application.getAttribute("categoryList");
		HttpSession session = req.getSession();
		
		System.out.println("디테일 페이지 : " + categoryList);
		try {
			// classNo 페이지 조회
			if(req.getParameter("classNo") != null) {
				DetailPageService service = new DetailPageService();
				MemberService mService = new MemberService();

		        
				int classNo =  Integer.parseInt(req.getParameter("classNo"));
				
				Map<String, Object>	classInfo = service.getClass(classNo);
				List<Review> reviewList = mService.getDetailPageReview(classNo);
			
				if(classInfo != null) {
					req.setAttribute("classDetail", classInfo);
					req.setAttribute("reviewList", reviewList);
					path = "/WEB-INF/views/pages/detailedPage.jsp";
				}
			} else { // 상세 페이지 조회가 아닌, 작업
				
				if(command.equals("write")) { // 게시글 작성
					path = "/WEB-INF/views/pages/detailedPageForm.jsp";
					req.setAttribute("categoryList", categoryList);
				}
				
				if(command.equals("update")) { // 게시글 수정
					path = "/WEB-INF/views/pages/detailedPageForm.jsp";
				}
				
				if(command.equals("getSubCategory")) { // 서브 카테고리 AJAX 요청 처리
					String main = req.getParameter("mainCategoryCode");
					DetailPageService service = new DetailPageService();
					List<Category> getSubCategory = service.getSubCategory(main, categoryList);
					if(getSubCategory == null) {
						session.setAttribute("message", "잘못된 요청");
						return;
					}
					
					new Gson().toJson(getSubCategory, resp.getWriter());
		            return;
				}
				req.getRequestDispatcher(path).forward(req, resp);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// insert / update 공통 요청
		int maxSize = 1024 * 1024 * 100; // 업로드 최대 용량 (100MB)
		HttpSession session = req.getSession();
		
		String root = session.getServletContext().getRealPath("/");
		String folderPath = "/resources/img/classes/thumbnail/";
		String filePath = root + folderPath;
		String encoding = "UTF-8";
		
		Class c = new Class();
		
		MultipartRequest mpReq = new MultipartRequest(req, filePath, maxSize, encoding, new MyRenamePolicy());
		
		Enumeration<String> files = mpReq.getFileNames();
		
		if(files.hasMoreElements()) {
			String name = files.nextElement();
			String rename = mpReq.getFilesystemName(name);
			c.setClassPhoto(rename);
			
			System.out.println("name : " + name);
			System.out.println("rename : " + rename);
		}
		
		String main = mpReq.getParameter("mainCategory");	
		String sub = mpReq.getParameter("subCategory");	
		String className = mpReq.getParameter("classTitle");	
		String classIntro = mpReq.getParameter("boardContent");
		int classPrice = Integer.parseInt(mpReq.getParameter("classPrice"));
		if(mpReq.getParameter("classUrl") != null) {
			String classUrl = mpReq.getParameter("classUrl");
			c.setClassUrl(classUrl);
		}
		
		c.setMain(main);
		c.setSub(sub);
		c.setClassName(className);
		c.setClassIntro(classIntro);
		c.setClassPrice(classPrice);
		
		Member loginMember = (Member) session.getAttribute("loginMember");
		
		String mode = mpReq.getParameter("mode"); // hidden
		
		System.out.println(mode);
		
		if(mode.equals("insert")) {
			DetailPageService service = new DetailPageService();
//			int classNo = service.insertClass(c, loginMember);
		}
	}
	
}
