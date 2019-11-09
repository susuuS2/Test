package Controller.Join;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.JoinDAO;
import DTO.JoinDTO;

public class TeacherTrueTwoAction {

public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		JoinDAO dao = new JoinDAO();
		JoinDTO dto = dao.JoinTrueTwo(Integer.parseInt(request.getParameter("num")));
		
		mailsend ms = new mailsend();
		ms.mailTrueTwo(request, response);
		
	}
}
