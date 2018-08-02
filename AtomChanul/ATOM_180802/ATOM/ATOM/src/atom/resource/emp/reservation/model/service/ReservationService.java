package atom.resource.emp.reservation.model.service;

import static common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.List;
import atom.resource.emp.reservation.model.dao.ReservationDAO;
import atom.resource.emp.reservation.model.vo.ResourceList;
import atom.employee.model.dao.EmployeeDAO;
import atom.employee.model.vo.Employee;

public class ReservationService {

	//유저 자원 홈 화면에 자원 DB출력 + 페이징 처리
	public List<ResourceList> selectResourceList(int cPage,int numPerPage) 
	{
		Connection conn=getConnection();
		List<ResourceList> list = new ReservationDAO().selectResourceList(conn,cPage,numPerPage);
	
		close(conn);
		
		return list;
	}
	
	//전체 자원 갯수 출력
	public int selectResourceCount() 
	{
		Connection conn=getConnection();
		int result = new ReservationDAO().selectResourceCount(conn);
		close(conn);
		
		return result;
	}

	//자원 검색하기
	public List<ResourceList> selectSearchResource(String searchResource) 
	{
		Connection conn=getConnection();
		List<ResourceList> list = new ReservationDAO().selectSearchResource(conn,searchResource);
		close(conn);
		
		return list;
	}
	
	//예약 리스트 출력
	public List<ResourceList> selectReservationList(String empId) 
	{
		Connection conn=getConnection();
		List<ResourceList> list = new ReservationDAO().selectReservationList(conn,empId);
	
		close(conn);
		
		return list;
	}

	//예약 리스트 출력
	public List<ResourceList> selectMyReservationList(String empId,int cPage, int numPerPage ) //int cPage, int numPerPage 
	{
		Connection conn=getConnection();
		List<ResourceList> list = new ReservationDAO().selectMyReservationList(conn,empId,cPage,numPerPage);
	
		close(conn);
		
		return list;
	}


	//예약리스트 정보 출력(새)
	public List<ResourceList> selectReservationView(int rscCode) 
	{
		Connection conn=getConnection();
		List<ResourceList> list=  new ReservationDAO().selectReservationView(conn,rscCode);
		
		close(conn);
		
		return list;
	}

	//자원 예약하기 
	public int insertRent(ResourceList rl) 
	{
		Connection conn=getConnection();
		int result = new ReservationDAO().insertRent(conn,rl);
		
		if(result>0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return result;
	}

	//유저 예약페이지 예약 시간 따로 출력
	public List<ResourceList> selectTimeView(int rscCode) 
	{
		Connection conn=getConnection();
		List<ResourceList> timelist=  new ReservationDAO().selectTimeView(conn,rscCode);
		
		close(conn);
		
		return timelist;
	}

	//자원반납 
	public int returnResource(ResourceList rl) 
	{
		Connection conn=getConnection();
		int result = new ReservationDAO().returnResource(conn,rl);
		
		if(result>0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return result;
		
		
	}

	

	
}
