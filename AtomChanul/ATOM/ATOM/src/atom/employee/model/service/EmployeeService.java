package atom.employee.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import atom.employee.model.dao.EmployeeDAO;
import atom.employee.model.vo.Employee;

public class EmployeeService {

	public Employee selectOne(String empId) {
		Connection conn = getConnection();
		Employee e = new EmployeeDAO().selectOne(conn, empId);
		close(conn);
		return e;
	}

	public ArrayList<Employee> selectEmployeeAll() {
		Connection conn = getConnection();
		ArrayList<Employee> list = new EmployeeDAO().selectEmployeeAll(conn);
		close(conn);
		return list;
	}

	public List<String> selectDept() {
		Connection conn = getConnection();
		ArrayList<String> list = new EmployeeDAO().selectDept(conn);
		close(conn);
		return list;
	}
	
	public List<Employee> employeeList(){
		Connection conn = getConnection();
		List<Employee> employeeList = new EmployeeDAO().selectAll(conn);
		close(conn);
		return employeeList;
	}

	public int insertEmployee(Employee e) {
		Connection conn = getConnection();
		int result = new EmployeeDAO().insertEmployee(conn,e);
		
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

}
