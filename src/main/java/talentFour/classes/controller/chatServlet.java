package talentFour.classes.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import talentFour.classes.model.service.BoardService;
import talentFour.classes.model.vo.Chatting;
import talentFour.member.model.service.MemberService;
import talentFour.member.model.vo.Member;


@WebServlet("/chat")
public class chatServlet extends HttpServlet {

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		BoardService service = new BoardService();
		
		Member loginMember =  (Member) session.getAttribute("loginMember");
		
		String toId = req.getParameter("toId");
		
		
		try {
		
			List<Chatting> chattingList = service.chatting(loginMember.getMemberNo(), toId);
			
			new Gson().toJson(chattingList , resp.getWriter());
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String toId = req.getParameter("toId");
		try {
	           MemberService service = new MemberService();
	           int memberNo=service.searchMemberNo(toId);
	           
	           new Gson().toJson(memberNo , resp.getWriter());
	           
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
}
