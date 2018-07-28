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

}
