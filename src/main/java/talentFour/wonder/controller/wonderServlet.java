package talentFour.wonder.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
