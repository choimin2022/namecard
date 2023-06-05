package departDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ezen.member.dao.MemberDao;
import com.ezen.member.dto.MemberDto;

import DBConnect.DBConnect;
import departDAO.Depart_memberDAO;
import departDTO.Depart_memberDTO;

public class Depart_memberDAO {
	//싱글턴 코드
	private Depart_memberDAO() {}
	private static Depart_memberDAO list = new Depart_memberDAO();
	public static Depart_memberDAO getInstance() { return list; }
	
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	

	public Depart_memberDTO getDepart_member(String d_code) {
		Depart_memberDTO departMember = null;
		
		String sql = "select * from depart_member where d_code=?";
		con = DBConnect.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, d_code);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				departMember = new Depart_memberDTO();
				departMember.setD_code(rs.getString("d_code"));
				departMember.setUserid(rs.getString("userid"));
				departMember.setD_name(rs.getString("d_name"));
				departMember.setD_task(rs.getString("d_task"));
				departMember.setD_date(rs.getString("d_date"));
			}
		} catch (SQLException e) { e.printStackTrace();
		} finally { DBConnect.close(); }
		
		return departMember;
	}
	public int insertDepart_Member(Depart_memberDTO mdto) {
		int result = 0;
		String sql = "insert into depart_member(userid,d_name,d_task)"
				+ " values(?,?,?)";
		con = DBConnect.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mdto.getUserid());
			pstmt.setString(2, mdto.getD_name());
			pstmt.setString(3, mdto.getD_task());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {  DBConnect.close(); }
		
		return result;
	}

}
