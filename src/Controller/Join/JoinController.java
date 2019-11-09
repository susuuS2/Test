package Controller.Join;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.Teacher.TeacherinquiryProAction;


public class JoinController extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String RequestURI = request.getRequestURI(); 
		String contextPath = request.getContextPath(); 
		String command = RequestURI.substring(contextPath.length());
		if(command.equals("/index.jo")) { //메인
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("Main/Main.jsp");
			dispatcher.forward(request, response);		
	
		} 
		
		else if(command.equals("/joinForm.jo")) { //회원가입
			RequestDispatcher dispatcher =request.getRequestDispatcher("Join/JoinForm.jsp");
			 dispatcher.forward(request, response); 
		}
		
		else if(command.equals("/JoinAction.jo")) { //회원가입 insert하기 위해서
			JoinAction action = new JoinAction();
			
				Integer result;
				try {
					 result = action.execute(request, response);				
					if(result > 0 ) {
						response.sendRedirect("index.jo"); 
					} else {
						response.sendRedirect("joinForm.jo");
					}
				} catch (Exception e) {
					e.printStackTrace();
				}			
		}
		else if(command.equals("/JoinIdCon.jo")) { // 아이디 중복확인.
			JoinIdConAction action = new JoinIdConAction();
			try {
				action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("Join/JoinConfirmNum.jsp");
			dispatcher.forward(request, response); 
		}
	
		else if(command.equals("/joinLogin.jo")) { //로그인
			CookieAction action = new CookieAction();
			action.execute(request, response);
			RequestDispatcher dispatcher = request.getRequestDispatcher("Join/JoinLoginForm.jsp");
			dispatcher.forward(request, response); 
		}
		
		else if(command.equals("/joinLoginPro.jo")) { //로그인 내
			
			joinLoginProAction action = new joinLoginProAction();
			action.execute(request, response);
			response.sendRedirect("joinLogin.jo");
		}
		
		
		else if(command.equals("/joinLogout.jo")) { //로그인 아웃
			
			joinLogoutAction action = new joinLogoutAction();
			action.execute(request, response);
			response.sendRedirect("index.jo");
		}	
	
		else if(command.equals("/TJoinForm.jo")) { // 선생님 회원가입 창.
			
			RequestDispatcher dispatcher =request.getRequestDispatcher("Join/TJoinForm.jsp");
			dispatcher.forward(request, response);
			 
		}	
	
		else if(command.equals("/TjoinAction.jo")) { // 선생님 회원가입 창.
			TjoinAction action = new TjoinAction();
					
			Integer result;
			try {
				result = action.execute(request, response);
				
				if(result > 0 ) {
					response.sendRedirect("index.jo");
				} else {
					response.sendRedirect("joinForm.jo");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
			 
		}	
		
		else if (command.equals("/TeacherList.jo")) { // 선생님 레벨 1의 항목이 뜨게 하기 위해서
			
			TeacherListAction action = new TeacherListAction();
			try {
				action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher dispatcher =request.getRequestDispatcher("Teacher/TeacherList.jsp");
			dispatcher.forward(request, response);
		}
	
		else if (command.equals("/TeacherTrue.jo")) { // 관리자가 선생님 승인을 누르면 레벨이 2로 변하게.
			
			TeacherTrueAction action = new TeacherTrueAction();
			try {
				action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.sendRedirect("TeacherList.jo");
			
		}
		
		else if (command.equals("/TeacherFalse.jo")) { // 관리가자 선생님 비승인을 누르면 삭제되게
			
			TeacherFalseAction action = new TeacherFalseAction();
			 try {
				action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.sendRedirect("TeacherList.jo");
			
		}
		
		else if (command.equals("/TeacherTwoList.jo")) { // 선생님의 2차 승인 페이지로 넘어가게 하기 위해서
		
			TeacherTwoListAction action = new TeacherTwoListAction();
			try {
				action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher dispatcher =request.getRequestDispatcher("Teacher/TeacherTwoList.jsp");
			dispatcher.forward(request, response);
		
		} 
		
		else if (command.equals("/TeacherTrueTwo.jo")) { // 관리자가 2차 선생님 승인을 누르면 레벨이 3로 변하게.
			
			TeacherTrueTwoAction action = new TeacherTrueTwoAction();
			try {
				action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.sendRedirect("TeacherTwoList.jo");
			
		}
		
		else if (command.equals("/TeacherFalseTwo.jo")) { // 관리가자 2차 선생님 비승인을 누르면 삭제되게
			
			TeacherFalseTwoAction action = new TeacherFalseTwoAction();
			 try {
				action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.sendRedirect("TeacherTwoList.jo");
			
		}

		else if(command.equals("/FileUpload.jo")) {
		
			try {
	
				String fileName = request.getParameter("filename");
				
				// 서버에 올라간 경로를 가져옴
				ServletContext context = getServletContext();
				String uploadFilePath = context.getRealPath("Join/upload");
				String filePath = uploadFilePath + File.separator + fileName;
				
				byte[] b = new byte[4096];
				FileInputStream fileInputStream = new FileInputStream(filePath);
				
				String mimeType = getServletContext().getMimeType(filePath);
				if(mimeType == null) {
					mimeType = "application/octet-stream";
				}
				response.setContentType(mimeType);
				
		        // 파일명 UTF-8로 인코딩(한글일 경우를 대비)
		        String sEncoding = new String(fileName.getBytes("UTF-8"));
		        response.setHeader("Content-Disposition", "attachment; fileName= " + sEncoding);
		        
		        // 파일 쓰기 OutputStream
		        ServletOutputStream servletOutStream = response.getOutputStream();
		        
		        int read;
		        while((read = fileInputStream.read(b,0,b.length))!= -1){
		            servletOutStream.write(b,0,read);            
		        }
		        
		        servletOutStream.flush();
		        servletOutStream.close();
		        fileInputStream.close();
		        
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}
			
		}
		
		
		else if (command.equals("/StuMyPage.jo")) { // 학생 내 정보 보기
			StuMyPageAction action = new StuMyPageAction();
			String num = request.getParameter("num");
			try {
				action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("Student/StudentPage.jsp?num="+num);
			dispatcher.forward(request, response);
		}
		
		else if (command.equals("/CheckPass.jo")) { // 학생 정보 수정을 위한 비밀번호 확인페이지 가기
			RequestDispatcher dispatcher = request.getRequestDispatcher("Student/CheckPassP.jsp");
			dispatcher.forward(request, response);
		}

		else if (command.equals("/CheckPw.jo")) { // 비밀번호가 맞았다!?
			CheckPassAction action = new CheckPassAction();
			Integer result = null;

			try {
				result = action.execute(request, response);
				if (result == 1) {
					response.sendRedirect("StuInfoModi.jo");
				} else {
					response.sendRedirect("CheckPass.jo"); 
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		else if (command.equals("/StuInfoModi.jo")) { // 수정폼 보여주기
			StuShowAction action = new StuShowAction();
			try {
				action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("Student/StuInfoModi.jsp");
			dispatcher.forward(request, response);
		}

		else if (command.equals("/StuInfoModify.jo")) { // 수정
			StuInfoModiAction action = new StuInfoModiAction();
			Integer result = null;
			try {
				result = action.execute(request, response);
				if (result > 0) {
					response.sendRedirect("StuInfoModiYES.jo");
				} else {
					response.sendRedirect("CheckPass.jo"); /* %%%%%%%%%%%%%%%%%%%%%%%%%%% */
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		
		 else if(command.equals("/StuInfoModiYES.jo")) {
			 RequestDispatcher dispatcher = request.getRequestDispatcher("Student/StuInfoYES.jsp");
			 dispatcher.forward(request, response); 
		 }
		 
		 else if(command.equals("/StuAccountDel.jo")) {		//탈퇴하기
			 RequestDispatcher dispatcher = request.getRequestDispatcher("Student/StuAccountDel.jsp");
			 dispatcher.forward(request, response); 
		 }
		
		 else if(command.equals("/StuAccountDelCom.jo")) {
			 StuAccountDelComAction action = new StuAccountDelComAction();
			 try {
				action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			 response.sendRedirect("StuAccountDelYES.jo");
		 }
		
		 else if(command.equals("/StuAccountDelYES.jo")) {
			 RequestDispatcher dispatcher = request.getRequestDispatcher("Student/StuAaccountDel.jsp");
			 dispatcher.forward(request, response); 
		 }
		
		 else if(command.equals("/Stuinquiry.jo")) { // 1:1 문의하기 페이지
			 RequestDispatcher dispatcher = request.getRequestDispatcher("Student/Stuinquiry.jsp"); // 같은 그냥 페이지 이동이니까 이거 줬음.
			 dispatcher.forward(request, response); 
		 }

		else if(command.equals("/StuinquiryPro.jo")) { // 1:1 문의한 내용을 DB에 저장하기 위해서
			StuinquiryProAction action = new StuinquiryProAction();
			try {
				action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			response.sendRedirect("joinLogin.jo");
		 }
		
		 else if(command.equals("/AdminquiryList.jo")) { // 관리자 페이지에서 1:1문의 조회를 하기 위한 페이지
			 AdminquiryListAction action = new AdminquiryListAction();
			 action.execute(request, response);
			 
			 RequestDispatcher dispatcher = request.getRequestDispatcher("Admin/AdminquiryList.jsp"); // 같은 그냥 페이지 이동이니까 이거 줬음.
			 dispatcher.forward(request, response); 
		 }
		
		 else if(command.equals("/AdminStuList.jo")) { // 회원 조회를 하기 위해서
			 AdminStuListAction action = new AdminStuListAction();
			 action.execute(request, response);
			 
			 RequestDispatcher dispatcher = request.getRequestDispatcher("Admin/AdminStuList.jsp"); // 같은 그냥 페이지 이동이니까 이거 줬음.
			 dispatcher.forward(request, response); 
		 }

		
		else if(command.equals("/AdminDelete.jo")) { // 회원 삭제를
			 AdminStuListAction action = new AdminStuListAction();
			 action.execute(request, response);
			 
			 RequestDispatcher dispatcher = request.getRequestDispatcher("Admin/AdminStuList.jsp"); // 같은 그냥 페이지 이동이니까 이거 줬음.
			 dispatcher.forward(request, response); 
		 }
		else if(command.equals("/AdminDeletePro.jo")) { // 회원 삭제하기 위한
			 AdminDeleteProAction action = new AdminDeleteProAction();
			 action.execute(request, response);
			 
			 response.sendRedirect("AdminStuList.jo");
		 }
		
		
		 else if(command.equals("/AdminTeacherList.jo")) { // 선생님 조회를 하기 위해서
			 AdminTeacherListAction action = new AdminTeacherListAction();
			 action.execute(request, response); 
			 RequestDispatcher dispatcher = request.getRequestDispatcher("Admin/AdminTeacherList.jsp"); // 같은 그냥 페이지 이동이니까 이거 줬음.
			 dispatcher.forward(request, response); 
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
