package Controller.Join;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.JoinDAO;
import DTO.JoinDTO;

public class JoinAction {
	public Integer execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		request.setCharacterEncoding("UTF-8");
		
		boolean aa =true;
		
		JoinDTO dto = new JoinDTO();
	
		dto.setJoinId(request.getParameter("JoinId"));
		dto.setJoinPass(request.getParameter("JoinPw"));
		dto.setJoinName(request.getParameter("JoinName"));
		
		dto.setJoinBirth1(Integer.parseInt(request.getParameter("JoinBirth1")));
		dto.setJoinBirth2(Integer.parseInt(request.getParameter("JoinBirth2")));
		dto.setJoinBirth3(Integer.parseInt(request.getParameter("JoinBirth3")));
		
		dto.setJoinSex(request.getParameter("JoinSex"));
		dto.setJoinNacionalidad(request.getParameter("JoinNacio"));
		dto.setJoinPh1(Integer.parseInt(request.getParameter("JoinPh1")));
		dto.setJoinPh2(Integer.parseInt(request.getParameter("JoinPh2")));
		dto.setJoinPh3(Integer.parseInt(request.getParameter("JoinPh3")));

		dto.setJoinEmail1(request.getParameter("JoinEmail1"));
		dto.setJoinEmail2(request.getParameter("JoinEmail2"));
		dto.setJoinAddr1(request.getParameter("JoinAddr1"));
		dto.setJoinAddr2(request.getParameter("JoinAddr2"));
		dto.setJoinAddr3(request.getParameter("JoinAddr3"));
		
		JoinDAO dao = new JoinDAO();
		Integer result = dao.JoinInsert(dto);
		
		return result;
		
		
	}
}
