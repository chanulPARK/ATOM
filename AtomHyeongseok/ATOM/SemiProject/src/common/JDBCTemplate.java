package common;
import java.io.FileReader;
import java.sql.*;
import java.util.Properties;

public class JDBCTemplate {
	private static Connection conn;
	public static Connection getConnection() {
		Properties prop = new Properties();
		conn = null;
		try {
			String file=JDBCTemplate.class
					.getResource("/common/driver.properties")
					.getPath();
			prop.load(new FileReader(file));
			Class.forName(prop.getProperty("driver"));
			conn = DriverManager
					.getConnection(prop.getProperty("url"),
								   prop.getProperty("user"),
								   prop.getProperty("pwd"));
			conn.setAutoCommit(false);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	};
	
	public static void close(Connection conn) {
		try {
			if(conn!=null && conn.isClosed())
				conn.close();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Statement stmt) {
		try {
			if(stmt!=null && stmt.isClosed())
				stmt.close();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rset) {
		try {
			if(rset!=null && rset.isClosed())
				rset.close();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void commit(Connection conn) {
		try {
			if(conn!=null && conn.isClosed())
				conn.commit();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void rollback(Connection conn) {
		try {
			if(conn!=null && conn.isClosed())
				conn.rollback();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
