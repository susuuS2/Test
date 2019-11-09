package Controller.Join;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.JoinDAO;
import DTO.JoinDTO;

public class StuMyPageAction {
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		Integer num1 = Integer.parseInt(request.getParameter("num"));			//좀다 NUM값 여기로 보내줘야함
		
		
		JoinDAO dao = new JoinDAO();
		JoinDTO dto= dao.StuMaP(num1);
		request.setAttribute("dto", dto);
	}
}
