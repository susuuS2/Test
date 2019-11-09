package Controller.Join;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.JoinDAO;
import DTO.JoinDTO;

public class StuInfoModiAction {
	public Integer execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session =request.getSession();
		String id = (String)session.getAttribute("memId");
		System.out.println(id);
		
		JoinDTO dto = new JoinDTO();
		dto.setJoinId((String)session.getAttribute("memId"));
		dto.setJoinName(request.getParameter("NewName"));
		dto.setJoinEmail1(request.getParameter("NewEmail1"));
		dto.setJoinEmail2(request.getParameter("NewEmail2"));
		dto.setJoinAddr1(request.getParameter("NewAddr1"));
		dto.setJoinAddr2(request.getParameter("NewAddr2"));
		dto.setJoinAddr3(request.getParameter("NewAddr3"));
		dto.setJoinPh1(Integer.parseInt(request.getParameter("NewPh1")));
		dto.setJoinPh2(Integer.parseInt(request.getParameter("NewPh2")));
		dto.setJoinPh3(Integer.parseInt(request.getParameter("NewPh3")));
		
		
		JoinDAO dao = new JoinDAO();
		Integer result = dao.StuModi(dto);
		return result;
	}
}
