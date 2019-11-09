package Controller.Teacher;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.JoinDAO;
import DTO.JoinDTO;

public class Teacher2ApplAction {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String num = request.getParameter("num");
		Integer num1 = Integer.parseInt(num);

		JoinDAO dao = new JoinDAO();
		
		JoinDTO dto =  dao.selea(num1);
		
		request.setAttribute("dto", dto);
	}

}
