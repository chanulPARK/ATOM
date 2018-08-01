package atom.employee.model.service;

import java.sql.Connection;
import java.util.List;

import atom.employee.model.dao.EmployeeDAO;
import atom.employee.model.vo.Employee;

import static common.JDBCTemplate.*;

public class EmployeeService {

	public Employee selectOne(String id) {
		Connection conn = getConnection();
		Employee e = new EmployeeDAO().selectOne(conn,id);
		close(conn);
		return e;
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
