package Controller.Join;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.JoinDAO;

public class AdminDeleteProAction {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String num = request.getParameter("num");
		Integer num1 = Integer.parseInt(num);
		
		JoinDAO dao = new JoinDAO();
		dao.AdminStudelete(num1);
	}

}
