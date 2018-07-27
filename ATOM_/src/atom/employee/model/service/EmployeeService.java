package atom.employee.model.service;

import java.sql.Connection;

import atom.employee.model.dao.EmployeeDAO;
import atom.employee.model.vo.Employee;

import static common.JDBCTemplete.*;

public class EmployeeService {

	public Employee selectOne(String id) {
		Connection conn = getConnection();
		Employee e = new EmployeeDAO().selectOne(conn,id);
		close(conn);
		return e;
	}

}
