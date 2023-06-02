package DBConnect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnect {
	private static Connection con = null;
	private static PreparedStatement pstmt = null;
	private static ResultSet rs = null;

	
	public static Connection getConnection() {
		String url = "jdbc:mysql://database-1.c21qgjfkmmk8.ap-northeast-2.rds.amazonaws.com:3306/membermgr?serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8";
		String id = "admin";
		String password = "ccna1234";
        try {
               Class.forName("com.mysql.cj.jdbc.Driver");
               con = DriverManager.getConnection(url, id, password);

        } catch (ClassNotFoundException e) {
               System.out.println("드라이버를 찾을 수 없습니다.");
        } catch (SQLException e) {
               System.out.println("연결에 실패하였습니다.");
        }
        return con;
	}
	private static void close() {
		try {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(con!=null)con.close();
		} catch (SQLException e) { e.printStackTrace(); }
	}
	
}
