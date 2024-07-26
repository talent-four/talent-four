package talentFour.tutor.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import talentFour.member.model.vo.Member;
import talentFour.tutor.model.service.TutorService;
import talentFour.tutor.model.vo.TutorCalculate;
@WebServlet("/tutor/calculate")
public class TutorcalculateServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int status=1;
		
		try {
			TutorService service = new TutorService();
			
			HttpSession session = req.getSession();
			Member loginMember = (Member)session.getAttribute("loginMember");
			int memberNo = loginMember.getMemberNo();
			
			List<TutorCalculate> tutorcalculateList = new ArrayList<>();
			if(req.getParameter("cp")!= null) {
				status = Integer.parseInt(req.getParameter("cp"));
			}
			tutorcalculateList = service.selectCalculateList(status,memberNo);
			
			TutorCalculate tutorcalculate = new TutorCalculate();
			tutorcalculate = service.getaccount(memberNo);
			
			// ---------------------------------------------------------------------------------------------
			// 체크된 정산 신청서들 값 받아오기
			String[] selectedValues = req.getParameterValues("money");
			
		    if (selectedValues != null) {
		    	
		        for (String value : selectedValues) {
		            String[] parts = value.split(" ");
		            
		            if (parts.length == 2) {
		            	int intValue = Integer.parseInt(parts[0]);  // 회원번호
		                String stringValue = parts[1];  // "닉네임"
		                
		                TutorService service2 = new TutorService(); 
		                int result = service2.updateSettleStatus(intValue, stringValue);
		                
		                if(result>0) {
		                	session.setAttribute("message", "정산요청이 완료되었습니다.");
		                }
		            }
		        }
		    }
		    
		    
		    // ------------------------------------------------------------------------------------------
		    // 정산 금액 구하기
		    int ingsum = 0;
		    int finsum = 0;
		    int allsum = 0;
		    TutorCalculate calculatemoney = service.calculatemoney(memberNo);
		    
		    tutorcalculate.setIngsum(calculatemoney.getIngsum());
		    tutorcalculate.setFinsum(calculatemoney.getFinsum());
		    ingsum = calculatemoney.getIngsum();
		    finsum = calculatemoney.getFinsum();
		    allsum = calculatemoney.getIngsum()+calculatemoney.getFinsum();
		    tutorcalculate.setAllsum(allsum);
		    
		    
			req.setAttribute("tutorcalculateList", tutorcalculateList);
			req.setAttribute("tutorcalculate", tutorcalculate);
			
			req.getRequestDispatcher("/WEB-INF/views/tutor/calculate.jsp").forward(req, resp);
			new Gson().toJson(tutorcalculateList,resp.getWriter());
			new Gson().toJson(tutorcalculate,resp.getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
    }
	
}