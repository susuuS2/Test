package Controller.Teacher;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DAO.JoinDAO;
import DTO.JoinDTO;

public class Teacher2ApplproAction {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String filePath = "Join\\upload";
		String realPath = request.getRealPath(filePath);
		String num1 = request.getParameter("num");

		                                                                                                                               
		int fileSize = 1024*1024*5;
		 
		MultipartRequest multi = new MultipartRequest(request, realPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
	    
		JoinDTO dto = new JoinDTO();
		
		dto.setJoinFile(multi.getFilesystemName("JoinFile"));
		dto.setJoinNum(Integer.parseInt(multi.getParameter("num")));
		
		
		JoinDAO dao = new JoinDAO();
		

		Integer result = dao.TeacherFileInsert(dto);

		
	}

}
