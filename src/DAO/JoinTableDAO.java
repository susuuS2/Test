package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DTO.JoinTableDTO;

public class JoinTableDAO {

	
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
	
	public void TeacherInsert(JoinTableDTO dto) { //문의하기 글을 DB에 저장하기 위해서(선생님)
		
		conn = getConnection();
		sql="insert into haeyum_table(join_num, join_name, join_subject, join_title, join_content, join_re_ref, join_re_lev, join_re_seq, join_readcount, join_date)"
				+ " values(nvl((select max(join_num)+1 from haeyum_table ),1)," +  "'선생님'" + ", ?, ?, ?, 0, 0, 0, 0, SYSDATE)";
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getJoinSubject());
			pstmt.setString(2, dto.getJoinTitle());
			pstmt.setString(3, dto.getJoinContent());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt);
		}
	}
	
	public void JoinInsert(JoinTableDTO dto) { //문의하기 글을 DB에 저장하기 위해서(선생님)
		
		conn = getConnection();
		sql="insert into haeyum_table(join_num, join_name, join_subject, join_title, join_content, join_re_ref, join_re_lev, join_re_seq, join_readcount, join_date)"
				+ " values(nvl((select max(join_num)+1 from haeyum_table ),1)," +  "'학생'" + ", ?, ?, ?, 0, 0, 0, 0, SYSDATE)";
		System.out.println("\n");
		System.out.println(sql);
		System.out.println("\n");
		
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getJoinSubject());
			pstmt.setString(2, dto.getJoinTitle());
			pstmt.setString(3, dto.getJoinContent());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt);
		}
	}
	
	public Integer Count() { //얘가 왜안나와
		Integer result = 0;
		sql ="select count(*) from haeyum_table";
		
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
	
	public List<JoinTableDTO> SelectList(int page1, int limit) {
		List<JoinTableDTO> list = new ArrayList<JoinTableDTO>();
		
		sql=" select rownum rn, join_num, join_name, join_subject, join_title, join_content, join_re_ref, join_re_lev, join_re_seq, join_readcount, join_date"
				+ " from(select rownum rn, join_num, join_name, join_subject, join_title, join_content, join_re_ref, join_re_lev, join_re_seq, join_readcount, join_date"
				+ " from(select join_num, join_name, join_subject, join_title, join_content, join_re_ref, join_re_lev, join_re_seq, join_readcount, join_date from haeyum_table)) where rn >= ? and rn <= ? ";
		conn = getConnection();
		int startrow = (page1 -1)* limit +1;
		int endrow = startrow + limit - 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				JoinTableDTO dto = new JoinTableDTO();
				dto.setJoinNum(rs.getInt("join_num"));
				dto.setJoinName(rs.getString("join_name"));
				dto.setJoinSubject(rs.getString("join_subject"));
				dto.setJoinTitle(rs.getString("join_title"));
				dto.setJoinContent(rs.getString("join_content"));
				dto.setJoinReRef(rs.getInt("join_re_ref"));
				dto.setJoinReLev(rs.getInt("join_re_lev"));
				dto.setJoinReSeq(rs.getInt("join_re_seq"));
				dto.setJoinReadcount(rs.getInt("join_readcount"));
				dto.setJoinDate(rs.getTimestamp("join_date"));
				
				list.add(dto);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt);
		}
		
		return list;
		
	}
}
