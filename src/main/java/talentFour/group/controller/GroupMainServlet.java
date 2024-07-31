package talentFour.group.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import talentFour.group.model.service.GroupService;
import talentFour.group.model.vo.GroupMain;
import talentFour.member.model.vo.Member;

@WebServlet("/groupMain")
public class GroupMainServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		try {

			int cp = 1;
			
			// 페이지네이션의 번호 선택 시
			// 쿼리 스트링에 cp가 있음 --> cp = 쿼리스트링의 cp 값
			
			if(req.getParameter("cp") != null) { // 쿼리스트링에 "cp"가 존재한다면
				cp = Integer.parseInt(req.getParameter("cp"));
			}
			
			GroupService service = new GroupService();
			Map<Object, String> map = null;
			
			List<GroupMain> GroupBoardList = service.selectBoardList();
			
			req.setAttribute("GroupBoardList", GroupBoardList);
			
			req.setAttribute("map", map);
			
			req.getRequestDispatcher("/WEB-INF/views/group/groupMain.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String studytitle = req.getParameter("studytitle");
		String studycontent = req.getParameter("studycontent");
		String studystart1 = req.getParameter("studystart");
		String studyend1 = req.getParameter("studyend");
		
//		LocalDate studystart = null;
//        if (studystart1 != null) {
//        	studystart = LocalDate.parse(studystart1, DateTimeFormatter.ISO_DATE);
//        }
//        
//        LocalDate studyend = null;
//        if (studyend1 != null) {
//        	studyend = LocalDate.parse(studyend1, DateTimeFormatter.ISO_DATE);
//        }
		
		int studynumber = Integer.parseInt(req.getParameter("studynumber"));
		String studyaddress = req.getParameter("studyaddress");
		String studytel = req.getParameter("studytel");
		String studytype = req.getParameter("meetvalue");
		String studycost = req.getParameter("studycost");
		
		String[] stackArray = req.getParameterValues("stack");
        
        // 체크박스 값이 null이 아닌지 확인하고 최대 7개까지 제한
		if (stackArray != null) {
            List<String> stackList = Arrays.asList(stackArray);
            if (stackList.size() > 7) {
                stackList = stackList.subList(0, 7);
            }
        }
        
		
		
        try {
			
        	
        	
        	
        	
		} catch (Exception e) {
			e.printStackTrace();
		}
        
	}
}
