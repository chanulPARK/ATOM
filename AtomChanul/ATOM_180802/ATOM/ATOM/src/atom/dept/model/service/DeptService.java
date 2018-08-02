package atom.dept.model.service;
import static common.JDBCTemplate.*;

import java.sql.Connection;

import atom.dept.model.dao.DeptDAO;

public class DeptService {

	
	
	
	
	
	public int insertDept(String deptName) 
	{
		Connection conn=getConnection();
		int result= new DeptDAO().insertDept(conn, deptName);
		
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		
		return result;
		
	}

	
	
	
	
	
}
