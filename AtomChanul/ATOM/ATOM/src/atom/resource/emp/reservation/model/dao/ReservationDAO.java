package atom.resource.emp.reservation.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;
import static common.JDBCTemplate.*;

import atom.employee.model.vo.Employee;
import atom.resource.emp.reservation.model.vo.ResourceList;

public class ReservationDAO {

	private Properties prop;
	
	public ReservationDAO()
	{
		prop = new Properties();
		
		try
		{
			String file = ReservationDAO.class.getResource("/sql/resource/resource-sql.properties").getPath();
			prop.load(new FileReader(file));
		}
		catch(IOException e)
		{
			e.printStackTrace();
		}
		
	}
	
	//게시판 리스트 출력
	public List<ResourceList> selectResourceList(Connection conn, int cPage, int numPerPage) 
	{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectResourceList");
		
		ArrayList<ResourceList> list = new ArrayList<>();
		ResourceList rl = null;
		
		try 
		{
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);			
			
			rs=pstmt.executeQuery();
		
			while(rs.next())
			{
				rl = new ResourceList();
				
			//	rl.setEmpId(rs.getString("emp_id"));
			//	rl.setRscCatecode(rs.getString("rsc_cate_code"));
				rl.setRscCatename(rs.getString("rsc_cate_name"));
				rl.setRscCode(rs.getInt("rsc_code")); 
				rl.setRscName(rs.getString("rsc_name"));
				rl.setRscCondition(rs.getString("rsc_condition"));
			//	rl.setRscRent(rs.getString("rsc_rent"));
			//	rl.setStartTime(rs.getString("start_time"));
			//	rl.setEndTime(rs.getString("end_time"));
			//	rl.setRscReturn(rs.getString("rsc_return"));
			//	rl.setReturnMsg(rs.getString("return_msg"));
			//	rl.setRequestDate(rs.getDate("request_date"));
				
				list.add(rl);
			}
		}	
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		System.out.println(list);
		close(rs);
		close(pstmt);
		
		return list;		
		
	}

	//저장되어 있는 자원들의 총 갯수 출력
	public int selectResourceCount(Connection conn) 
	{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectResourceCount");
	
		int result = 0;
	
		try
		{
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				result = rs.getInt("resource_total");
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		close(rs);
		close(pstmt);
		
		return result;
	
	}

	//자원 검색
	public List<ResourceList> selectSearchResource(Connection conn,String searchResource) 
	{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectSearchResource");
		
		ArrayList<ResourceList> list = new ArrayList<>();
		ResourceList rl = null;
		
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchResource+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				rl = new ResourceList();
				
				rl.setRscCatename(rs.getString("rsc_cate_name"));
				rl.setRscCode(rs.getInt("rsc_code")); 
				rl.setRscName(rs.getString("rsc_name"));
				rl.setRscCondition(rs.getString("rsc_condition"));
				
				list.add(rl);
			}
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		close(rs);
		close(pstmt);
		
		return list;
		
	}

	//예약 리스트 출력
	public List<ResourceList> selectReservationList(Connection conn, String empId) 
	{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectReservationList");
		
		ArrayList<ResourceList> list = new ArrayList<>();
		ResourceList rl = null;
		
		try 
		{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, empId);
			
			rs=pstmt.executeQuery();
		
			while(rs.next())
			{
				rl = new ResourceList();
				
				rl.setEmpId(rs.getString("emp_id"));
				
				rl.setRscCatename(rs.getString("rsc_cate_name"));
				rl.setRscCode(rs.getInt("rsc_code")); 
				rl.setRscName(rs.getString("rsc_name"));
				rl.setStartTime(rs.getString("start_time"));
				rl.setEndTime(rs.getString("end_time"));
				rl.setRscRent(rs.getString("rsc_rent"));
				rl.setRequestDate(rs.getDate("request_date"));
				rl.setRscReturn(rs.getString("rsc_return"));
			//	rl.setReturnMsg(rs.getString("return_msg"));
				
				list.add(rl);
			}
		}	
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		System.out.println(list);
		close(rs);
		close(pstmt);
		
		return list;		
	}

	//새로 만드는 유저 예약 리스트 
	public List<ResourceList> selectMyReservationList(Connection conn, String empId,int cPage, int numPerPage) // int cPage, int numPerPage 
	{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectMyReservationList");
		
		ArrayList<ResourceList> list = new ArrayList<>();
		ResourceList rl = null;
		
		try 
		{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, empId);
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);		
			
			rs=pstmt.executeQuery();
		
			while(rs.next())
			{
				rl = new ResourceList();
				
				rl.setEmpId(rs.getString("emp_id"));
				rl.setRscCatename(rs.getString("rsc_cate_name"));
				rl.setRscCode(rs.getInt("rsc_code")); 
				rl.setRscName(rs.getString("rsc_name"));
				rl.setRscRent(rs.getString("rsc_rent"));
				rl.setStartTime(rs.getString("start_time"));
				rl.setEndTime(rs.getString("end_time"));
				rl.setRequestDate(rs.getDate("request_date"));
				rl.setRscReturn(rs.getString("rsc_return"));
				rl.setReturnMsg(rs.getString("return_msg"));
			
				list.add(rl);
			}
		}	
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		

		close(rs);
		close(pstmt);
		
		return list;		
		
	}

	//자원 예약 홈에서 버튼 클릭하면 예약 자원 폼이 쓰여져있는 리스트 정보 출력
	public List<ResourceList> selectReservationView(Connection conn, int rscCode) 
	{
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql = prop.getProperty("selectReservationView"); //수정
		
		ArrayList<ResourceList> list = new ArrayList<>();
		ResourceList rl = null;
		
		try 
		{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, rscCode);
			
			rs=pstmt.executeQuery();
		
			while(rs.next())
			{
				rl = new ResourceList();
				
				rl.setRscCatecode(rs.getString("rsc_cate_code"));
				rl.setRscCatename(rs.getString("rsc_cate_name"));
				rl.setRscCode(rs.getInt("rsc_code"));
				rl.setRscName(rs.getString("rsc_name"));
//				rl.setStartTime(rs.getString("start_time")); 
//				rl.setEndTime(rs.getString("end_time")); 

				list.add(rl);
			}
		}	
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		

		close(rs);
		close(pstmt);
		
		return list;		
		
	}

	//자원 예약
	public int insertRent(Connection conn, ResourceList rl) 
	{
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertRent");

		try
		{
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, rl.getEmpId());
			pstmt.setString(2, rl.getRscCatecode().trim());
			pstmt.setInt(3, rl.getRscCode());
			pstmt.setString(4, rl.getStartTime());
			pstmt.setString(5, rl.getEndTime());
			
			result = pstmt.executeUpdate();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		close(pstmt);
		
		return result;
		
	}

	//예약 페이지에서 시간 새로 출력	
	public List<ResourceList> selectTimeView(Connection conn, int rscCode) 
	{
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql = prop.getProperty("selectTimeView"); //수정
		
		ArrayList<ResourceList> list = new ArrayList<>();
		ResourceList rl = null;
		
		try 
		{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, rscCode);
			
			rs=pstmt.executeQuery();
		
			while(rs.next())
			{
				rl = new ResourceList();
			
				rl.setRscName(rs.getString("rsc_name"));
				rl.setStartTime(rs.getString("start_time")); 
				rl.setEndTime(rs.getString("end_time")); 

				list.add(rl);
			}
		}	
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	
		close(rs);
		close(pstmt);
		
		return list;		
	}

	//자원 반납
	public int returnResource(Connection conn, ResourceList rl) 
	{
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("returnResource");
		int result=0;
	
		try
		{
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rl.getRscCode());
			pstmt.setString(2, rl.getStartTime());
			
			result = pstmt.executeUpdate();
		}	
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		close(pstmt);
		
		return result;
	}
	
}