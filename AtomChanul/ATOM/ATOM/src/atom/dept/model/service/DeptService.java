package atom.dept.model.service;
import static common.JDBCTemplate.*;


import java.sql.Connection;
import java.util.List;

import atom.dept.model.dao.DeptDAO;
import atom.dept.model.vo.Dept;

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


	//모든 부서정보 가져오기
	public List<Dept> deptList() {
		Connection conn = getConnection();
		List<Dept> deptlist= new DeptDAO().selectAll(conn);
		close(conn);
		return deptlist;
	}
	
	
	
	
}
