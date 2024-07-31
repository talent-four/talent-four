package talentFour.wonder.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import talentFour.group.model.vo.member;
import talentFour.member.model.vo.Member;
import talentFour.wonder.service.WonderService;

@WebServlet("/wonder/*")
public class wonderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = uri.substring((contextPath + "/wonder/").length());

		WonderService service = new WonderService();

		try {
			if (command.equals("free")) {
				int type = 1; // 자유게시판 타입 지정
				int cp = req.getParameter("cp") != null ? Integer.parseInt(req.getParameter("cp")) : 1;
				int itemsPerPage = req.getParameter("itemsPerPage") != null ? Integer.parseInt(req.getParameter("itemsPerPage")) : 10;

				Map<String, Object> freeData = service.selectlistFree(type, cp, itemsPerPage);

				req.setAttribute("boardName", freeData.get("boardName"));
				req.setAttribute("pagination", freeData.get("pagination"));
				req.setAttribute("freeList", freeData.get("boardList"));

				req.getRequestDispatcher("/WEB-INF/views/wonder/wonderFree.jsp").forward(req, resp);
			}   else if (command.equals("detail")) {
				String boardId = req.getParameter("id"); // 게시글 ID 가져오기
				if (boardId != null && !boardId.isEmpty()) {
					Map<String, Object> detailData = service.selectBoardById(boardId);

					req.setAttribute("board", detailData.get("board"));

					req.getRequestDispatcher("/WEB-INF/views/wonder/wonderDetail.jsp").forward(req, resp);
				} else {
					resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid board ID");
				}
			}
			else if (command.equals("class")) {
				req.getRequestDispatcher("/WEB-INF/views/wonder/wonderClass.jsp").forward(req, resp);
			}

			else if (command.equals("write")) {
				req.getRequestDispatcher("/WEB-INF/views/wonder/wonderFree_detail.jsp").forward(req, resp);
			}


		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		WonderService service = new WonderService();
		HttpSession session = req.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");

		String title = req.getParameter("title");
		String content = req.getParameter("content");

		if (loginMember != null) {
			if (title != null && !title.trim().isEmpty() && content != null && !content.trim().isEmpty()) {
				int memberNo = loginMember.getMemberNo();
				try {
					int result = service.writeBoard(title, content, memberNo);
					if (result > 0) {
						resp.sendRedirect(req.getContextPath() + "/wonder/free"); // 성공 시 목록 페이지로 리다이렉션
					} else {
						req.setAttribute("message", "게시글 등록에 실패했습니다.");
						req.getRequestDispatcher("/WEB-INF/views/wonder/wonderFree_detail.jsp").forward(req, resp);
					}
				} catch (Exception e) {
					e.printStackTrace();
					req.setAttribute("message", "게시글 등록 중 오류가 발생했습니다.");
					req.getRequestDispatcher("/WEB-INF/views/wonder/wonderFree_detail.jsp").forward(req, resp);
				}
			} else {
				req.setAttribute("message", "제목과 내용을 입력해 주세요.");
				req.getRequestDispatcher("/WEB-INF/views/wonder/wonderFree_detail.jsp").forward(req, resp);
			}
		} else {
			req.setAttribute("message", "로그인 후 이용해주세요.");
			req.getRequestDispatcher("/WEB-INF/views/sign/sign.jsp").forward(req, resp);
		}
	}
}

