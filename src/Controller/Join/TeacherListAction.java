package Controller.Join;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.JoinDAO;
import DTO.JoinDTO;

public class TeacherListAction {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		int page1 = 1;
		int limit = 10;
		int limitPage = 10;
		if(request.getParameter("page") != null) {
			page1 = Integer.parseInt(request.getParameter("page")); //현 가져온 페이지가 쿼리스트링으로 받아왔으니까 하지만 int page라고 인트형을 선언
			
		}
		
		JoinDAO dao = new JoinDAO();
		List<JoinDTO> list = dao.SelectList(page1, limit);
		Integer Count = dao.TeacherCount();
		
		
		int maxPage = (int)((double)Count / limit + 0.95);
		int startPage = (int)(((double)page1 / limitPage + 0.9) - 1) * 10 + 1;
		int endPage = startPage + limitPage - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage; //end페이지가 max페이지보다 커질 수 있으니까 그떄 end가 max페이지가 되야지
		}
		
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("page", page1);
		
		
		request.setAttribute("Teacherlist", list);
		request.setAttribute("Teachercount", Count);
	}
}
