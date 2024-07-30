package talentFour.classes.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import talentFour.classes.model.service.ClassPageService;
import talentFour.classes.model.vo.Category;
import talentFour.classes.model.vo.Class;

@WebServlet("/classPage/*")
public class classPageServlet extends HttpServlet {
	
	private List<Category> categoryList;
	
	@Override
    public void init() throws ServletException {
        try {
            // 서블릿 초기화 시 카테고리 정보를 한 번만 가져옴
            ClassPageService service = new ClassPageService();
            categoryList = service.getCategory();
        } catch (Exception e) {
            throw new ServletException("Error initializing servlet", e);
        }
    }
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = uri.substring(  (contextPath + "/classPage/").length()  );
		ServletContext application = req.getServletContext();
		List<Category> categoryList = (List<Category>) application.getAttribute("categoryList");
		
		try {
			req.setAttribute("categoryList", categoryList);
			 String orderTag = req.getParameter("sort");
			 
			// 맨 처음, all로 요청시,
			if(command.equals("all")) {
				
				 ClassPageService service = new ClassPageService();
                 try {
                	 List<Class> classList;
                	// 검색일 경우
                	if(req.getParameter("query") != null) {
                		String query = req.getParameter("query");
                		classList = service.getQueryClasses(orderTag, query);
                	} else {
                		classList = service.getAllClasses(orderTag);
                	}
                	req.setAttribute("classList", classList);
                 	
                 } catch (Exception e) {
                 	e.printStackTrace();
 				}
			} else {
				 // command 값을 기준으로 대분류와 소분류 처리
	            String[] parts = command.split("/");
	            
	            // 대분류 선택 상태
	            if (parts.length > 0) {
	                String mainCategoryCode = parts[0]; // 대분류 코드
	                for (Category category : categoryList) {
	                    if (category.getCategoryCode().equals(mainCategoryCode)) {
	                    	
	                        ClassPageService service = new ClassPageService();
	                        try {
	                        	List<Class> classList = service.getMainClasses(mainCategoryCode, orderTag);
	                        	req.setAttribute("classList", classList);
	                        	req.setAttribute("mainCategory", category);

	                        } catch (Exception e) {
	                        	e.printStackTrace();
	        				}
	                    	
	                    }
	                }
	            }
	            
	            // 소분류 선택 상태
	            if (parts.length > 1) {
	                String subCategoryCode = parts[1]; // 소분류 코드
	                
	                ClassPageService service = new ClassPageService();
	                try {
	                	List<Class> classList = service.getClasses(subCategoryCode, orderTag);
	                	req.setAttribute("classList", classList);
	                } catch (Exception e) {
	                	e.printStackTrace();
					}
	            }
			}
            
        	req.getRequestDispatcher("/WEB-INF/views/pages/classPage.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
}
