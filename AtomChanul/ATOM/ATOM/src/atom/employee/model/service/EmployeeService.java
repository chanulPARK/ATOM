package atom.employee.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import atom.employee.model.dao.EmployeeDAO;
import atom.employee.model.vo.Employee;

public class EmployeeService {

	public Employee selectOne(String id) {
		Connection conn = getConnection();
		Employee e = new EmployeeDAO().selectOne(conn,id);
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

}
