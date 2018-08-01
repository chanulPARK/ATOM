package atom.resource.admin.manage.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import atom.resource.emp.reservation.model.dao.ReservationDAO;
import atom.resource.emp.reservation.model.vo.ResourceList;

public class AdminReservationDAO {
	
	private Properties prop;
	
	public AdminReservationDAO()
	{
		prop = new Properties();
		
		try
		{
			String file = ReservationDAO.class.getResource("/sql/resource-sql.properties").getPath();
			prop.load(new FileReader(file));
		}
		catch(IOException e)
		{
			e.printStackTrace();
		}
		
	}

	//관리자 홈 화면 출력	
	public List<ResourceList> selectResourceList(Connection conn, int cPage, int numPerPage) 
	{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectAdminResourceList");
		
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
				
				rl.setRscCatecode(rs.getString("rsc_cate_code"));
				rl.setRscCatename(rs.getString("rsc_cate_name"));
				rl.setRscCode(rs.getInt("rsc_code")); 
				rl.setRscName(rs.getString("rsc_name"));
				rl.setRscCondition(rs.getString("rsc_condition"));
				
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

	//관리자 홈 저장되어있는 자원들의 총 갯수 출력
	public int selectAdminResourceCount(Connection conn) 
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

	public List<ResourceList> selectResourceAcceptList(Connection conn, int cPage, int numPerPage) 
	{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectAdminAcceptList");
		
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
				
				rl.setEmpId(rs.getString("emp_id")); //
				rl.setRscCatename(rs.getString("rsc_cate_name"));
				rl.setRscCode(rs.getInt("rsc_code")); 
				rl.setRscName(rs.getString("rsc_name"));
				rl.setEmpName(rs.getString("emp_name"));
				rl.setRequestDate(rs.getDate("request_date"));
				rl.setStartTime(rs.getString("start_time"));
				rl.setEndTime(rs.getString("end_time"));
				rl.setRscRent(rs.getString("rsc_rent"));
				
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

	//자원 검색
	public List<ResourceList> selectAdminSearchResource(Connection conn, String adminSearchResource) 
	{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectSearchResource");
		
		ArrayList<ResourceList> list = new ArrayList<>();
		ResourceList rl = null;
		
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+adminSearchResource+"%");
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

	//자원 추가하기
	public int insertResource(Connection conn, ResourceList rl) 
	{
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertResource");
		
		try
		{
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, rl.getRscName());
			pstmt.setString(2, rl.getRscCatecode());
			pstmt.setString(3, rl.getRscCondition());
			
			result = pstmt.executeUpdate();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		close(pstmt);
		
		return result;
	}

	//승인 처리
	public int updateAccept(Connection conn, ResourceList rl) 
	{
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("updateAccept");
		
		try
		{
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, rl.getStartTime());
			pstmt.setString(2, rl.getEmpId());
			result = pstmt.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		System.out.println(rl.toString()+"여기 DAO입니당");
		
		close(pstmt);
		return result;
	}
	
	//자원 수정하기 
	public int editResource(Connection conn, ResourceList rl) 
	{
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("editResource");
		
		try
		{
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, rl.getRscName());
			pstmt.setString(2, rl.getRscCondition());
			pstmt.setInt(3, rl.getRscCode());

			
			result = pstmt.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		System.out.println(rl.toString()+"여기 업데이트  DAO입니당");
		
		close(pstmt);
		return result;
	}
	
	//자원 삭제하기 
	public int deleteResource(Connection conn, int rscCode) 
	{
		PreparedStatement pstmt=null;
		int result = 0;
		String sql=prop.getProperty("deleteResource");
		
		try
		{
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rscCode);
	
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
