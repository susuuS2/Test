package Controller.Join;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.JoinDAO;

public class StuAccountDelComAction {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String Pw = request.getParameter("pw");
		HttpSession session = request.getSession();
		String DelId = (String)session.getAttribute("memId"); 
		
		JoinDAO dao = new JoinDAO();
		dao.accountDel(Pw, DelId);
	}
}
