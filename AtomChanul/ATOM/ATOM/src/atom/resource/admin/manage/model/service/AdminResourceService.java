package atom.resource.admin.manage.model.service;

import java.sql.Connection;
import java.util.List;

import atom.resource.admin.manage.model.dao.AdminReservationDAO;
import atom.resource.emp.reservation.model.dao.ReservationDAO;
import atom.resource.emp.reservation.model.vo.ResourceList;
import static common.JDBCTemplate.*;
import atom.employee.model.dao.EmployeeDAO;
import atom.employee.model.vo.Employee;

public class AdminResourceService 
{
	//관리자 홈 화면에 자원 DB 출력 + 페이징 처리
	public List<ResourceList> selectResourceList(int cPage, int numPerPage) 
	{
		Connection conn = getConnection();
		List<ResourceList> list = new AdminReservationDAO().selectResourceList(conn,cPage,numPerPage);
		
		close(conn);
		
		return list;
	}
	
	//관리자 홈 자원 갯수 출력
	public int selectAdminResourceCount() 
	{
		Connection conn=getConnection();
		int result = new AdminReservationDAO().selectAdminResourceCount(conn);
		close(conn);
		
		return result;
	}

	//관리자 승인 요청 리스트 갯수 출력 
	public List<ResourceList> selectResourceAcceptList(int cPage, int numPerPage) 
	{
		Connection conn = getConnection();
		List<ResourceList> list = new AdminReservationDAO().selectResourceAcceptList(conn,cPage,numPerPage);
		
		close(conn);
		
		return list;
	}

}
