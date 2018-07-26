package atom.electronic.model.dao;

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

import atom.calendar.model.dao.CalendarDAO;
import atom.electronic.model.vo.ElectronicApproval;
import atom.electronic.model.vo.MaterialLine;

public class ElectronicDAO {

	private Properties prop;
	public ElectronicDAO() {
		prop = new Properties();
		try {
			String file = CalendarDAO.class.getResource("/sql/electronic/Electronic-sql.properties").getPath();
			prop.load(new FileReader(file));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int insertApproval(Connection conn, ElectronicApproval ea) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertApproval");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ea.getDraftNo());
			pstmt.setDate(2, new java.sql.Date(ea.getDraftDate().getTime()));
			pstmt.setString(3, ea.getEmpId());
			pstmt.setString(4, ea.getDraftDept());
			pstmt.setString(5, ea.getDraftName());
			pstmt.setString(6, ea.getDraftContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(pstmt);
		
		return result;
	}
	public int insertMaterialLine(Connection conn, MaterialLine m) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertMaterialLine");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getDraftNo());
			pstmt.setString(2, m.getEmpId());
			pstmt.setInt(3, m.getMaterialSquence());
			if(m.getMaterialSquence()==1) {
				pstmt.setString(4, "승인");
				pstmt.setDate(5, new java.sql.Date(new java.util.Date().getTime()));
			}else if(m.getMaterialSquence()==2) {
				pstmt.setString(4, "진행");
				pstmt.setDate(5, null);
			}else {
				pstmt.setString(4, "미결");
				pstmt.setDate(5, null);
			}
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(pstmt);
		
		return result;
	}
	public List<ElectronicApproval> selectWaitApproval(Connection conn, String empId, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectWaitApproval");
		ArrayList<ElectronicApproval> list = new ArrayList();
		ElectronicApproval ea;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, empId);
			pstmt.setString(2, "진행");
			pstmt.setInt(3, (cPage-1)*numPerPage+1);
			pstmt.setInt(4, cPage*numPerPage);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ea = new ElectronicApproval();
				ea.setPageNo(rs.getInt("rnum"));
				ea.setEmpName(rs.getString("emp_name"));
				ea.setDraftNo(rs.getString("draft_no"));
				ea.setDraftDate(rs.getDate("draft_date"));
				ea.setEmpId(rs.getString("emp_id"));
				ea.setDraftDept(rs.getString("draft_dept"));
				ea.setDraftName(rs.getString("draft_name"));
				ea.setDraftContent(rs.getString("draft_content"));
				ea.setDraftState(rs.getString("draft_state"));
				list.add(ea);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public int selectApproavalCount(Connection conn, String empId) { // 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectApproavalCount");
		int approvalcnt = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, empId);
			pstmt.setString(2, "진행");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				approvalcnt = rs.getInt("approvalcnt");//APPROVALCNT
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return approvalcnt;
	}
	public ElectronicApproval selectDraftNo(Connection conn, String draftNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectDraftNo");
		ElectronicApproval ea = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, draftNo);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ea = new ElectronicApproval();
				ea.setDraftNo(rs.getString("draft_no"));
				ea.setDraftDate(rs.getDate("draft_date"));
				ea.setEmpId(rs.getString("emp_id"));
				ea.setEmpName(rs.getString("emp_name"));
				ea.setDraftDept(rs.getString("draft_dept"));
				ea.setDraftName(rs.getString("draft_name"));
				ea.setDraftContent(rs.getString("draft_content"));
				ea.setDraftState(rs.getString("draft_state"));
				System.out.println("ea : " + ea);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ea;
	}
	public int updateMaterialLine(Connection conn, MaterialLine m) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateMaterialLine");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,m.getMaterialState());
			pstmt.setDate(2, new java.sql.Date(new java.util.Date().getTime()));
			pstmt.setString(3, m.getDraftNo());
			pstmt.setString(4, m.getEmpId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(pstmt);
		
		return result;
	}
	public ArrayList<MaterialLine> selectMaterialLineDraftNo(Connection conn, String draftNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectMaterialLineDraftNo");
		ArrayList<MaterialLine> list= new ArrayList();
		MaterialLine m = null;
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, draftNo);
			pstmt.setString(2, "진행");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				System.out.println(rs.getString("draft_no"));
				m = new MaterialLine();
				m.setDraftNo(rs.getString("draft_no"));
				m.setEmpId(rs.getString("emp_id"));
				m.setMaterialSquence(rs.getInt("material_squence"));
				m.setMaterialState(rs.getString("material_state"));
				m.setMaterialDate(rs.getDate("material_date"));
				
				list.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public int updateApprovalstate(Connection conn, MaterialLine m) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateApprovalstate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getDraftNo());
			pstmt.setString(2, m.getDraftNo());
			pstmt.setString(3, "승인");//ㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅ
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(pstmt);
		
		return result;
	}
	public int selectMaterialLineapproveCount(Connection conn, MaterialLine m) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectMaterialLineapproveCount");
		int materialapprovecnt = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getDraftNo());
			pstmt.setString(2, "승인");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				materialapprovecnt = rs.getInt("materialapprovecnt");//APPROVALCNT
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return materialapprovecnt;
	}
	public int selectMaterialLineCount(Connection conn, MaterialLine m) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectMaterialLineCount");
		int materialcnt = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getDraftNo());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				materialcnt = rs.getInt("materialcnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return materialcnt;
	}
	public int selectMaterialLinereject(Connection conn, MaterialLine m) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectMaterialLinereject");
		int materialrejectyn = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getDraftNo());
			pstmt.setString(2, "반려");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				materialrejectyn = rs.getInt("materialrejectyn");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return materialrejectyn;
	}
	public int updateElectronicApprovalState(Connection conn, MaterialLine m) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateElectronicApprovalState");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMaterialState());
			pstmt.setString(2, m.getDraftNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(pstmt);
		
		return result;
	}
	public ArrayList<ElectronicApproval> selectCompletionApproval(Connection conn, String empId, int cPage,	int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectCompletionApproval");
		ArrayList<ElectronicApproval> list = new ArrayList();
		ElectronicApproval ea;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, empId);
			pstmt.setString(2, empId);
			pstmt.setString(3, "종결");
			pstmt.setInt(4, (cPage-1)*numPerPage+1);
			pstmt.setInt(5, cPage*numPerPage);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ea = new ElectronicApproval();
				ea.setPageNo(rs.getInt("rnum"));
				ea.setEmpName(rs.getString("emp_name"));
				ea.setDraftNo(rs.getString("draft_no"));
				ea.setDraftDate(rs.getDate("draft_date"));
				ea.setEmpId(rs.getString("emp_id"));
				ea.setDraftDept(rs.getString("draft_dept"));
				ea.setDraftName(rs.getString("draft_name"));
				ea.setDraftContent(rs.getString("draft_content"));
				ea.setDraftState(rs.getString("draft_state"));
				ea.setCompletionDate(rs.getDate("COMPLETIONDATE"));
				System.out.println("rs.getDate(\"COMPLETIONDATE\") : " + rs.getDate("COMPLETIONDATE"));
				list.add(ea);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
