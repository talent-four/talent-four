package talentFour.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;

import talentFour.classes.model.vo.Class;
import talentFour.common.MyRenamePolicy;
import talentFour.common.Util;
import talentFour.member.model.service.MemberService;
import talentFour.member.model.vo.Member;
import talentFour.member.model.vo.Paid;
import talentFour.member.model.vo.Review;


@WebServlet("/mypage/*")
public class myPageController extends HttpServlet{
	
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemberService service = new MemberService();
		
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = uri.substring(  (contextPath + "/mypage").length()  );
		
		HttpSession session = req.getSession();
		
			
		Member loginMember =  (Member) session.getAttribute("loginMember");
		
		try {
		
			if(command.isEmpty()) {
				req.getRequestDispatcher("/WEB-INF/views/mypage/mypage.jsp").forward(req, resp);			
			}
		
			if(command.equals("/checkId")) {
			
//				System.out.println(req.getParameter("id"));
				String id = req.getParameter("id");
				
				// 아이디 체크
				int result = service.checkId(id);
				
				if(result==0) {
					// 아이디 수정
					String memberNickname = loginMember.getMemberNickname();
					int upResult = service.updateId(id ,memberNickname);
					
					if(upResult == 1) {
						// 아이디 변경 성공시 2를 반환
						upResult=2;
						loginMember.setMemberNickname(id);
						session.setAttribute("loginMember", loginMember);
						resp.getWriter().print(upResult);	
					} else {
						// 아이디 변경 실패시 3을 반환
						upResult=3;
						resp.getWriter().print(upResult);
					}
					
				} else {
					// 아이디 중복시 1을 반환
					resp.getWriter().print(result);					
				}

			}
			
			if(command.equals("/changePw")) {

//				String newPw = Util.encodingPw(req.getParameter("newPw1"));
//				String currentPw = Util.encodingPw(req.getParameter("currentPw"));
				String currentPw = req.getParameter("currentPw");
				String newPw = req.getParameter("newPw1");
				//현재 비밀번호 검사
				int result = service.checkCurrentpw(currentPw, loginMember.getMemberNo());
				
				// result가 1이라면, 바꾸는 기능을 수행한다.
				
				if(result==1) {
					// 비밀번호 변경
					int changeRes = service.changePw(newPw,loginMember.getMemberNo());
					
					if(changeRes==1) {
						// 비밀번호 변경 성공
						session.setAttribute("message", "비밀번호 변경에 성공하였습니다.");
						req.getRequestDispatcher("/WEB-INF/views/mypage/mypage.jsp").forward(req, resp);
					} else {
						// 비밀번호 변경 실패
						session.setAttribute("message", "비밀번호 변경에 실패하였습니다. 다음에 다시 시도해주세요.");
						req.getRequestDispatcher("/WEB-INF/views/mypage/mypage.jsp").forward(req, resp);
					}
					
				} else {
					// 현재 비밀번호가 일치하지 않는 경우
					session.setAttribute("message", "현재 비밀번호가 일치하지 않습니다.");
					req.getRequestDispatcher("/WEB-INF/views/mypage/mypage.jsp").forward(req, resp);
				}
			}

			if(command.equals("/secession")) {
				String currentPw=req.getParameter("currentPw");
//				String currentPw = Util.encodingPw(req.getParameter("currentPw"));
				//현재 비밀번호 검사
				int result = service.checkCurrentpw(currentPw, loginMember.getMemberNo());
				if(result==1) {
					// 회원 탈퇴 진행
					int secRes = service.secession(loginMember.getMemberNo());
					
					if(secRes==1) {
						// 회원 탈퇴 성공
						session.invalidate();
						
						session = req.getSession();
						session.setAttribute("message", "회원 탈퇴 성공하였습니다.");

						resp.sendRedirect(req.getContextPath());
						
					} else {
						session.setAttribute("message", "회원 탈퇴에 실패하였습니다. 다시 시도해주세요.");
						req.getRequestDispatcher("/WEB-INF/views/mypage/mypage.jsp").forward(req, resp);
					}
					
					
				} else {
					// 현재 비밀번호가 일치하지 않는 경우
					session.setAttribute("message", "현재 비밀번호가 일치하지 않습니다.");
					req.getRequestDispatcher("/WEB-INF/views/mypage/mypage.jsp").forward(req, resp);
				}
				
			}
			
			if(command.equals("/selectReview")) {
				
				List<Review> reviewList= new ArrayList<Review>();
				
				reviewList = service.selectReview(loginMember.getMemberNo());
				new Gson().toJson(reviewList , resp.getWriter());
				
			}
			
			
			if(command.equals("/payment")) {
				
				List<Paid> paidList = new ArrayList<Paid>();
				
				paidList = service.selectPaid(loginMember.getMemberNo());
				new Gson().toJson(paidList , resp.getWriter());
			}
			
			if(command.equals("/profileImage")) {

				// insert / update 공통 요청
				int maxSize = 1024 * 1024 * 100; // 업로드 최대 용량 (100MB)
				
				String root = session.getServletContext().getRealPath("/");
				String folderPath = "/resources/img/profileImage/";
				String filePath = root + folderPath;
				String encoding = "UTF-8";
				
				
				MultipartRequest mpReq = new MultipartRequest(req, filePath, maxSize, encoding, new MyRenamePolicy());
				
				Enumeration<String> files = mpReq.getFileNames();
				
				if(files.hasMoreElements()) {
					String name = files.nextElement();
					String rename = mpReq.getFilesystemName(name);
					
					System.out.println("name : " + name);
					System.out.println("rename : " + rename);
					
					if(rename != null) {
						
						loginMember.setMemberProfile(folderPath+rename);
						// 이제 해당 파일 경로를 loginMember와 같은 memberNo 에 업데이트 시키면 됨
						int result = service.profileImage(loginMember);
						
						if(result>0) {
							session.setAttribute("message", "프로필 사진이 변경 되었습니다.");
							req.getRequestDispatcher("/WEB-INF/views/mypage/mypage.jsp").forward(req, resp);
						} else {
							session.setAttribute("message", "프로필 사진이 변경을 실패했습니다.");
							req.getRequestDispatcher("/WEB-INF/views/mypage/mypage.jsp").forward(req, resp);							
						}
						
					}
				}
				

				
				
			
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp); 
	}
}
