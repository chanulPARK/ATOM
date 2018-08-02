package atom.attendance.model.service;

import java.sql.Connection;
import java.util.List;

import atom.attendance.model.dao.EmployeeDAO;
import atom.employee.model.vo.Employee;

import static common.JDBCTemplate.*;

public class EmployeeService {

	public Employee selectOne(String id) {
		Connection conn = getConnection();
		Employee e = new EmployeeDAO().selectOne(conn,id);
		close(conn);
		return e;
	}

	public List<Employee> selectEmpList() {
		Connection conn = getConnection();
		List<Employee> list = new EmployeeDAO().selectEmpList(conn);
		close(conn);
		return list;
	}

	public List<Employee> searchEmpList(String searchEmp) {
		Connection conn = getConnection();
		List<Employee> list = new EmployeeDAO().searchEmpList(conn, searchEmp);
		close(conn);
		return list;
	}

	public List<Employee> searchDeptList(String searchDept) {
		Connection conn = getConnection();
		List<Employee> list = new EmployeeDAO().searchDeptList(conn, searchDept);
		close(conn);
		return list;
	}

	public Employee selectName(String empName) {
		Connection conn = getConnection();
		Employee e = new EmployeeDAO().selectName(conn,empName);
		close(conn);
		return e;
	}

}
