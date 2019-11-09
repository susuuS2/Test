package Controller.Join;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.JoinTableDAO;
import DTO.JoinTableDTO;

public class StuinquiryProAction {
	
	public void execute(HttpServletRequest request, HttpServletResponse response)  throws Exception{
		request.setCharacterEncoding("utf-8");
		JoinTableDTO dto = new JoinTableDTO();
		
		dto.setJoinSubject(request.getParameter("JoinSubject"));
		dto.setJoinTitle(request.getParameter("JoinTitle"));
		dto.setJoinContent(request.getParameter("Joincontent"));
		
		
		JoinTableDAO dao = new JoinTableDAO();
		dao.JoinInsert(dto);
		
		
		
	}

}
