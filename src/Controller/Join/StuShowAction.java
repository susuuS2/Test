package Controller.Join;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.JoinDAO;
import DTO.JoinDTO;

public class StuShowAction {
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session =request.getSession();
		String ID = (String)session.getAttribute("memId");
	
		
		JoinDAO dao = new JoinDAO();
		JoinDTO dto = dao.StuShow(ID);
		
		request.setAttribute("Info", dto);
		
	}
}
