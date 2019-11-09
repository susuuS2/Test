package Controller.Teacher;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DAO.JoinDAO;
import DTO.JoinDTO;

public class TeacherModiyProAction {
	
	public Integer execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		HttpSession session =request.getSession();
		String id = (String)session.getAttribute("memId");

		request.setCharacterEncoding("utf-8");
		
		String filePath = "Join\\upload";
		String realPath = request.getRealPath(filePath);
		int fileSize = 1024*1024*5;
		
		MultipartRequest multi = new MultipartRequest(request, realPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());
	
		
		JoinDTO dto = new JoinDTO();
		dto.setJoinId((String)session.getAttribute("memId"));
		
		dto.setJoinName(multi.getParameter("JoinName"));
		dto.setJoinBirth1(Integer.parseInt(multi.getParameter("JoinBirth1")));
		dto.setJoinBirth2(Integer.parseInt(multi.getParameter("JoinBirth2")));
		dto.setJoinBirth3(Integer.parseInt(multi.getParameter("JoinBirth3")));
		dto.setJoinPh1(Integer.parseInt(multi.getParameter("JoinPh1")));
		dto.setJoinPh2(Integer.parseInt(multi.getParameter("JoinPh2")));
		dto.setJoinPh3(Integer.parseInt(multi.getParameter("JoinPh3")));
		dto.setJoinEmail1(multi.getParameter("JoinEmail1"));
		dto.setJoinEmail2(multi.getParameter("JoinEmail2"));
		dto.setJoinSubject(multi.getParameter("Joinsubject"));
		dto.setJoinIntro(multi.getParameter("JoinIntro"));
		dto.setJoinLoc(multi.getParameter("JoinLoc"));
		dto.setJoinHav(multi.getParameter("JoinHav"));
		dto.setJoinInli(multi.getParameter("JoinLi"));
		dto.setJoinExpe1(multi.getParameter("JoinExpe1"));
		dto.setJoinExpe2(multi.getParameter("JoinExpe2"));
		dto.setJoinStulev(multi.getParameter("JoinStuLev"));
		dto.setJoinPre(multi.getParameter("JoinPre"));
	
		dto.setJoinPrice(Integer.parseInt(multi.getParameter("JoinPrice")));
		
		JoinDAO dao = new JoinDAO();
		
		
		
		File file = null;
		dto.setJoinImage(multi.getFilesystemName("JoinImage"));
	    Integer result = dao.TeacherModiy(dto);
	    file = new File(realPath + "/" + multi.getParameter("fileDel"));
	    
	    if(file.exists()){file.delete();}
	    

		return result;
	}

}
