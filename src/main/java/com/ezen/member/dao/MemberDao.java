package com.ezen.member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ezen.member.dto.MemberDto;

public class MemberDao {
	
	//싱글턴 코드
	private MemberDao() {}
	private static MemberDao list = new MemberDao();
	public static MemberDao getInstance() { return list; }
	
	//데이터베이스 Access에 필요한 객체 및 변수
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//getConnection과 close
	private Connection getConnection() {
			String url = "jdbc:mysql://database-1.c21qgjfkmmk8.ap-northeast-2.rds.amazonaws.com:3306/membermgr?serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8";
			String id = "admin";
			String password = "ccna1234";
	        try {
	               Class.forName("com.mysql.cj.jdbc.Driver");
	               System.out.println("드라이버 적재 성공");
	               con = DriverManager.getConnection(url, id, password);
	               System.out.println("데이터베이스 연결 성공");
	        } catch (ClassNotFoundException e) {
	               System.out.println("드라이버를 찾을 수 없습니다.");
	        } catch (SQLException e) {
	               System.out.println("연결에 실패하였습니다.");
	        }
	        return con;
	}
	private void close() {
		try {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(con!=null)con.close();
		} catch (SQLException e) { e.printStackTrace(); }
	}
	
	public MemberDto getMember(String userid) {
		MemberDto mdto = null;
		
		String sql = "select * from member where userid=?";
		con = getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				mdto = new MemberDto();
				mdto.setUserid(rs.getString("userid"));
				mdto.setName(rs.getString("name"));
				mdto.setPwd(rs.getString("pwd"));
				mdto.setEmail(rs.getString("email"));
				mdto.setPhone(rs.getString("phone"));
				mdto.setAdmin(rs.getInt("admin"));
			}
		} catch (SQLException e) { e.printStackTrace();
		} finally { close(); }
		
		return mdto;
	}
	public int insertMember(MemberDto mdto) {
		int result = 0;
		String sql = "insert into member(userid,name,pwd,phone,email,admin)"
				+ " values(?,?,?,?,?,?)";
		con = getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mdto.getUserid());
			pstmt.setString(2, mdto.getName());
			pstmt.setString(3, mdto.getPwd());
			pstmt.setString(4, mdto.getPhone());
			pstmt.setString(5, mdto.getEmail());
			pstmt.setInt(6, mdto.getAdmin());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		
		return result;
	}
	public int updateMember(MemberDto mdto) {
		int result = 0;
		String sql = "update member set name=?,pwd=?,phone=?,email=?,admin=?"
				+ " where userid=?";
		con = getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mdto.getName());
			pstmt.setString(2, mdto.getPwd());
			pstmt.setString(3, mdto.getPhone());
			pstmt.setString(4, mdto.getEmail());
			pstmt.setInt(5, mdto.getAdmin());
			pstmt.setString(6, mdto.getUserid());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		
		return result;
	}
	public ArrayList<MemberDto> selectMember() {
		ArrayList<MemberDto> list = new ArrayList<MemberDto>();
		String sql = "select * from member order by admin, userid";
		con = getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDto mdto = new MemberDto();
				mdto.setName(rs.getString("name"));
				mdto.setUserid(rs.getString("userid"));
				mdto.setPwd(rs.getString("pwd"));
				mdto.setEmail(rs.getString("email"));
				mdto.setPhone(rs.getString("phone"));
				mdto.setAdmin(rs.getInt("admin"));
				list.add(mdto); 
			}
		} catch (SQLException e) {e.printStackTrace();
		} finally {close();}
		return list;
	}
	public void editAdmin(String userid, int admin) {
		String sql = "update member set admin=? where userid=?";
		con = getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, admin);
			pstmt.setString(2, userid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
	}
	public void deleteMember(String userid) {
		String sql = "delete from member where userid=?";
		con = getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
	}

}
