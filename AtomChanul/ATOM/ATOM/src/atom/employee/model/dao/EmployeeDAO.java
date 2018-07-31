package atom.employee.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import atom.dept.model.vo.Dept;
import atom.employee.model.vo.Employee;
import atom.job.model.vo.Job;

import static common.JDBCTemplate.*;

public class EmployeeDAO {
	private Properties prop;
	public EmployeeDAO() {
		prop=new Properties();
		try {
			String file=EmployeeDAO.class.getResource("/sql/employee/employee-sql.properties").getPath();
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
				e.setDeptName(rs.getString("dept_name"));
				e.setJobCode(rs.getString("job_code"));
				e.setJobName(rs.getString("job_name"));
				e.setAdminCode(rs.getString("admin_code"));
//				e.setAdminName(rs.getString("admin_name"));
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
	
	public List<Employee> selectAll(Connection conn) {
	   	  PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      List<Employee> employeeList= new ArrayList<Employee>();
	      
	      String sql = prop.getProperty("selectAll");
	      try {
	         pstmt = conn.prepareStatement(sql);
	         rs = pstmt.executeQuery();
	         while(rs.next()) {
	        	Employee e = new Employee();
	           
	            e.setEmpId(rs.getString("emp_id"));
	            e.setEmpPw(rs.getString("emp_pw"));
	            e.setEmpName(rs.getString("emp_name"));
	            e.setEmpRrn(rs.getString("emp_rrn"));
	            e.setEmail(rs.getString("email"));
	            e.setPhone(rs.getString("phone"));
	            e.setAddr(rs.getString("addr"));
	            e.setManagerId(rs.getString("manager_id"));
	            e.setAdminCode(rs.getString("admin_code"));
	            e.setHireDate(rs.getDate("hire_date"));
	            e.setEntDate(rs.getDate("ent_date"));
	            e.setEntYn(rs.getString("ent_yn"));
	            e.setEmpPr(rs.getString("emp_pr"));
	            e.setEmpImg(rs.getString("emp_img"));
	            employeeList.add(e);
	         }
	      } catch(Exception e) {
	         e.printStackTrace();
	      }
	      close(rs);
	      close(pstmt);
	      
	     
	      System.out.println(employeeList);
	      return employeeList;
		   
	   }

	public int insertEmployee(Connection conn, Employee e) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertEmployee");
		//System.out.println(sql);
		//System.out.println(e);
		
		try 
		{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, e.getEmpId());
			pstmt.setString(2, e.getEmpPw());
			pstmt.setString(3, e.getEmpName());
			pstmt.setString(4, e.getEmpRrn());
			pstmt.setString(5, e.getEmail());
			pstmt.setString(6, e.getPhone());
			pstmt.setString(7, e.getAddr());
			pstmt.setString(8, e.getDeptCode());
			pstmt.setString(9, e.getJobCode());
			pstmt.setString(10,e.getManagerId());
			pstmt.setString(11,e.getEmpPr());
			result=pstmt.executeUpdate();
			
		} 
		catch (Exception ee) 
		{
			ee.printStackTrace();
		}
		
		close(pstmt);
		return result;
	}

}
