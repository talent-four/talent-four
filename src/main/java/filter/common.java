package filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;

import talentFour.classes.model.service.ClassPageService;
import talentFour.classes.model.vo.Category;

@WebFilter(filterName = "common", urlPatterns = "/*")
public class common extends HttpFilter implements Filter {
       
	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("필터 on");
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		ServletContext application = request.getServletContext();
		String contextPath = ((HttpServletRequest)request).getContextPath();
		application.setAttribute("contextPath", contextPath);

        try {
            // 서블릿 초기화 시 카테고리 정보를 한 번만 가져옴
            ClassPageService service = new ClassPageService();
            List<Category> categoryList = service.getCategory();
            application.setAttribute("categoryList", categoryList);
        } catch (Exception e) {
            System.out.println("카테고리 불러오는 중 오류");
            e.printStackTrace();
        }
		
		
		chain.doFilter(request, response);
	}
	

	public void destroy() {
		System.out.println("필터 off");
	}
}
