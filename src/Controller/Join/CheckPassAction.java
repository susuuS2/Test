package Controller.Join;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.JoinDAO;

public class CheckPassAction {
	public Integer execute(HttpServletRequest request, HttpServletResponse response) {
		String StuPw = request.getParameter("pw");
		
		HttpSession session = request.getSession();
		String StuId =(String)session.getAttribute("memId");
		
		JoinDAO dao = new JoinDAO();
		Integer result = dao.CheckPass(StuPw, StuId);
		
		return result;
	}
}
