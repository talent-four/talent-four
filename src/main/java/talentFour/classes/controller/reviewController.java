package talentFour.classes.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import talentFour.classes.model.service.BoardService;
import talentFour.classes.model.vo.Class;
import talentFour.member.model.service.MemberService;
import talentFour.member.model.vo.Member;
import talentFour.member.model.vo.Review;


@WebServlet("/review/*")
public class reviewController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		BoardService service = new BoardService();
		
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = uri.substring(  (contextPath + "/review").length()  );
		
		HttpSession session = req.getSession();
		
		Member loginMember =  (Member) session.getAttribute("loginMember");

		
		try {
			
			
			if(command.isEmpty()) {
			
				req.getRequestDispatcher("/WEB-INF/views/review/review.jsp").forward(req, resp);			
			}

			
			if(command.equals("/view")) {
				List<Review> reviewList= new ArrayList<Review>();
				
				reviewList = service.selectReview();
				new Gson().toJson(reviewList , resp.getWriter());
			}
			
			
			if(command.equals("/viewThumbs")) {
				List<Review> reviewList= new ArrayList<Review>();
				
				reviewList = service.selectReviewThumbs();
				new Gson().toJson(reviewList , resp.getWriter());
			}
			
			
			
			if(command.equals("/writeForm")) {
				
				int memberNo = Integer.parseInt(req.getParameter("memberNo"));
				
				List<Class> lectureList = service.myLecture(memberNo);
				new Gson().toJson(lectureList , resp.getWriter());
			}
			
			
			
			if(command.equals("/write")) {
				
				int memberNo=Integer.parseInt(req.getParameter("writeMember"));
				String tag=req.getParameter("tag");
				int rawTag = Integer.parseInt(tag);
				
				switch(rawTag){
					case 1:
						tag="친절해요";
					break;
					case 2:
						tag="재밌어요";
					break;
					case 3:
						tag="시간가는줄 몰라요";
					break;
					case 4:
						tag="가격대비최고";
					break;
					case 5:
						tag="강의 맛집";
					break;
					case 6:
						tag="다음에 또 올께요";
					break;
					case 7:
						tag="완강했어요";
					break;
					case 8:
						tag="후회 안해요";
					break;
					case 9:
						tag="고민은 시간낭비";
					break;
				}
				
				double writeStar=Double.parseDouble(req.getParameter("writeStar"));
				String writeTitle=req.getParameter("writeTitle");
				String writetext=req.getParameter("writetext");
				int parents = Integer.parseInt(req.getParameter("parents"));
				Review review = Review.builder()
								.parents(parents)
								.memberNo(memberNo)
								.tag(tag)
								.reviewStar(writeStar)
								.boardTitle(writeTitle)
								.boardContent(writetext)
								.build();
				
				int result = service.reviewWrite(review);
				
				if(result>0) {
					session.setAttribute("message", "리뷰 작성 성공");
				} else {
					session.setAttribute("message", "리뷰 작성 실패");
				}
				
				req.getRequestDispatcher("/WEB-INF/views/review/review.jsp").forward(req, resp);	
			}
			
			if(command.equals("/updateForm")) {
				
				int boardNo = Integer.parseInt(req.getParameter("boardNo"));
				Review review = service.updateForm(boardNo);
				
				new Gson().toJson(review , resp.getWriter());
			}
			
			if(command.equals("/updateReview")) {
				
				int boardNo = Integer.parseInt(req.getParameter("updateBoardNo"));
				String tag=req.getParameter("tag");
				int rawTag = Integer.parseInt(tag);
				switch(rawTag){
				case 1:
					tag="친절해요";
				break;
				case 2:
					tag="재밌어요";
				break;
				case 3:
					tag="시간가는줄 몰라요";
				break;
				case 4:
					tag="가격대비최고";
				break;
				case 5:
					tag="강의 맛집";
				break;
				case 6:
					tag="다음에 또 올께요";
				break;
				case 7:
					tag="완강했어요";
				break;
				case 8:
					tag="후회 안해요";
				break;
				case 9:
					tag="고민은 시간낭비";
				break;
				}
			
				double writeStar=Double.parseDouble(req.getParameter("writeStar"));
				String writeTitle=req.getParameter("writeTitle");
				String writetext=req.getParameter("writetext");
				Review review = Review.builder()
								.tag(tag)
								.reviewStar(writeStar)
								.boardTitle(writeTitle)
								.boardContent(writetext)
								.build();
				
				
				int result = service.updateReview(boardNo ,review);
				
				if(result >0) {
					session.setAttribute("message", "리뷰 수정 성공");
				} else {
					session.setAttribute("message", "리뷰 수정 실패");
				}
				
				req.getRequestDispatcher("/WEB-INF/views/review/review.jsp").forward(req, resp);

			}
			
			
			if(command.equals("/deleteReview")) {
				int boardNo = Integer.parseInt(req.getParameter("boardNo"));
				
				int result = service.deleteReview(boardNo);
				
				if(result>0) {
					session.setAttribute("message", "리뷰 삭제 성공");
				} else {
					session.setAttribute("message", "리뷰 삭제 실패");
				}
			}
			
			if(command.equals("/thumbsReview")) {
				
				// 추천 하는 리뷰번호
				int boardNo = Integer.parseInt(req.getParameter("boardNo"));
				// 로그인한 사람 닉네임
				String memberNick = req.getParameter("loginMemberNickName");
				List<Integer> resultList = new ArrayList<>();
				resultList = service.thumbsReview(boardNo, memberNick);

				new Gson().toJson(resultList , resp.getWriter());
			}
			
			if(command.equals("/searchReview")) {
				// 검색어
				String searchReview = req.getParameter("searchReview");
				
				List<Review> reviewList= new ArrayList<Review>();
				
				reviewList = service.searchReview(searchReview);
				
				new Gson().toJson(reviewList , resp.getWriter());
				
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
