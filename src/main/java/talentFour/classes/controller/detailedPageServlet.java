package talentFour.classes.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
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
		
		ServletContext application = req.getServletContext();
		List<Category> categoryList = (List<Category>) application.getAttribute("categoryList");
		HttpSession session = req.getSession();
		
		// GET 방식 요청 처리
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String path = null;
		String command = uri.substring(  (contextPath + "/detailedPage/").length()  );
		
		DetailPageService service = new DetailPageService();
		MemberService mService = new MemberService();
		Member loginMember = (Member) session.getAttribute("loginMember");
		
		System.out.println(command);
		
		try {
			// classNo 페이지 조회
			if(command.equals("class")) {
				int classNo =  Integer.parseInt(req.getParameter("classNo"));
				
				
				Class classInfo = service.getClass(classNo);
				String[] tutorInfo = service.getTutorInfoClass(classNo);
				System.out.println(tutorInfo[0]);
				System.out.println(tutorInfo[1]);
				System.out.println(tutorInfo[2]);
				
				List<Review> reviewList = mService.getDetailPageReview(classNo);
			
				req.setAttribute("classInfo", classInfo);
				req.setAttribute("tutorInfo", tutorInfo);
				req.setAttribute("reviewList", reviewList);
				
				path = "/WEB-INF/views/pages/detailedPage.jsp";
				
			} 

			if(command.equals("write")) { // 게시글 작성
				
				// 튜터 정보 얻어오기
				
				
				String[] tutorInfo = service.getTutorInfo(loginMember.getMemberNo());
				
				path = "/WEB-INF/views/pages/detailedPageForm.jsp";
				req.setAttribute("categoryList", categoryList);
				req.setAttribute("tutorInfo", tutorInfo);
				
				// update일 경우
				if(req.getParameter("mode").equals("update")) {
					int classNo =  Integer.parseInt(req.getParameter("classNo"));
					
					Class classInfo = service.getClass(classNo);
					
					req.setAttribute("classInfo", classInfo);
					req.setAttribute("tutorInfo", tutorInfo);
					req.setAttribute("categoryList", categoryList);
					
					path = "/WEB-INF/views/pages/detailedPageForm.jsp";
				}
			}
			
			// delete일 경우
			if(command.equals("delete")) {
				int classNo =  Integer.parseInt(req.getParameter("classNo"));
				
				int result = service.deleteClass(classNo);
				
				if(result > 0) {
					session.setAttribute("message", "삭제 완료");
				} else {
					session.setAttribute("message", "삭제 실패");
				}
				
				resp.sendRedirect(req.getHeader("referer"));
				return;
			}
			
			if(command.equals("getSubCategory")) { // 서브 카테고리 AJAX 요청 처리
				String main = req.getParameter("mainCategoryCode");
				List<Category> getSubCategory = service.getSubCategory(main, categoryList);
				
				if(getSubCategory == null) {
					session.setAttribute("message", "잘못된 요청");
					return;
				}
				new Gson().toJson(getSubCategory, resp.getWriter());
	            return; // AJAX 리턴
			}
		
			req.getRequestDispatcher(path).forward(req, resp);
			
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
			
			System.out.println("name : " + name);
			System.out.println("rename : " + rename);
			
			if(rename != null) {
				
				c.setClassPhoto(folderPath + rename);
			}
		}
		
		String main = mpReq.getParameter("mainCategory");	
		String sub = mpReq.getParameter("subCategory");	
		String className = mpReq.getParameter("classTitle");	
		String classIntro = mpReq.getParameter("classContent");
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
		
		String path = "";
		String mode = mpReq.getParameter("mode"); // hidden
		System.out.println("mode : " + mode);
		
		// detailPage/write?mode=insert 일 때,
		if(mode.equals("insert")) {
			DetailPageService service = new DetailPageService();
			
			try {
				int classNo = service.insertClass(c, loginMember);
				System.out.println("등록 실행됨");
				
				session.setAttribute("message", "클래스가 등록되었습니다.");
				path = "class?classNo=" + classNo;
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(mode.equals("update")) {
			System.out.println("update 요청 들어옴");
			DetailPageService service = new DetailPageService();
			
			try {
				int classNo = Integer.parseInt(req.getParameter("classNo"));
				c.setClassNo(classNo);
				int result = service.updateClass(c);
				
				req.setAttribute("message", "클래스가 등록되었습니다.");
				path = "detailedPage?classNo=" + classNo;
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		resp.sendRedirect(path);
	}
	
}
