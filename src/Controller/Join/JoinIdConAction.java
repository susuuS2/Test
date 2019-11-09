package Controller.Join;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.JoinDAO;

public class JoinIdConAction {
	
public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		
		request.setCharacterEncoding("UTF-8");
		
		String JoinId = request.getParameter("JoinId"); 
		JoinDAO dao = new JoinDAO();

		String JoinIdCon = dao.selectId(JoinId);
		
		if(JoinIdCon == null) {
			request.setAttribute("msg", "사용가능한 id입니다");
			request.setAttribute("num", 2);
		} else {
			request.setAttribute("msg", "사용중인 id입니다");
			request.setAttribute("num", 1);
		}
		request.setAttribute("JoinId", JoinId);
		}
	}


