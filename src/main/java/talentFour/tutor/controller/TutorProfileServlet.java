package talentFour.tutor.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import talentFour.member.model.vo.Member;
import talentFour.tutor.model.service.TutorService;
import talentFour.tutor.model.vo.tutorProfile;
@WebServlet("/tutor/profile")
public class TutorProfileServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		try {

			TutorService service = new TutorService();
			
			HttpSession session = req.getSession();
			Member loginMember = (Member)session.getAttribute("loginMember");
			int memberNo = loginMember.getMemberNo();
			
			tutorProfile tutorProfile = service.selectProfile(memberNo);
			
			req.setAttribute("loginMember", loginMember);
			req.setAttribute("tutorProfile", tutorProfile);
			
			req.getRequestDispatcher("/WEB-INF/views/tutor/profile.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int result = 0;
			TutorService service = new TutorService();
			HttpSession session = req.getSession();
			Member loginMember = (Member)session.getAttribute("loginMember");
			int memberNo = loginMember.getMemberNo();
			
			String tutorTel = req.getParameter("tel-input");
			String tutorName = req.getParameter("accountName");
			String bankName = req.getParameter("bankName");
			String account = req.getParameter("accountNumber");
			String tutorIntroduce = req.getParameter("introduce");
			
			tutorProfile updateProfile = new tutorProfile();
			
			updateProfile.setTutorTel(tutorTel);
			updateProfile.setTutorName(tutorName);
			updateProfile.setBankName(bankName);
			updateProfile.setAccount(account);
			updateProfile.setTutorIntroduce(tutorIntroduce);
			
			result = service.updateProfile(updateProfile, memberNo);
			
			if(result>0) { 
				session.setAttribute("message", "회원 정보가 수정되었습니다.");
				
			} else { 
				session.setAttribute("message", "회원 정보 수정 실패하였습니다.");
			}
			
			resp.sendRedirect( req.getContextPath() + "/tutor/profile" );
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	
}
