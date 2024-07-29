package talentFour.tutor.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import talentFour.member.model.vo.Member;
import talentFour.tutor.model.service.TutorService;
import talentFour.tutor.model.vo.TutorRegister;
@WebServlet("/tutor/register")
public class TutorRegisterServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/tutor/register.jsp").forward(req, resp);

	}

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {

			TutorService service = new TutorService();
			HttpSession session = req.getSession();
			Member loginMember = (Member)session.getAttribute("loginMember");
			int memberNo = loginMember.getMemberNo();
			
			String educationList = null;
			String tutorProfile = req.getParameter("inputImage");
			String tutorTel = req.getParameter("inputTel");
			String tutorIntroduce = req.getParameter("inputIntroduce");
			String accountName = req.getParameter("accountName");
			String bankName = req.getParameter("bankName");
			String account = req.getParameter("account");
			String education[] = req.getParameterValues("university");
			if(!education[0].equals("")) {
				educationList =  String.join(",,", education);
			}
			
			TutorRegister register = new TutorRegister();
			
			register.setTutorProfile(tutorProfile);
			register.setTutorTel(tutorTel);
			register.setTutorIntroduce(tutorIntroduce);
			register.setAccountName(accountName);
			register.setBankName(bankName);
			register.setAccount(account);
			register.setEducation(educationList);
			
			System.out.println(register);
			
			int result1 = service.registerTutor(memberNo);
			int result2 = service.registerTutorInfo(memberNo,register);
			int result3 = service.registerAccount(memberNo,register);
			
			
			
			// 튜터 등록 이후 메인페이지로 이동 -> 바로 튜터 페이지 이용하기 위해
			// 또는 튜터 페이지로 바로 이동
			
			if(result1>0) {
				System.out.println("등록됨");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
