package atom.electronic.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import atom.calendar.model.dao.CalendarDAO;
import atom.calendar.model.vo.Calendar;
import atom.electronic.model.vo.ElectronicApproval;

public class ElectronicDAO {

	private Properties prop;
	public ElectronicDAO() {
		prop = new Properties();
		try {
			String file = CalendarDAO.class.getResource("/sql/electronic/Electronic-sql.properties").getPath();
			prop.load(new FileReader(file));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int insertApproval(Connection conn, ElectronicApproval ea) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertApproval");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ea.getDraftNo());
			pstmt.setDate(2, new java.sql.Date(ea.getDraftDate().getTime()));
			pstmt.setString(3, ea.getEmpId());
			pstmt.setString(4, ea.getDraftDept());
			pstmt.setString(5, ea.getDraftName());
			pstmt.setString(6, ea.getDraftContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(pstmt);
		
		return result;
	}

}
