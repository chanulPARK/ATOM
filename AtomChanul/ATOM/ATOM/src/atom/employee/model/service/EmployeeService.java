package atom.employee.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
<<<<<<< HEAD
import java.util.ArrayList;
=======
>>>>>>> 1b6407bff8f839b7f16b075fe41f9ac955a583d5
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
	
<<<<<<< HEAD

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
=======
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
>>>>>>> 1b6407bff8f839b7f16b075fe41f9ac955a583d5
	}

}
