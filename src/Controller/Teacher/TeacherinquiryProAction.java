package Controller.Teacher;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.JoinTableDAO;
import DTO.JoinTableDTO;

public class TeacherinquiryProAction {

	public void execute(HttpServletRequest request, HttpServletResponse response)  throws Exception{
		request.setCharacterEncoding("utf-8");
		JoinTableDTO dto = new JoinTableDTO();
		
		dto.setJoinSubject(request.getParameter("TeacherSubject"));
		dto.setJoinTitle(request.getParameter("TeacherTitle"));
		dto.setJoinContent(request.getParameter("Teachercontent"));
		
		
		JoinTableDAO dao = new JoinTableDAO();
		dao.TeacherInsert(dto);
		
		
		
	}
}
