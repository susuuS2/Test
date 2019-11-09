
package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DTO.JoinDTO;

public class JoinDAO {

	
	PreparedStatement pstmt;
	Connection conn;
	ResultSet rs;
	String sql;
	String jdbcDriver;
	String jdbcUrl;
	
	private Connection getConnection() {
		Connection con = null;
		
		jdbcDriver = "oracle.jdbc.driver.OracleDriver";
		jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
		
		try {
			Class.forName(jdbcDriver);
			con = DriverManager.getConnection(jdbcUrl, "STUDY", "STUDY");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public void close(ResultSet rs, PreparedStatement pstmt) {
		if (rs != null) 
			try { rs.close(); } 
		    catch(SQLException ex) {}
        if (pstmt != null) 
        	try { pstmt.close(); } 
            catch(SQLException ex) {}
        if (conn != null) 
        	try { conn.close(); } 
            catch(SQLException ex) {}
	}
	
	public Integer JoinInsert(JoinDTO dto) { // 학생을 회원가입 하기 위한 창
		conn = getConnection();
		
		Integer result = 0;
		
		sql = "insert into haeyum_join(join_num, join_id, join_pass, join_name, join_birth1, join_birth2, join_birth3, join_sex, join_nacionalidad, join_ph1, join_ph2, join_ph3, join_email1, join_email2, join_addr1, join_addr2, join_addr3, LEV, join_register)"
				+ " values(nvl((select max(join_num)+1 from haeyum_join ),1),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?, 0, sysdate)";
	
			
		try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, dto.getJoinId());
				pstmt.setString(2, dto.getJoinPass());
				pstmt.setString(3, dto.getJoinName());
				pstmt.setInt(4, dto.getJoinBirth1());
				pstmt.setInt(5, dto.getJoinBirth2());
				pstmt.setInt(6, dto.getJoinBirth3());
				pstmt.setString(7, dto.getJoinSex());
				pstmt.setString(8, dto.getJoinNacionalidad());	
				pstmt.setInt(9, dto.getJoinPh1());
				pstmt.setInt(10, dto.getJoinPh2());
				pstmt.setInt(11, dto.getJoinPh3());
				pstmt.setString(12, dto.getJoinEmail1());
				pstmt.setString(13, dto.getJoinEmail2());	
				pstmt.setString(14, dto.getJoinAddr1());
				pstmt.setString(15, dto.getJoinAddr2());
				pstmt.setString(16, dto.getJoinAddr3());
				
				
				
				result = pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close(rs, pstmt);
			}
		return result;
		
		}
	
	public Integer TjoinInsert(JoinDTO dto) { // 선생님 회원가입 하기 위한 내용
		Integer result = null;
		conn = getConnection();
		sql = "insert into haeyum_join(join_num, join_id, join_pass, join_name, join_birth1, join_birth2, join_birth3, join_sex, join_nacionalidad, join_ph1, join_ph2, join_ph3, join_email1, join_email2, join_subject, join_intro, join_loc, join_hav, join_inli, join_expe1, join_expe2, join_stulev, join_pre, join_image, LEV, join_register, join_price) "
				+ " values(nvl((select max(join_num)+1 from haeyum_join ),1), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1, sysdate, ?)";
		
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getJoinId());
			pstmt.setString(2, dto.getJoinPass());
			pstmt.setString(3, dto.getJoinName());
			pstmt.setInt(4, dto.getJoinBirth1());
			pstmt.setInt(5, dto.getJoinBirth2());
			pstmt.setInt(6, dto.getJoinBirth3());
			pstmt.setString(7, dto.getJoinSex());
			pstmt.setString(8, dto.getJoinNacionalidad());
			pstmt.setInt(9, dto.getJoinPh1());
			pstmt.setInt(10, dto.getJoinPh2());
			pstmt.setInt(11, dto.getJoinPh3());
			pstmt.setString(12, dto.getJoinEmail1());
			pstmt.setString(13, dto.getJoinEmail2());
			pstmt.setString(14, dto.getJoinSubject());
			pstmt.setString(15, dto.getJoinIntro());
			pstmt.setString(16, dto.getJoinLoc());
			pstmt.setString(17, dto.getJoinHav());
			pstmt.setString(18, dto.getJoinInli());
			pstmt.setString(19, dto.getJoinExpe1());
			pstmt.setString(20, dto.getJoinExpe2());
			pstmt.setString(21, dto.getJoinStulev());
			pstmt.setString(22, dto.getJoinPre());
			pstmt.setString(23, dto.getJoinImage());
			pstmt.setInt(24, dto.getJoinPrice());
		
			
			result = pstmt.executeUpdate();
			
			
		} catch(Exception e) {
			
		} finally {
			close(rs, pstmt);
		}
		
		
		return result;
	}
	
	
	

	public String selectId(String JoinId) {  // 아이디 중복을 하기 위해서 사용하는 메소드
		String result = null;
		conn = getConnection();
		sql = "select join_id from haeyum_join where join_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, JoinId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getString("join_id");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt);
		}
		
		
		
		return result;
	}
	
	
	
	
	public Integer userCheck(String JoinId, String JoinPw) { // 로그인을 하기위해서 체크 하는 곳
		
		conn = getConnection();
		sql = "select join_pass, join_num from haeyum_join where join_id = ?"; 
		String dbpw = null;
		Integer result = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, JoinId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbpw = rs.getString(1);
				if(JoinPw.equals(dbpw)) {
				
					result = 1;
				} else {
					result = 0;
				}
			} else {
				result = -1;
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt);
		}
		return result;
	}
	
	public Integer user(String JoinId) { // 로그인을 했을 때 해당 로그인이 누구인지 관리자. 선생님 1차, 선생님 2차, 학생 
		
		conn = getConnection();
		sql = "select lev from haeyum_join where join_id = ?"; 
		String dbpw = null;
		Integer result = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, JoinId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				if(rs.getInt(1) == 0) {
				
					result = 1;
					
				} else if(rs.getInt(1) == 4){
					
					result = 2;
				}  else if(rs.getInt(1) == 2){
					
					result = 3;
				} else if(rs.getInt(1) == 3){
					
					result = 4;
				} 
				
				
				}
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				close(rs, pstmt);
			}
			return result;
		
	}

	
	public List<JoinDTO> SelectList(int page1, int limit) { // 페이징기법으로 나타내고 선생님의 목록이 레벨 1인것 , 그리고 메인페이지에서 선생님 목록을 가져오기 위해서 사용했어 ..
		
		List<JoinDTO> list = new ArrayList<JoinDTO>();
		
		sql= " select rownum rn, join_num, join_id, join_pass, join_name, join_birth1, join_birth2, join_birth3, join_sex, join_nacionalidad, join_ph1, join_ph2, join_ph3, join_email1, join_email2, join_subject, join_intro, join_loc, join_hav, join_inli, join_expe1, join_expe2, join_stulev, join_pre, join_image, LEV, join_register , join_price"
				+ " from( select rownum rn, join_num, join_id, join_pass, join_name, join_birth1, join_birth2, join_birth3, join_sex, join_nacionalidad, join_ph1, join_ph2, join_ph3, join_email1, join_email2, join_subject, join_intro, join_loc, join_hav, join_inli, join_expe1, join_expe2, join_stulev, join_pre, join_image, LEV, join_register, join_price" 
				+ " from( select join_num, join_id, join_pass, join_name, join_birth1, join_birth2, join_birth3, join_sex, join_nacionalidad, join_ph1, join_ph2, join_ph3, join_email1, join_email2, join_subject, join_intro, join_loc, join_hav, join_inli, join_expe1, join_expe2, join_stulev, join_pre, join_image, LEV, join_register, join_price"
				+ " from haeyum_join where LEV = 1)) where rn >= ? and rn <= ? ";
		conn = getConnection();
		int startrow = (page1 -1)* limit +1;
		int endrow = startrow + limit - 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				JoinDTO dto = new JoinDTO();
				dto.setJoinNum(rs.getInt("join_num"));
				dto.setJoinId(rs.getString("join_id"));
				dto.setJoinPass(rs.getString("join_pass"));
				dto.setJoinName(rs.getString("join_name"));
				dto.setJoinBirth1(rs.getInt("join_birth1"));
				dto.setJoinBirth2(rs.getInt("join_birth2"));
				dto.setJoinBirth3(rs.getInt("join_birth3"));
				dto.setJoinSex(rs.getString("join_sex"));
				dto.setJoinNacionalidad(rs.getString("join_nacionalidad"));
				dto.setJoinPh1(rs.getInt("join_ph1"));
				dto.setJoinPh2(rs.getInt("join_ph2"));
				dto.setJoinPh3(rs.getInt("join_ph3"));
				dto.setJoinEmail1(rs.getString("join_email1"));
				dto.setJoinEmail2(rs.getString("join_email2"));
				dto.setJoinSubject(rs.getString("join_subject"));
				dto.setJoinIntro(rs.getString("join_intro"));
				dto.setJoinLoc(rs.getString("join_loc"));
				dto.setJoinHav(rs.getString("join_hav"));
				dto.setJoinInli(rs.getString("join_inli"));
				dto.setJoinExpe1(rs.getString("join_expe1"));
				dto.setJoinExpe2(rs.getString("join_expe2"));
				dto.setJoinStulev(rs.getString("join_stulev"));
				dto.setJoinPre(rs.getString("join_pre"));
				dto.setJoinImage(rs.getString("join_image"));
				dto.setLEV(rs.getInt("LEV"));
				dto.setJoinRegister(rs.getTimestamp("join_register"));
				dto.setJoinPrice(rs.getInt("join_price"));
				
		
				list.add(dto);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt);
		}
		
		return list;
	}
	
	public Integer TeacherCount() { //관리자가 선생님 신청에서 선생님 1차 레벨 선생님을 나타내는것 
		Integer result = 0;
		sql ="select count(*) from haeyum_join where LEV = 1";
		
		conn = getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt("count(*)");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt);
		}
		
		
		return result;
	}
	
	
	public JoinDTO JoinTrue(Integer num) { //관리자가 선생님 신청 1차를 승인 했을 때 사용하는 메소드
		
		conn = getConnection();
		JoinDTO dto = new JoinDTO();
		
		
		conn = getConnection();
		
		try {
			sql="update haeyum_join set LEV = 2 where join_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			
			sql="select join_num, join_id, join_pass, join_name, join_birth1, join_birth2, join_birth3, join_sex, join_nacionalidad, join_ph1, join_ph2, join_ph3, join_email1, join_email2, join_subject, join_intro, join_loc, join_hav, join_inli, join_expe1, join_expe2, join_stulev, join_pre, join_image, LEV, join_register"
					+ " from haeyum_join where LEV = 1";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				dto.setJoinNum(rs.getInt("join_num"));
				dto.setJoinId(rs.getString("join_id"));
				dto.setJoinPass(rs.getString("join_pass"));
				dto.setJoinName(rs.getString("join_name"));
				dto.setJoinBirth1(rs.getInt("join_birth1"));
				dto.setJoinBirth2(rs.getInt("join_birth2"));
				dto.setJoinBirth3(rs.getInt("join_birth3"));
				dto.setJoinSex(rs.getString("join_sex"));
				dto.setJoinNacionalidad(rs.getString("join_nacionalidad"));
				dto.setJoinPh1(rs.getInt("join_ph1"));
				dto.setJoinPh2(rs.getInt("join_ph2"));
				dto.setJoinPh3(rs.getInt("join_ph3"));
				dto.setJoinEmail1(rs.getString("join_email1"));
				dto.setJoinEmail2(rs.getString("join_email2"));
				dto.setJoinSubject(rs.getString("join_subject"));
				dto.setJoinIntro(rs.getString("join_intro"));
				dto.setJoinLoc(rs.getString("join_loc"));
				dto.setJoinHav(rs.getString("join_hav"));
				dto.setJoinInli(rs.getString("join_inli"));
				dto.setJoinExpe1(rs.getString("join_expe1"));
				dto.setJoinExpe2(rs.getString("join_expe2"));
				dto.setJoinStulev(rs.getString("join_stulev"));
				dto.setJoinPre(rs.getString("join_pre"));
				dto.setJoinImage(rs.getString("join_image"));
				dto.setLEV(rs.getInt("LEV"));
				dto.setJoinRegister(rs.getTimestamp("join_register"));
			} 
			}catch(Exception e) {
				e.printStackTrace();
			} finally {
				close(rs, pstmt);
			}
		
		
		return dto;
	}
	
	public JoinDTO JoinFalse(Integer num) { //관리자가 선생님 신청 1차 미승인 버튼을 클릭할때 사용하는 메소드 삭제하고 select 하는
		
		conn = getConnection();
		JoinDTO dto = new JoinDTO();
		
		
		conn = getConnection();
		
		try {
			sql="delete from haeyum_join where join_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			
			sql="select join_num, join_id, join_pass, join_name, join_birth1, join_birth2, join_birth3, join_sex, join_nacionalidad, join_ph1, join_ph2, join_ph3, join_email1, join_email2, join_subject, join_intro, join_loc, join_hav, join_inli, join_expe1, join_expe2, join_stulev, join_pre, join_image, LEV, join_register"
					+ " from haeyum_join where LEV = 1";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				dto.setJoinNum(rs.getInt("join_num"));
				dto.setJoinId(rs.getString("join_id"));
				dto.setJoinPass(rs.getString("join_pass"));
				dto.setJoinName(rs.getString("join_name"));
				dto.setJoinBirth1(rs.getInt("join_birth1"));
				dto.setJoinBirth2(rs.getInt("join_birth2"));
				dto.setJoinBirth3(rs.getInt("join_birth3"));
				dto.setJoinSex(rs.getString("join_sex"));
				dto.setJoinNacionalidad(rs.getString("join_nacionalidad"));
				dto.setJoinPh1(rs.getInt("join_ph1"));
				dto.setJoinPh2(rs.getInt("join_ph2"));
				dto.setJoinPh3(rs.getInt("join_ph3"));
				dto.setJoinEmail1(rs.getString("join_email1"));
				dto.setJoinEmail2(rs.getString("join_email2"));
				dto.setJoinSubject(rs.getString("join_subject"));
				dto.setJoinIntro(rs.getString("join_intro"));
				dto.setJoinLoc(rs.getString("join_loc"));
				dto.setJoinHav(rs.getString("join_hav"));
				dto.setJoinInli(rs.getString("join_inli"));
				dto.setJoinExpe1(rs.getString("join_expe1"));
				dto.setJoinExpe2(rs.getString("join_expe2"));
				dto.setJoinStulev(rs.getString("join_stulev"));
				dto.setJoinPre(rs.getString("join_pre"));
				dto.setJoinImage(rs.getString("join_image"));
				dto.setLEV(rs.getInt("LEV"));
				dto.setJoinRegister(rs.getTimestamp("join_register"));
			} 
			}catch(Exception e) {
				e.printStackTrace();
			} finally {
				close(rs, pstmt);
			}
		
		
		return dto;
	}
	
	public JoinDTO select() { //이메일 전송하기 위해서 이메일 확인하는 곳.
		JoinDTO dto = new JoinDTO();
		sql = "select join_email1, join_email2 from haeyum_join";
		conn = getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto.setJoinEmail1(rs.getString("join_email1"));
				dto.setJoinEmail2(rs.getString("join_email2"));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt);
		}
		
		
		return dto;
	}
	
	
	public List<JoinDTO> SelectListTwo(int page, int limit) { // 페이징기법으로 나타내고 선생님의 목록이 레벨 2인것 
		
		List<JoinDTO> list = new ArrayList<JoinDTO>();
		
		sql= " select rownum rn, join_num, join_id, join_pass, join_name, join_birth1, join_birth2, join_birth3, join_sex, join_nacionalidad, join_ph1, join_ph2, join_ph3, join_email1, join_email2, join_subject, join_intro, join_loc, join_hav, join_inli, join_expe1, join_expe2, join_stulev, join_pre, join_image, LEV, join_register, join_file, join_price "
				+ " from( select rownum rn, join_num, join_id, join_pass, join_name, join_birth1, join_birth2, join_birth3, join_sex, join_nacionalidad, join_ph1, join_ph2, join_ph3, join_email1, join_email2, join_subject, join_intro, join_loc, join_hav, join_inli, join_expe1, join_expe2, join_stulev, join_pre, join_image, LEV, join_register, join_file, join_price " 
				+ " from( select join_num, join_id, join_pass, join_name, join_birth1, join_birth2, join_birth3, join_sex, join_nacionalidad, join_ph1, join_ph2, join_ph3, join_email1, join_email2, join_subject, join_intro, join_loc, join_hav, join_inli, join_expe1, join_expe2, join_stulev, join_pre, join_image, LEV, join_register, join_file, join_price "
				+ " from haeyum_join where LEV = 2)) where rn >= ? and rn <= ? ";
		conn = getConnection();
		int startrow = (page -1)* limit +1;
		int endrow = startrow + limit - 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				JoinDTO dto = new JoinDTO();
				dto.setJoinNum(rs.getInt("join_num"));
				dto.setJoinId(rs.getString("join_id"));
				dto.setJoinPass(rs.getString("join_pass"));
				dto.setJoinName(rs.getString("join_name"));
				dto.setJoinBirth1(rs.getInt("join_birth1"));
				dto.setJoinBirth2(rs.getInt("join_birth2"));
				dto.setJoinBirth3(rs.getInt("join_birth3"));
				dto.setJoinSex(rs.getString("join_sex"));
				dto.setJoinNacionalidad(rs.getString("join_nacionalidad"));
				dto.setJoinPh1(rs.getInt("join_ph1"));
				dto.setJoinPh2(rs.getInt("join_ph2"));
				dto.setJoinPh3(rs.getInt("join_ph3"));
				dto.setJoinEmail1(rs.getString("join_email1"));
				dto.setJoinEmail2(rs.getString("join_email2"));
				dto.setJoinSubject(rs.getString("join_subject"));
				dto.setJoinIntro(rs.getString("join_intro"));
				dto.setJoinLoc(rs.getString("join_loc"));
				dto.setJoinHav(rs.getString("join_hav"));
				dto.setJoinInli(rs.getString("join_inli"));
				dto.setJoinExpe1(rs.getString("join_expe1"));
				dto.setJoinExpe2(rs.getString("join_expe2"));
				dto.setJoinStulev(rs.getString("join_stulev"));
				dto.setJoinPre(rs.getString("join_pre"));
				dto.setJoinImage(rs.getString("join_image"));
				dto.setLEV(rs.getInt("LEV"));
				dto.setJoinRegister(rs.getTimestamp("join_register"));
				dto.setJoinFile(rs.getString("join_file"));
				dto.setJoinPrice(rs.getInt("join_price"));
				
		
				list.add(dto);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt);
		}
		
		return list;
	}

	public Integer TeacherCountTwo() { //관리자가 선생님 신청에서 선생님 2차 레벨 선생님을 나타내는것 
	Integer result = 0;
	sql ="select count(*) from haeyum_join where LEV = 2";
	
	conn = getConnection();
	
	try {
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			result = rs.getInt("count(*)");
		}
		
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		close(rs, pstmt);
	}
	
	
	return result;
}


	public JoinDTO JoinTrueTwo(Integer num) { //관리자가 선생님 신청 1차를 승인 했을 때 사용하는 메소드
		
		conn = getConnection();
		JoinDTO dto = new JoinDTO();
		
		
		conn = getConnection();
		
		try {
			sql="update haeyum_join set LEV = 3 where join_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			
			sql="select join_num, join_id, join_pass, join_name, join_birth1, join_birth2, join_birth3, join_sex, join_nacionalidad, join_ph1, join_ph2, join_ph3, join_email1, join_email2, join_subject, join_intro, join_loc, join_hav, join_inli, join_expe1, join_expe2, join_stulev, join_pre, join_image, LEV, join_register"
					+ " from haeyum_join where LEV = 2";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				dto.setJoinNum(rs.getInt("join_num"));
				dto.setJoinId(rs.getString("join_id"));
				dto.setJoinPass(rs.getString("join_pass"));
				dto.setJoinName(rs.getString("join_name"));
				dto.setJoinBirth1(rs.getInt("join_birth1"));
				dto.setJoinBirth2(rs.getInt("join_birth2"));
				dto.setJoinBirth3(rs.getInt("join_birth3"));
				dto.setJoinSex(rs.getString("join_sex"));
				dto.setJoinNacionalidad(rs.getString("join_nacionalidad"));
				dto.setJoinPh1(rs.getInt("join_ph1"));
				dto.setJoinPh2(rs.getInt("join_ph2"));
				dto.setJoinPh3(rs.getInt("join_ph3"));
				dto.setJoinEmail1(rs.getString("join_email1"));
				dto.setJoinEmail2(rs.getString("join_email2"));
				dto.setJoinSubject(rs.getString("join_subject"));
				dto.setJoinIntro(rs.getString("join_intro"));
				dto.setJoinLoc(rs.getString("join_loc"));
				dto.setJoinHav(rs.getString("join_hav"));
				dto.setJoinInli(rs.getString("join_inli"));
				dto.setJoinExpe1(rs.getString("join_expe1"));
				dto.setJoinExpe2(rs.getString("join_expe2"));
				dto.setJoinStulev(rs.getString("join_stulev"));
				dto.setJoinPre(rs.getString("join_pre"));
				dto.setJoinImage(rs.getString("join_image"));
				dto.setLEV(rs.getInt("LEV"));
				dto.setJoinRegister(rs.getTimestamp("join_register"));
			} 
			}catch(Exception e) {
				e.printStackTrace();
			} finally {
				close(rs, pstmt);
			}
		
		
		return dto;
	}
	
	public JoinDTO JoinFalseTwo(Integer num) { //관리자가 선생님 신청 1차 미승인 버튼을 클릭할때 사용하는 메소드 삭제하고 select 하는
		
		conn = getConnection();
		JoinDTO dto = new JoinDTO();
		
		
		conn = getConnection();
		
		try {
			sql="delete from haeyum_join where join_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			
			
			sql="select join_num, join_id, join_pass, join_name, join_birth1, join_birth2, join_birth3, join_sex, join_nacionalidad, join_ph1, join_ph2, join_ph3, join_email1, join_email2, join_subject, join_intro, join_loc, join_hav, join_inli, join_expe1, join_expe2, join_stulev, join_pre, join_image, LEV, join_register, join_file"
					+ " from haeyum_join where LEV = 2";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				dto.setJoinNum(rs.getInt("join_num"));
				dto.setJoinId(rs.getString("join_id"));
				dto.setJoinPass(rs.getString("join_pass"));
				dto.setJoinName(rs.getString("join_name"));
				dto.setJoinBirth1(rs.getInt("join_birth1"));
				dto.setJoinBirth2(rs.getInt("join_birth2"));
				dto.setJoinBirth3(rs.getInt("join_birth3"));
				dto.setJoinSex(rs.getString("join_sex"));
				dto.setJoinNacionalidad(rs.getString("join_nacionalidad"));
				dto.setJoinPh1(rs.getInt("join_ph1"));
				dto.setJoinPh2(rs.getInt("join_ph2"));
				dto.setJoinPh3(rs.getInt("join_ph3"));
				dto.setJoinEmail1(rs.getString("join_email1"));
				dto.setJoinEmail2(rs.getString("join_email2"));
				dto.setJoinSubject(rs.getString("join_subject"));
				dto.setJoinIntro(rs.getString("join_intro"));
				dto.setJoinLoc(rs.getString("join_loc"));
				dto.setJoinHav(rs.getString("join_hav"));
				dto.setJoinInli(rs.getString("join_inli"));
				dto.setJoinExpe1(rs.getString("join_expe1"));
				dto.setJoinExpe2(rs.getString("join_expe2"));
				dto.setJoinStulev(rs.getString("join_stulev"));
				dto.setJoinPre(rs.getString("join_pre"));
				dto.setJoinImage(rs.getString("join_image"));
				dto.setLEV(rs.getInt("LEV"));
				dto.setJoinRegister(rs.getTimestamp("join_register"));
				dto.setJoinFile(rs.getString("join_file"));
			} 
			}catch(Exception e) {
				e.printStackTrace();
			} finally {
				close(rs, pstmt);
			}
		
		
		return dto;
	}
	
	public JoinDTO sele(String JoinId) { // 각 메인페이지에 값을 전달하기 위해서(ex 로그인 시 각 페이지에 값을 넘김 )
		JoinDTO dto = new JoinDTO();
		conn = getConnection();
		sql ="select join_num from haeyum_join where join_id = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, JoinId);
		
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto.setJoinNum(rs.getInt("join_num"));

				
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs, pstmt);
		}
		
		return dto;
	}
	
	
	public JoinDTO selea(Integer num1) { //각 메인페이지에서 상세보기를 위해서 값을 전달하기 위해서 사용하는거 요거는... 스크립트 사용했음.
		JoinDTO dto = new JoinDTO();
		conn = getConnection();
		sql ="select join_num from haeyum_join where join_num = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num1);
		
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto.setJoinNum(rs.getInt("join_num"));
				
				
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs, pstmt);
		}
		
		return dto;
	}
	
	
	public JoinDTO TeacherDetail(Integer joinNum1) { //마이페이지에서 기본 정보를 출력하기 위한 값
		JoinDTO dto = new JoinDTO();
		conn = getConnection();
		sql = "select join_num, join_id, join_pass, join_name, join_birth1, join_birth2, join_birth3, join_sex, join_nacionalidad, join_ph1, join_ph2, join_ph3, join_email1, join_email2, join_subject, join_intro, join_loc, join_hav, join_inli, join_expe1, join_expe2, join_stulev, join_pre, join_image, LEV, join_register, join_file, join_price from haeyum_join where join_num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, joinNum1);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				dto.setJoinNum(rs.getInt("join_num"));
				dto.setJoinId(rs.getString("join_id"));
				dto.setJoinPass(rs.getString("join_pass"));
				dto.setJoinName(rs.getString("join_name"));
				dto.setJoinBirth1(rs.getInt("join_birth1"));
				dto.setJoinBirth2(rs.getInt("join_birth2"));
				dto.setJoinBirth3(rs.getInt("join_birth3"));
				dto.setJoinSex(rs.getString("join_sex"));
				dto.setJoinNacionalidad(rs.getString("join_nacionalidad"));
				dto.setJoinPh1(rs.getInt("join_ph1"));
				dto.setJoinPh2(rs.getInt("join_ph2"));
				dto.setJoinPh3(rs.getInt("join_ph3"));
				dto.setJoinEmail1(rs.getString("join_email1"));
				dto.setJoinEmail2(rs.getString("join_email2"));
				dto.setJoinSubject(rs.getString("join_subject"));
				dto.setJoinIntro(rs.getString("join_intro"));
				dto.setJoinLoc(rs.getString("join_loc"));
				dto.setJoinHav(rs.getString("join_hav"));
				dto.setJoinInli(rs.getString("join_inli"));
				dto.setJoinExpe1(rs.getString("join_expe1"));
				dto.setJoinExpe2(rs.getString("join_expe2"));
				dto.setJoinStulev(rs.getString("join_stulev"));
				dto.setJoinPre(rs.getString("join_pre"));
				dto.setJoinImage(rs.getString("join_image"));
				dto.setLEV(rs.getInt("LEV"));
				dto.setJoinRegister(rs.getTimestamp("join_register"));
				dto.setJoinFile(rs.getString("join_file"));
				dto.setJoinPrice(rs.getInt("join_price"));
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs, pstmt);
		}
		
		
		return dto;
	}

	public Integer TeacherFileInsert(JoinDTO dto) { // 선생님이 2차 서류 제출에 서류 제출버튼을 클릭하면 서류 제출이 완료되는 것.
		
		Integer result = null;
		conn = getConnection();
		sql="update haeyum_join set join_file = ? where join_num = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getJoinFile());
			pstmt.setInt(2, dto.getJoinNum());
			
		result = pstmt.executeUpdate();
			
			
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt);
		}
		
		return result;
	}
	
	
	
	
	public List<JoinDTO> selectListbox(String box1, String box2) { // 메인페이지 검색창에 입력을 하고 출력하지 지역과 과목을 검색하고
		
		List<JoinDTO> list = new ArrayList<JoinDTO>();
		conn = getConnection();
		sql=" select join_num, join_id, join_pass, join_name, join_birth1, join_birth2, join_birth3, join_sex, join_nacionalidad, join_ph1, join_ph2, join_ph3, join_email1, join_email2, join_subject, join_intro, join_loc, join_hav, join_inli, join_expe1, join_expe2, join_stulev, join_pre, join_image, LEV, join_register, join_file, join_price"
				+ " from haeyum_join where join_subject = ? and join_loc = ? and LEV = 3 ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, box1);
			pstmt.setString(2, box2);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				JoinDTO dto = new JoinDTO();
				
				dto.setJoinNum(rs.getInt("join_num"));
				dto.setJoinId(rs.getString("join_id"));
				dto.setJoinPass(rs.getString("join_pass"));
				dto.setJoinName(rs.getString("join_name"));
				dto.setJoinBirth1(rs.getInt("join_birth1"));
				dto.setJoinBirth2(rs.getInt("join_birth2"));
				dto.setJoinBirth3(rs.getInt("join_birth3"));
				dto.setJoinSex(rs.getString("join_sex"));
				dto.setJoinNacionalidad(rs.getString("join_nacionalidad"));
				dto.setJoinPh1(rs.getInt("join_ph1"));
				dto.setJoinPh2(rs.getInt("join_ph2"));
				dto.setJoinPh3(rs.getInt("join_ph3"));
				dto.setJoinEmail1(rs.getString("join_email1"));
				dto.setJoinEmail2(rs.getString("join_email2"));
				dto.setJoinSubject(rs.getString("join_subject"));
				dto.setJoinIntro(rs.getString("join_intro"));
				dto.setJoinLoc(rs.getString("join_loc"));
				dto.setJoinHav(rs.getString("join_hav"));
				dto.setJoinInli(rs.getString("join_inli"));
				dto.setJoinExpe1(rs.getString("join_expe1"));
				dto.setJoinExpe2(rs.getString("join_expe2"));
				dto.setJoinStulev(rs.getString("join_stulev"));
				dto.setJoinPre(rs.getString("join_pre"));
				dto.setJoinImage(rs.getString("join_image"));
				dto.setLEV(rs.getInt("LEV"));
				dto.setJoinRegister(rs.getTimestamp("join_register"));
				dto.setJoinFile(rs.getString("join_file"));
				dto.setJoinPrice(rs.getInt("join_price"));
				
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt);
		}
		
		
		return list;
	}
	
	public List<JoinDTO> selectListSub(String sub) { //메인페이지에서 목록에 나와있는 항목 중 subject 내용을 선택하면 
		
		List<JoinDTO> list = new ArrayList<JoinDTO>();
		conn = getConnection();
		sql=" select join_num, join_id, join_pass, join_name, join_birth1, join_birth2, join_birth3, join_sex, join_nacionalidad, join_ph1, join_ph2, join_ph3, join_email1, join_email2, join_subject, join_intro, join_loc, join_hav, join_inli, join_expe1, join_expe2, join_stulev, join_pre, join_image, LEV, join_register, join_file, join_price"
				+ " from haeyum_join where join_subject = ? and LEV = 3 ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sub);
	
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				JoinDTO dto = new JoinDTO();
				
				dto.setJoinNum(rs.getInt("join_num"));
				dto.setJoinId(rs.getString("join_id"));
				dto.setJoinPass(rs.getString("join_pass"));
				dto.setJoinName(rs.getString("join_name"));
				dto.setJoinBirth1(rs.getInt("join_birth1"));
				dto.setJoinBirth2(rs.getInt("join_birth2"));
				dto.setJoinBirth3(rs.getInt("join_birth3"));
				dto.setJoinSex(rs.getString("join_sex"));
				dto.setJoinNacionalidad(rs.getString("join_nacionalidad"));
				dto.setJoinPh1(rs.getInt("join_ph1"));
				dto.setJoinPh2(rs.getInt("join_ph2"));
				dto.setJoinPh3(rs.getInt("join_ph3"));
				dto.setJoinEmail1(rs.getString("join_email1"));
				dto.setJoinEmail2(rs.getString("join_email2"));
				dto.setJoinSubject(rs.getString("join_subject"));
				dto.setJoinIntro(rs.getString("join_intro"));
				dto.setJoinLoc(rs.getString("join_loc"));
				dto.setJoinHav(rs.getString("join_hav"));
				dto.setJoinInli(rs.getString("join_inli"));
				dto.setJoinExpe1(rs.getString("join_expe1"));
				dto.setJoinExpe2(rs.getString("join_expe2"));
				dto.setJoinStulev(rs.getString("join_stulev"));
				dto.setJoinPre(rs.getString("join_pre"));
				dto.setJoinImage(rs.getString("join_image"));
				dto.setLEV(rs.getInt("LEV"));
				dto.setJoinRegister(rs.getTimestamp("join_register"));
				dto.setJoinFile(rs.getString("join_file"));
				dto.setJoinPrice(rs.getInt("join_price"));
				
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt);
		}
		
		
		return list;
	}
	
	public List<JoinDTO> selectListLoc(String loc) { //메인페이지에서 목록에 나와있는 항목 중 loc 내용을 선택하면 
		
		List<JoinDTO> list = new ArrayList<JoinDTO>();
		conn = getConnection();
		sql=" select join_num, join_id, join_pass, join_name, join_birth1, join_birth2, join_birth3, join_sex, join_nacionalidad, join_ph1, join_ph2, join_ph3, join_email1, join_email2, join_subject, join_intro, join_loc, join_hav, join_inli, join_expe1, join_expe2, join_stulev, join_pre, join_image, LEV, join_register, join_file, join_price"
				+ " from haeyum_join where join_loc = ? and LEV = 3 ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, loc);
	
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				JoinDTO dto = new JoinDTO();
				
				dto.setJoinNum(rs.getInt("join_num"));
				dto.setJoinId(rs.getString("join_id"));
				dto.setJoinPass(rs.getString("join_pass"));
				dto.setJoinName(rs.getString("join_name"));
				dto.setJoinBirth1(rs.getInt("join_birth1"));
				dto.setJoinBirth2(rs.getInt("join_birth2"));
				dto.setJoinBirth3(rs.getInt("join_birth3"));
				dto.setJoinSex(rs.getString("join_sex"));
				dto.setJoinNacionalidad(rs.getString("join_nacionalidad"));
				dto.setJoinPh1(rs.getInt("join_ph1"));
				dto.setJoinPh2(rs.getInt("join_ph2"));
				dto.setJoinPh3(rs.getInt("join_ph3"));
				dto.setJoinEmail1(rs.getString("join_email1"));
				dto.setJoinEmail2(rs.getString("join_email2"));
				dto.setJoinSubject(rs.getString("join_subject"));
				dto.setJoinIntro(rs.getString("join_intro"));
				dto.setJoinLoc(rs.getString("join_loc"));
				dto.setJoinHav(rs.getString("join_hav"));
				dto.setJoinInli(rs.getString("join_inli"));
				dto.setJoinExpe1(rs.getString("join_expe1"));
				dto.setJoinExpe2(rs.getString("join_expe2"));
				dto.setJoinStulev(rs.getString("join_stulev"));
				dto.setJoinPre(rs.getString("join_pre"));
				dto.setJoinImage(rs.getString("join_image"));
				dto.setLEV(rs.getInt("LEV"));
				dto.setJoinRegister(rs.getTimestamp("join_register"));
				dto.setJoinFile(rs.getString("join_file"));
				dto.setJoinPrice(rs.getInt("join_price"));
				
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt);
		}
		
		
		return list;
	}

	public List<JoinDTO> selectListLv(String lv) { //메인페이지에서 목록에 나와있는 항목 중 lv 내용을 선택하면 
	
	List<JoinDTO> list = new ArrayList<JoinDTO>();
	conn = getConnection();
	sql=" select join_num, join_id, join_pass, join_name, join_birth1, join_birth2, join_birth3, join_sex, join_nacionalidad, join_ph1, join_ph2, join_ph3, join_email1, join_email2, join_subject, join_intro, join_loc, join_hav, join_inli, join_expe1, join_expe2, join_stulev, join_pre, join_image, LEV, join_register, join_file, join_price"
			+ " from haeyum_join where join_subject = ? and LEV = 3 ";
	
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, lv);

		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			JoinDTO dto = new JoinDTO();
			
			dto.setJoinNum(rs.getInt("join_num"));
			dto.setJoinId(rs.getString("join_id"));
			dto.setJoinPass(rs.getString("join_pass"));
			dto.setJoinName(rs.getString("join_name"));
			dto.setJoinBirth1(rs.getInt("join_birth1"));
			dto.setJoinBirth2(rs.getInt("join_birth2"));
			dto.setJoinBirth3(rs.getInt("join_birth3"));
			dto.setJoinSex(rs.getString("join_sex"));
			dto.setJoinNacionalidad(rs.getString("join_nacionalidad"));
			dto.setJoinPh1(rs.getInt("join_ph1"));
			dto.setJoinPh2(rs.getInt("join_ph2"));
			dto.setJoinPh3(rs.getInt("join_ph3"));
			dto.setJoinEmail1(rs.getString("join_email1"));
			dto.setJoinEmail2(rs.getString("join_email2"));
			dto.setJoinSubject(rs.getString("join_subject"));
			dto.setJoinIntro(rs.getString("join_intro"));
			dto.setJoinLoc(rs.getString("join_loc"));
			dto.setJoinHav(rs.getString("join_hav"));
			dto.setJoinInli(rs.getString("join_inli"));
			dto.setJoinExpe1(rs.getString("join_expe1"));
			dto.setJoinExpe2(rs.getString("join_expe2"));
			dto.setJoinStulev(rs.getString("join_stulev"));
			dto.setJoinPre(rs.getString("join_pre"));
			dto.setJoinImage(rs.getString("join_image"));
			dto.setLEV(rs.getInt("LEV"));
			dto.setJoinRegister(rs.getTimestamp("join_register"));
			dto.setJoinFile(rs.getString("join_file"));
			dto.setJoinPrice(rs.getInt("join_price"));
			
			list.add(dto);
		}
	}catch(Exception e) {
		e.printStackTrace();
	} finally {
		close(rs, pstmt);
	}
	
	
	return list;
}
	
	public JoinDTO PwCheckFind(String pw) {	//비밀번호 받아오기
		conn = getConnection();
		sql="select join_pass from haeyum_join where join_pass = ?";
		JoinDTO dto = new JoinDTO();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			rs = pstmt.executeQuery();
				
				if(rs.next()) {
					dto.setJoinPass(rs.getString("join_pass"));
				}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt);
		}
	
		return dto;
	}
	
	public Integer CheckPass(String StuPw, String StuId) { // 학생 비밀번호 확인 (정보 수정을 위한 ) 
		
		conn = getConnection();
		JoinDTO dto = new JoinDTO();
		Integer result = null;
		String dbStuPw = null;
		
		sql="select join_pass from haeyum_join where join_id = ?";
		 		 
		 try {
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, StuId);
			 rs=pstmt.executeQuery();
			 
				 if(rs.next()) {
					 dbStuPw= rs.getString(1);
					 
					 if(StuPw.equals(dbStuPw)) {
						 result = 1;
					 } else {
						 result = 0;
					 }
				 }
		}catch (Exception e) {
			e.printStackTrace();
	   } finally {
	       close(rs, pstmt);
	   }
	 return result; 
	 }
	
	
	public JoinDTO StuShow(String ID) {
		conn = getConnection();
		JoinDTO dto = new JoinDTO();
		
		sql="select join_num, join_id, join_name, join_birth1, join_birth2, join_birth3, join_sex, join_nacionalidad, join_ph1, join_ph2, join_ph3, join_email1, join_email2, join_subject, join_intro, join_loc, join_hav, join_inli, join_expe1, join_expe2, join_stulev, join_pre, join_image, join_register, join_file, join_price from haeyum_join where join_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, ID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setJoinNum(rs.getInt("join_num"));
				dto.setJoinId(rs.getString("join_id"));
			
				dto.setJoinName(rs.getString("join_name"));
				dto.setJoinBirth1(rs.getInt("join_birth1"));
				dto.setJoinBirth2(rs.getInt("join_birth2"));
				dto.setJoinBirth3(rs.getInt("join_birth3"));
				dto.setJoinSex(rs.getString("join_sex"));
				dto.setJoinNacionalidad(rs.getString("join_nacionalidad"));
				dto.setJoinPh1(rs.getInt("join_ph1"));
				dto.setJoinPh2(rs.getInt("join_ph2"));
				dto.setJoinPh3(rs.getInt("join_ph3"));
				dto.setJoinEmail1(rs.getString("join_email1"));
				dto.setJoinEmail2(rs.getString("join_email2"));
				dto.setJoinSubject(rs.getString("join_subject"));
				dto.setJoinIntro(rs.getString("join_intro"));
				dto.setJoinLoc(rs.getString("join_loc"));
				dto.setJoinHav(rs.getString("join_hav"));
				dto.setJoinInli(rs.getString("join_inli"));
				dto.setJoinExpe1(rs.getString("join_expe1"));
				dto.setJoinExpe2(rs.getString("join_expe2"));
				dto.setJoinStulev(rs.getString("join_stulev"));
				dto.setJoinPre(rs.getString("join_pre"));
				dto.setJoinImage(rs.getString("join_image"));

				dto.setJoinRegister(rs.getTimestamp("join_register"));
				dto.setJoinFile(rs.getString("join_file"));
				dto.setJoinPrice(rs.getInt("join_price"));
			}
			
		}catch(Exception e) {
			
		}finally {
			close(rs, pstmt);
		}
		return dto;
	}
	
	
	
	public Integer StuModi(JoinDTO dto) {
		conn = getConnection();
		sql="update haeyum_join set join_name=?, join_email1=?, join_email2=?, join_addr1=?, join_addr2=?, join_addr3=?, join_ph1=?, join_ph2=?, join_ph3=? where join_id = ?";
		Integer result = null;
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getJoinName());
			pstmt.setString(2, dto.getJoinEmail1());
			pstmt.setString(3, dto.getJoinEmail2());
			pstmt.setString(4, dto.getJoinAddr1());
			pstmt.setString(5, dto.getJoinAddr2());
			pstmt.setString(6, dto.getJoinAddr3());
			pstmt.setInt(7, dto.getJoinPh1());
			pstmt.setInt(8, dto.getJoinPh2());
			pstmt.setInt(9, dto.getJoinPh3());
			pstmt.setString(10, dto.getJoinId());
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt);
		}
		return result;
	}
	
	
	public Integer accountDel(String Pw, String DelId) {
		conn= getConnection();
		Integer result = null;
		
		sql="delete haeyum_join where join_id = ? and join_pass = ?";
			try{
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, DelId);
				pstmt.setString(2, Pw);

				System.out.println(DelId + Pw);
				
				result = pstmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close(rs, pstmt);
			}
		return result;
	}
	
	public JoinDTO StuMaP(Integer num1) {	//학생 회원 정보
		conn= getConnection();
		JoinDTO dto = new JoinDTO();
		
		sql="select join_name, join_id, join_Birth1, join_birth2, join_birth3, join_sex, join_email1, join_email2, join_addr1, join_addr2, join_addr3, join_nacionalidad, join_ph1, join_ph2, join_ph3"
						+ " from haeyum_join where join_num = ?";
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num1);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto.setJoinName(rs.getString("join_name"));
				dto.setJoinId(rs.getString("join_Id"));
				dto.setJoinBirth1(Integer.parseInt(rs.getString("join_Birth1")));
				dto.setJoinBirth2(Integer.parseInt(rs.getString("join_Birth2")));
				dto.setJoinBirth3(Integer.parseInt(rs.getString("join_Birth3")));
				dto.setJoinSex(rs.getString("join_sex"));
				dto.setJoinEmail1(rs.getString("join_email1"));				
				dto.setJoinEmail2(rs.getString("join_email2"));
				dto.setJoinAddr1(rs.getString("join_addr1"));
				dto.setJoinAddr2(rs.getString("join_addr2"));
				dto.setJoinAddr3(rs.getString("join_addr3"));
				dto.setJoinNacionalidad(rs.getString("join_nacionalidad"));
				dto.setJoinPh1(Integer.parseInt(rs.getString("join_ph1")));
				dto.setJoinPh2(Integer.parseInt(rs.getString("join_ph2")));
				dto.setJoinPh3(Integer.parseInt(rs.getString("join_ph3")));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt);
		}
		return dto;
	}
	
	
	public List<JoinDTO> selectListMain() { //메인페이지에서 목록에 나와있는 항목 중 loc 내용을 선택하면 
		
		List<JoinDTO> list = new ArrayList<JoinDTO>();
		conn = getConnection();
		sql=" select join_num, join_id, join_pass, join_name, join_birth1, join_birth2, join_birth3, join_sex, join_nacionalidad, join_ph1, join_ph2, join_ph3, join_email1, join_email2, join_subject, join_intro, join_loc, join_hav, join_inli, join_expe1, join_expe2, join_stulev, join_pre, join_image, LEV, join_register, join_file, join_price"
				+ " from haeyum_join where LEV = 3 ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
	
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				JoinDTO dto = new JoinDTO();
				
				dto.setJoinNum(rs.getInt("join_num"));
				dto.setJoinId(rs.getString("join_id"));
				dto.setJoinPass(rs.getString("join_pass"));
				dto.setJoinName(rs.getString("join_name"));
				dto.setJoinBirth1(rs.getInt("join_birth1"));
				dto.setJoinBirth2(rs.getInt("join_birth2"));
				dto.setJoinBirth3(rs.getInt("join_birth3"));
				dto.setJoinSex(rs.getString("join_sex"));
				dto.setJoinNacionalidad(rs.getString("join_nacionalidad"));
				dto.setJoinPh1(rs.getInt("join_ph1"));
				dto.setJoinPh2(rs.getInt("join_ph2"));
				dto.setJoinPh3(rs.getInt("join_ph3"));
				dto.setJoinEmail1(rs.getString("join_email1"));
				dto.setJoinEmail2(rs.getString("join_email2"));
				dto.setJoinSubject(rs.getString("join_subject"));
				dto.setJoinIntro(rs.getString("join_intro"));
				dto.setJoinLoc(rs.getString("join_loc"));
				dto.setJoinHav(rs.getString("join_hav"));
				dto.setJoinInli(rs.getString("join_inli"));
				dto.setJoinExpe1(rs.getString("join_expe1"));
				dto.setJoinExpe2(rs.getString("join_expe2"));
				dto.setJoinStulev(rs.getString("join_stulev"));
				dto.setJoinPre(rs.getString("join_pre"));
				dto.setJoinImage(rs.getString("join_image"));
				dto.setLEV(rs.getInt("LEV"));
				dto.setJoinRegister(rs.getTimestamp("join_register"));
				dto.setJoinFile(rs.getString("join_file"));
				dto.setJoinPrice(rs.getInt("join_price"));
				
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt);
		}
		
		
		return list;
	}
	
	
	
	public Integer TeacherModiy(JoinDTO dto) { // 선생님 마이페이지에서 수정을 하기 위해서 만들었습니다.
		conn = getConnection();
		sql="update haeyum_join set join_name = ?, join_birth1 = ?, join_birth2 = ?, join_birth3 = ?,  join_ph1 = ?, join_ph2 = ?, join_ph3 = ?, join_email1 = ?, join_email2 = ?, join_subject = ?, join_intro = ?, join_loc = ?, join_hav = ?, join_inli = ?, join_expe1 = ?, join_expe2 = ?, join_stulev = ?, join_pre = ?, join_image = ?, join_price = ? where join_id = ?";
		Integer result = null;
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getJoinName());
			pstmt.setInt(2, dto.getJoinBirth1());
			pstmt.setInt(3, dto.getJoinBirth2());
			pstmt.setInt(4, dto.getJoinBirth3());


			pstmt.setInt(5, dto.getJoinPh1());
			pstmt.setInt(6, dto.getJoinPh2());
			pstmt.setInt(7, dto.getJoinPh3());
			pstmt.setString(8, dto.getJoinEmail1());
			pstmt.setString(9, dto.getJoinEmail2());
			pstmt.setString(10, dto.getJoinSubject());
			pstmt.setString(11, dto.getJoinIntro());
			pstmt.setString(12, dto.getJoinLoc());
			pstmt.setString(13, dto.getJoinHav());
			pstmt.setString(14, dto.getJoinInli());
			pstmt.setString(15, dto.getJoinExpe1());
			pstmt.setString(16, dto.getJoinExpe2());
			pstmt.setString(17, dto.getJoinStulev());
			pstmt.setString(18, dto.getJoinPre());
			pstmt.setString(19, dto.getJoinImage());
			pstmt.setInt(20, dto.getJoinPrice());
			pstmt.setString(21, dto.getJoinId());
			
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt);
		}
		return result;
	}
		
	
	public List<JoinDTO> StuList(int page, int limit) { // 회원 조회에서 회원의 정보를 얻고자 할때
		List<JoinDTO> list = new ArrayList<JoinDTO>();
		sql= " select rownum rn, join_num, join_id, join_pass, join_name, join_birth1, join_birth2, join_birth3, join_sex, join_nacionalidad, join_ph1, join_ph2, join_ph3, join_email1, join_email2, join_addr1, join_addr2, join_addr3, LEV, join_register"
				+ " from( select rownum rn, join_num, join_id, join_pass, join_name, join_birth1, join_birth2, join_birth3, join_sex, join_nacionalidad, join_ph1, join_ph2, join_ph3, join_email1, join_email2, join_addr1, join_addr2, join_addr3, LEV, join_register"
				+ " from( select join_num, join_id, join_pass, join_name, join_birth1, join_birth2, join_birth3, join_sex, join_nacionalidad, join_ph1, join_ph2, join_ph3, join_email1, join_email2, join_addr1, join_addr2, join_addr3, LEV, join_register"
				+ " from haeyum_join where lev=0)) where rn >= ? and rn <= ? ";
		conn = getConnection();
		int startrow = (page -1)* limit +1;
		int endrow = startrow + limit - 1;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				JoinDTO dto = new JoinDTO();
				dto.setJoinNum(rs.getInt("join_num"));
				dto.setJoinId(rs.getString("join_id"));
				dto.setJoinPass(rs.getString("join_pass"));
				dto.setJoinName(rs.getString("join_name"));
				dto.setJoinBirth1(rs.getInt("join_birth1"));
				dto.setJoinBirth2(rs.getInt("join_birth2"));
				dto.setJoinBirth3(rs.getInt("join_birth3"));
				dto.setJoinSex(rs.getString("join_sex"));
				dto.setJoinNacionalidad(rs.getString("join_nacionalidad"));
				dto.setJoinPh1(rs.getInt("join_ph1"));
				dto.setJoinPh2(rs.getInt("join_ph2"));
				dto.setJoinPh3(rs.getInt("join_ph3"));
				dto.setJoinEmail1(rs.getString("join_email1"));
				dto.setJoinEmail2(rs.getString("join_email2"));
				dto.setJoinAddr1(rs.getString("join_addr1"));
				dto.setJoinAddr2(rs.getString("join_addr2"));
				dto.setJoinAddr3(rs.getString("join_addr3"));
				dto.setLEV(rs.getInt("LEV"));
				dto.setJoinRegister(rs.getTimestamp("join_register"));
				
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt);
		}
		
		
		
		return list;
	}
	
	public Integer StuCount() { // 관리자가 학생 수를 알기 위해서
		Integer result = 0;
		sql ="select count(*) from haeyum_join where LEV = 0";
		
		conn = getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt("count(*)");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt);
		}
		
		
		return result;
	}
	
	
 public List<JoinDTO> SelectListThe(int page1, int limit) { // 그리고 메인페이지에서 선생님 목록을 가져오기 위해서 사용했어 .., 관리자가 선생님 리스트 가져오기 위해서
		
		List<JoinDTO> list = new ArrayList<JoinDTO>();
		
		sql= " select rownum rn, join_num, join_id, join_pass, join_name, join_birth1, join_birth2, join_birth3, join_sex, join_nacionalidad, join_ph1, join_ph2, join_ph3, join_email1, join_email2, join_subject, join_intro, join_loc, join_hav, join_inli, join_expe1, join_expe2, join_stulev, join_pre, join_image, LEV, join_register , join_price"
				+ " from( select rownum rn, join_num, join_id, join_pass, join_name, join_birth1, join_birth2, join_birth3, join_sex, join_nacionalidad, join_ph1, join_ph2, join_ph3, join_email1, join_email2, join_subject, join_intro, join_loc, join_hav, join_inli, join_expe1, join_expe2, join_stulev, join_pre, join_image, LEV, join_register, join_price" 
				+ " from( select join_num, join_id, join_pass, join_name, join_birth1, join_birth2, join_birth3, join_sex, join_nacionalidad, join_ph1, join_ph2, join_ph3, join_email1, join_email2, join_subject, join_intro, join_loc, join_hav, join_inli, join_expe1, join_expe2, join_stulev, join_pre, join_image, LEV, join_register, join_price"
				+ " from haeyum_join where LEV = 3)) where rn >= ? and rn <= ? ";
		conn = getConnection();
		int startrow = (page1 -1)* limit +1;
		int endrow = startrow + limit - 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				JoinDTO dto = new JoinDTO();
				dto.setJoinNum(rs.getInt("join_num"));
				dto.setJoinId(rs.getString("join_id"));
				dto.setJoinPass(rs.getString("join_pass"));
				dto.setJoinName(rs.getString("join_name"));
				dto.setJoinBirth1(rs.getInt("join_birth1"));
				dto.setJoinBirth2(rs.getInt("join_birth2"));
				dto.setJoinBirth3(rs.getInt("join_birth3"));
				dto.setJoinSex(rs.getString("join_sex"));
				dto.setJoinNacionalidad(rs.getString("join_nacionalidad"));
				dto.setJoinPh1(rs.getInt("join_ph1"));
				dto.setJoinPh2(rs.getInt("join_ph2"));
				dto.setJoinPh3(rs.getInt("join_ph3"));
				dto.setJoinEmail1(rs.getString("join_email1"));
				dto.setJoinEmail2(rs.getString("join_email2"));
				dto.setJoinSubject(rs.getString("join_subject"));
				dto.setJoinIntro(rs.getString("join_intro"));
				dto.setJoinLoc(rs.getString("join_loc"));
				dto.setJoinHav(rs.getString("join_hav"));
				dto.setJoinInli(rs.getString("join_inli"));
				dto.setJoinExpe1(rs.getString("join_expe1"));
				dto.setJoinExpe2(rs.getString("join_expe2"));
				dto.setJoinStulev(rs.getString("join_stulev"));
				dto.setJoinPre(rs.getString("join_pre"));
				dto.setJoinImage(rs.getString("join_image"));
				dto.setLEV(rs.getInt("LEV"));
				dto.setJoinRegister(rs.getTimestamp("join_register"));
				dto.setJoinPrice(rs.getInt("join_price"));
				
		
				list.add(dto);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt);
		}
		
		return list;
	}

	public void AdminStudelete(Integer num1) { //관리자에서 삭제 확인 버튼을 클릭하면 삭제가 되도록
		
		conn = getConnection();
		sql="delete from haeyum_join where join_num = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num1);
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt);
		}
		
		
	}
	
	
	public Integer AdminTeacherCount() { // 관리자가 선생 수를 알기 위해서
		Integer result = 0;
		sql ="select count(*) from haeyum_join where LEV = 3";
		
		conn = getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt("count(*)");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt);
		}
		
		
		return result;
	}
	
}

	

