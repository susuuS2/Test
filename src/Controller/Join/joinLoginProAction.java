package Controller.Join;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.JoinDAO;
import DTO.JoinDTO;

public class joinLoginProAction {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession(); 
		String JoinId = request.getParameter("id1"); 
	   	String JoinPw = request.getParameter("pw");
	   	String idStroe = request.getParameter("idStore");


	   	JoinDAO dao = new JoinDAO();
	   	Integer result = dao.userCheck(JoinId, JoinPw); 
	   	Integer aa = dao.user(JoinId); // 관리자 학생 선생 페이지 나누는
	    JoinDTO sel = dao.sele(JoinId); //로그인을 했을때 선생님에 대한 메인페이지로 값을 전달하기 위해서 사용하는 메소드
	   
	   	
	   	if(result == 1) {
	   		session.setAttribute("memId", JoinId);
	   		session.setAttribute("aaas", aa);
	   		session.setAttribute("sel", sel); // 값을 전달.
	   		session.removeAttribute("failPw");
	   		session.removeAttribute("failId");
	   		
	   		if(idStroe != null && idStroe.equals("store")) { 
	   			Cookie cookie = new Cookie("id", JoinId); 
	   			cookie.setMaxAge(60*60*24*30); 
	   			response.addCookie(cookie); 
	   		} else {
	   			Cookie cookie = new Cookie("id", JoinId);
	   			cookie.setMaxAge(0);
	   			response.addCookie(cookie); 
	   			session.removeAttribute("isId"); 
	   			session.removeAttribute("cookieId");
	   		}

	   		
	   	} else if(result == 0){
	   		session.setAttribute("failPw", "비밀번호가 틀렸습니다");
	   		session.removeAttribute("failId"); 
	   	} else if(result == -1) {
	   		session.setAttribute("failId", "아이디가 존재하지 않습니다");
	   		session.removeAttribute("failPw");
	   	}
	   	
	}
}