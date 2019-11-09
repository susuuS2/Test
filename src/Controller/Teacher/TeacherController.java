package Controller.Teacher;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.Join.CheckPassAction;
import Controller.Join.StuInfoModiAction;



public class TeacherController  extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet{
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String RequestURI = request.getRequestURI(); 
		String contextPath = request.getContextPath(); 
		String command = RequestURI.substring(contextPath.length());
		
		
		if(command.equals("/TeacherMy.to")) { //메인페이지에서 마이페이지로 가기 버튼을 클릭 시 이동하기 위함
			TeacherMyAction action = new TeacherMyAction();
			try {
				action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("Teacher/TeacherMy.jsp"); // 마이페이지 이동
			dispatcher.forward(request, response);		
			
		} 
		
		else if(command.equals("/Teacher2Appl.to")) { //카테고리 이동하기.
			Teacher2ApplAction action = new Teacher2ApplAction();
			try {
				action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("Teacher/Teacher2Appl.jsp"); // 마이페이지 이동
			dispatcher.forward(request, response);	
			
		}
		
		else if(command.equals("/Teacher2Applpro.to")) { // 1차 승인된 선생님이 2차 서류 제출을 위해서 제출 페이지
			
			
			Teacher2ApplproAction action = new Teacher2ApplproAction();
			try {
				action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.sendRedirect("joinLogin.jo");
			
		}
		
		else if(command.equals("/TeacherDetail.to")) { // 마이페이지에서 선생님 클릭을 하면 선생님 상세 보기 페이지
			TeacherDetailAction action = new TeacherDetailAction();
			action.execute(request, response);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("Teacher/TeacherDetail.jsp"); // 선생님 클릭하면 디테일 페이지로 가기.
			dispatcher.forward(request, response);	
			
		}
		
		else if(command.equals("/Teachersearch.to")) { //마이페이지에서 하단부분 검색을 클릭하면 나오는 것에 대한 디테일
		
			RequestDispatcher dispatcher = request.getRequestDispatcher("Teacher/TeacherListSearch.jsp"); // 선생님 클릭하면 디테일 페이지로 가기.
			dispatcher.forward(request, response);	
		}
		
		
		else if(command.equals("/TeacherCheckPass.to")) {			
			RequestDispatcher dispatcher = request.getRequestDispatcher("Teacher/TeacherCheckPass.jsp"); // 선생님 클릭하면 디테일 페이지로 가기.
			dispatcher.forward(request, response);	
		}
		
		else if (command.equals("/TeacherCheckPw.to")) { // 비밀번호가 맞았다!?
			CheckPassAction action = new CheckPassAction();
			Integer result = null;

			try {
				result = action.execute(request, response);
				if (result == 1) {
					response.sendRedirect("TeacherModiy.to");
				} else {
					response.sendRedirect("TeacherCheckPass.to"); 
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		else if(command.equals("/TeacherModiy.to")) { // 수정하기 위한 폼을 보여줘야지
			TeacherModiyAction action = new TeacherModiyAction();
			action.execute(request, response);
			RequestDispatcher dispatcher = request.getRequestDispatcher("Teacher/TeacherModiy.jsp"); // 선생님 클릭하면 디테일 페이지로 가기.
			dispatcher.forward(request, response);	
		}
		
		else if (command.equals("/TeacherModiyPro.to")) { // 수정하기
			TeacherModiyProAction action = new TeacherModiyProAction();
			Integer result = null;
			try {
				result = action.execute(request, response);
				if (result > 0) {
					response.sendRedirect("TeahcerInfoModiYES.to"); //수정 확인 버튼 ..
				} else {
					response.sendRedirect("TeacherCheckPass.to"); /* %%%%%%%%%%%%%%%%%%%%%%%%%%% */
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		
		else if(command.equals("/TeahcerInfoModiYES.to")) { // 수정 확인 버튼 누르기 위한 페이지
			 RequestDispatcher dispatcher = request.getRequestDispatcher("Teacher/TeacherInfoYES.jsp"); // 같은 그냥 페이지 이동이니까 이거 줬음.
			 dispatcher.forward(request, response); 
		 }
		
		 else if(command.equals("/TeacherDelete.to")) {	//탈퇴하기 전에 묻는 폼 페이지
			 RequestDispatcher dispatcher = request.getRequestDispatcher("Teacher/TeacherDelete.jsp");
			 dispatcher.forward(request, response); 
		 }
		
		
		 else if(command.equals("/TeacherDeletePro.to")) {	//탈퇴하기 위한  내용
			 TeacherDeleteProAction action = new TeacherDeleteProAction();
			 try {
				action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 response.sendRedirect("TeahcerDeleteYES.to");
		 }

		
		 else if(command.equals("/TeahcerDeleteYES.to")) { // 탈퇴 확인 페이지로가기
			 RequestDispatcher dispatcher = request.getRequestDispatcher("Teacher/TeahcerDeleteYES.jsp"); // 같은 그냥 페이지 이동이니까 이거 줬음.
			 dispatcher.forward(request, response); 
		 }
		
		 else if(command.equals("/Teacherinquiry.to")) { // 1:1 문의하기 페이지
			 RequestDispatcher dispatcher = request.getRequestDispatcher("Teacher/Teacherinquiry.jsp"); // 같은 그냥 페이지 이동이니까 이거 줬음.
			 dispatcher.forward(request, response); 
		 }

		else if(command.equals("/TeacherinquiryPro.to")) { // 1:1 문의한 내용을 DB에 저장하기 위해서
			TeacherinquiryProAction action = new TeacherinquiryProAction();
			try {
				action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			response.sendRedirect("joinLogin.jo");
		 }
		
		
		
		
		
		
		
		
		
		
	}
	
	
	
	
	
	
	

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		doProcess(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
}
