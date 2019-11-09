package Controller.Teacher;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.JoinDAO;
import DTO.JoinDTO;

public class TeacherMyAction {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		Integer joinNum1 = Integer.parseInt(request.getParameter("num"));
		

		JoinDAO dao = new JoinDAO();
		JoinDTO dto =  dao.TeacherDetail(joinNum1);
		request.setAttribute("dto", dto);
		
	}
}
