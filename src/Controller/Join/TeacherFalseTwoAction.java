package Controller.Join;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.JoinDAO;
import DTO.JoinDTO;

public class TeacherFalseTwoAction {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
			
			JoinDAO dao = new JoinDAO();
			JoinDTO dto = dao.JoinFalseTwo(Integer.parseInt(request.getParameter("num")));
			
			String goodsImage = request.getParameter("image");
			
		
			String realPath = request.getRealPath("/Join/upload");
		

			String filePath = realPath + "/" + goodsImage;
	
				
			File f = new File(filePath);
			if(f.exists()) {
					f.delete();
			}
			

			mailsend ms = new mailsend();
			ms.mailFalseTwo(request, response);
			
	 }
}
