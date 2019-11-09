package Controller.Teacher;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.JoinDAO;
import DTO.JoinDTO;

public class TeacherDetailAction {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		Integer joinNum1 = Integer.parseInt(request.getParameter("num"));
		
		JoinDAO dao = new JoinDAO();
		
		JoinDTO dto = dao.TeacherDetail(joinNum1);
		dto.setJoinPre(dto.getJoinPre().replace("\n", "<br/>"));
		
		request.setAttribute("dto", dto);
	}
}
