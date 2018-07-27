package atom.employee.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import atom.employee.model.vo.Employee;

import static common.JDBCTemplate.*;

public class EmployeeDAO {
	private Properties prop;
	public EmployeeDAO() {
		prop=new Properties();
		try {
			String file=EmployeeDAO.class.getResource("/sql/employee-sql.properties").getPath();
			prop.load(new FileReader(file));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}

	public Employee selectOne(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Employee e = null;
		String sql = prop.getProperty("selectOne");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				e = new Employee();
				e.setEmpId(rs.getString("emp_id"));
				e.setEmpPw(rs.getString("emp_pw"));
				e.setEmpName(rs.getString("emp_name"));
				e.setEmpRrn(rs.getString("emp_rrn"));
				e.setEmail(rs.getString("email"));
				e.setPhone(rs.getString("phone"));
				e.setAddr(rs.getString("addr"));
				e.setDeptCode(rs.getString("dept_code"));
				e.setJobCode(rs.getString("job_code"));
				e.setManagerId(rs.getString("manager_id"));
				e.setHireDate(rs.getDate("hire_date"));
				e.setEntDate(rs.getDate("ent_date"));
				e.setEntYn(rs.getString("ent_yn"));
				e.setEmpPr(rs.getString("emp_pr"));
				e.setEmpImg(rs.getString("emp_img"));
			}
		} catch(Exception ee) {
			ee.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return e;
	}

}
