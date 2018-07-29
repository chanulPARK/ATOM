package atom.electronic.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import atom.calendar.model.dao.CalendarDAO;
import atom.electronic.model.service.ElectronicService;
import atom.electronic.model.vo.AuthoriaztionComment;
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
	
	public String transForm (String dateform) {
		String[] temp = dateform.split("/");
		return temp[2]+"-"+temp[0]+"-"+temp[1];
	}
	
	public int insertApproval(Connection conn, ElectronicApproval ea) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertApproval");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ea.getDraftNo());
			pstmt.setString(2, ea.getEmpId());
			pstmt.setString(3, ea.getDraftDept());
			pstmt.setString(4, ea.getDraftName());
			pstmt.setString(5, ea.getDraftContent());
			
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
				sql = "INSERT INTO MATERIALLINE VALUES(MATERIALLINE_SEQ.NEXTVAL,?,?,?,?,sysdate)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, m.getDraftNo());
				pstmt.setString(2, m.getEmpId());
				pstmt.setInt(3, m.getMaterialSquence());
				pstmt.setString(4, "승인");
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
				ea.setDraftDate(rs.getTimestamp("draft_date"));
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
				ea.setDraftDate(rs.getTimestamp("draft_date"));
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
			pstmt.setString(2, m.getDraftNo());
			pstmt.setString(3, m.getEmpId());
			
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
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				System.out.println(rs.getString("draft_no"));
				m = new MaterialLine();
				m.setDraftNo(rs.getString("draft_no"));
				m.setEmpId(rs.getString("emp_id"));
				m.setMaterialSquence(rs.getInt("material_squence"));
				m.setMaterialState(rs.getString("material_state"));
				m.setMaterialDate(rs.getTimestamp("material_date"));
				m.setEmpName(rs.getString("emp_name"));
				
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
				ea.setDraftDate(rs.getTimestamp("draft_date"));
				ea.setEmpId(rs.getString("emp_id"));
				ea.setDraftDept(rs.getString("draft_dept"));
				ea.setDraftName(rs.getString("draft_name"));
				ea.setDraftContent(rs.getString("draft_content"));
				ea.setDraftState(rs.getString("draft_state"));
				ea.setCompletionDate(rs.getTimestamp("COMPLETIONDATE"));
				list.add(ea);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public int selectCompletionCount(Connection conn, String empId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectCompletionCount");
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, empId);
			pstmt.setString(2, empId);
			pstmt.setString(3, "종결");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				cnt = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	public ArrayList<AuthoriaztionComment> selectCommentDraftNo(Connection conn, String draftNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectCommentDraftNo");
		ArrayList<AuthoriaztionComment> list = new ArrayList();
		AuthoriaztionComment ac;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, draftNo);
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ac = new AuthoriaztionComment();
				ac.setComment(rs.getString("comment_content"));
				ac.setCommentDate(rs.getTimestamp("comment_date"));
				ac.setDraftNo(rs.getString("draft_no"));
				ac.setEmpId(rs.getString("emp_id"));
				ac.setEmpName(rs.getString("emp_name"));
				ac.setDeptName(rs.getString("dept_name"));
				ac.setApprState(rs.getString("material_state"));
				list.add(ac);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public int insertComment(Connection conn, AuthoriaztionComment ac) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertComment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ac.getDraftNo());
			pstmt.setString(2, ac.getEmpId());
			pstmt.setString(3, ac.getComment());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(pstmt);
		
		return result;
	}
	public int updateMaterialLineafterProgree(Connection conn, MaterialLine m) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateMaterialLineafterProgree");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "진행");
			pstmt.setString(2, m.getDraftNo());
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
	public ArrayList<ElectronicApproval> selectProgressApproval(Connection conn, String empId, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectProgressApproval");
		ArrayList<ElectronicApproval> list = new ArrayList();
		ElectronicApproval ea;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, empId);
			pstmt.setString(2, "승인");
			pstmt.setString(3, "진행");
			pstmt.setInt(4, (cPage-1)*numPerPage+1);
			pstmt.setInt(5, cPage*numPerPage);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ea = new ElectronicApproval();
				ea.setPageNo(rs.getInt("rnum"));
				ea.setEmpName(rs.getString("emp_name"));
				ea.setDraftNo(rs.getString("draft_no"));
				ea.setDraftDate(rs.getTimestamp("draft_date"));
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
	public int selectProgressApprovalCount(Connection conn, String empId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectProgressApprovalCount");
		int approvalprogressCnt = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, empId);
			pstmt.setString(2, "승인");
			pstmt.setString(3, "진행");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				approvalprogressCnt = rs.getInt("cnt");//APPROVALCNT
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return approvalprogressCnt;
	}
	public ArrayList<ElectronicApproval> selectRequestApproval(Connection conn, String empId, int cPage,int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectRequestApproval");
		ArrayList<ElectronicApproval> list = new ArrayList();
		ElectronicApproval ea;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, empId);
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ea = new ElectronicApproval();
				ea.setPageNo(rs.getInt("rnum"));
				ea.setEmpName(rs.getString("emp_name"));
				ea.setDraftNo(rs.getString("draft_no"));
				ea.setDraftDate(rs.getTimestamp("draft_date"));
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
	public int selectRequestApprovalCount(Connection conn, String empId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectRequestApprovalCount");
		int approvalprogressCnt = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, empId);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				approvalprogressCnt = rs.getInt("cnt");//APPROVALCNT
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return approvalprogressCnt;
	}
	public ArrayList<ElectronicApproval> selectReturnApproval(Connection conn, String empId, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectReturnApproval");
		ArrayList<ElectronicApproval> list = new ArrayList();
		ElectronicApproval ea;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "반려");
			pstmt.setString(2, empId);
			pstmt.setString(3, empId);
			pstmt.setString(4, "반려");
			pstmt.setInt(5, (cPage-1)*numPerPage+1);
			pstmt.setInt(6, cPage*numPerPage);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ea = new ElectronicApproval();
				ea.setPageNo(rs.getInt("rnum"));
				ea.setEmpName(rs.getString("emp_name"));
				ea.setDraftNo(rs.getString("draft_no"));
				ea.setDraftDate(rs.getTimestamp("draft_date"));
				ea.setEmpId(rs.getString("emp_id"));
				ea.setDraftDept(rs.getString("draft_dept"));
				ea.setDraftName(rs.getString("draft_name"));
				ea.setDraftContent(rs.getString("draft_content"));
				ea.setDraftState(rs.getString("draft_state"));
				ea.setCompletionDate(rs.getTimestamp("MATERIAL_DATE"));
				list.add(ea);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public List<ElectronicApproval> selectCompletionApproval(Connection conn, String empId, String searchType, String searchWord,	int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectCompletionApproval");
		switch(searchType) {
		case "searchUser" : sql += " AND EMP_NAME LIKE ?";  break;
		case "searchTitle" : sql += " AND draft_name LIKE ?"; break;
		case "searchTContents" : sql += " AND draft_content LIKE ?"; break;
		}
		
		System.out.println("sql:"+sql);
		ArrayList<ElectronicApproval> list = new ArrayList();
		ElectronicApproval ea;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, empId);
			pstmt.setString(2, empId);
			pstmt.setString(3, "종결");
			pstmt.setInt(4, (cPage-1)*numPerPage+1);
			pstmt.setInt(5, cPage*numPerPage);
			pstmt.setString(6, "%"+searchWord+"%");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ea = new ElectronicApproval();
				ea.setPageNo(rs.getInt("rnum"));
				ea.setEmpName(rs.getString("emp_name"));
				ea.setDraftNo(rs.getString("draft_no"));
				ea.setDraftDate(rs.getTimestamp("draft_date"));
				ea.setEmpId(rs.getString("emp_id"));
				ea.setDraftDept(rs.getString("draft_dept"));
				ea.setDraftName(rs.getString("draft_name"));
				ea.setDraftContent(rs.getString("draft_content"));
				ea.setDraftState(rs.getString("draft_state"));
				ea.setCompletionDate(rs.getTimestamp("COMPLETIONDATE"));
				list.add(ea);
				
				System.out.println("완료함 : " + ea);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public List<ElectronicApproval> selectRequestApproval(Connection conn, String empId, String searchType,	String searchWord, int cPage, int numPerPage, String fromDate, String toDate) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectRequestApproval");
		switch(searchType) {
		case "searchUser" : sql += " AND EMP_NAME LIKE ?";  break;
		case "searchTitle" : sql += " AND draft_name LIKE ?"; break;
		case "searchTContents" : sql += " AND draft_content LIKE ?"; break;
		}
		
		if(fromDate !="" && fromDate != null && toDate !="" && toDate != null) {
			sql+= "and draft_date between ? and ?";
			fromDate = transForm(fromDate);
			toDate = transForm(toDate);
		}
		
		
		ArrayList<ElectronicApproval> list = new ArrayList();
		ElectronicApproval ea;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, empId);
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);
			pstmt.setString(4, "%"+searchWord+"%");
			if(fromDate !="" && fromDate != null && toDate !="" && toDate != null) {
				pstmt.setString(5, fromDate);
				pstmt.setString(6, toDate);
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ea = new ElectronicApproval();
				ea.setPageNo(rs.getInt("rnum"));
				ea.setEmpName(rs.getString("emp_name"));
				ea.setDraftNo(rs.getString("draft_no"));
				ea.setDraftDate(rs.getTimestamp("draft_date"));
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
	public List<ElectronicApproval> selectCompletionApproval(Connection conn, String empId, String searchType,
			String searchWord, int cPage, int numPerPage, String fromDate, String toDate) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectCompletionApproval");
		switch(searchType) {
		case "searchUser" : sql += " AND EMP_NAME LIKE ?";  break;
		case "searchTitle" : sql += " AND draft_name LIKE ?"; break;
		case "searchTContents" : sql += " AND draft_content LIKE ?"; break;
		}
		if(fromDate !="" && fromDate != null && toDate !="" && toDate != null) {
			sql+= "and draft_date between ? and ?";
			fromDate = transForm(fromDate);
			toDate = transForm(toDate);
		}

		System.out.println("sql:"+sql);
		ArrayList<ElectronicApproval> list = new ArrayList();
		ElectronicApproval ea;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, empId);
			pstmt.setString(2, empId);
			pstmt.setString(3, "종결");
			pstmt.setInt(4, (cPage-1)*numPerPage+1);
			pstmt.setInt(5, cPage*numPerPage);
			pstmt.setString(6, "%"+searchWord+"%");
			if(fromDate !="" && fromDate != null && toDate !="" && toDate != null) {
				pstmt.setString(7, fromDate);
				pstmt.setString(8, toDate);
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ea = new ElectronicApproval();
				ea.setPageNo(rs.getInt("rnum"));
				ea.setEmpName(rs.getString("emp_name"));
				ea.setDraftNo(rs.getString("draft_no"));
				ea.setDraftDate(rs.getTimestamp("draft_date"));
				ea.setEmpId(rs.getString("emp_id"));
				ea.setDraftDept(rs.getString("draft_dept"));
				ea.setDraftName(rs.getString("draft_name"));
				ea.setDraftContent(rs.getString("draft_content"));
				ea.setDraftState(rs.getString("draft_state"));
				ea.setCompletionDate(rs.getTimestamp("COMPLETIONDATE"));
				list.add(ea);
				
				System.out.println("완료함 : " + ea);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public List<ElectronicApproval> selectProgressApproval(Connection conn, String empId, String searchType,
			String searchWord, int cPage, int numPerPage, String fromDate, String toDate) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectProgressApproval");
		switch(searchType) {
			case "searchUser" : sql += " AND EMP_NAME LIKE ?";  break;
			case "searchTitle" : sql += " AND draft_name LIKE ?"; break;
			case "searchTContents" : sql += " AND draft_content LIKE ?"; break;
		}

		if(fromDate !="" && fromDate != null && toDate !="" && toDate != null) {
			sql+= "and draft_date between ? and ?";
			fromDate = transForm(fromDate);
			toDate = transForm(toDate);
		}
		ArrayList<ElectronicApproval> list = new ArrayList();
		ElectronicApproval ea;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, empId);
			pstmt.setString(2, "승인");
			pstmt.setString(3, "진행");
			pstmt.setInt(4, (cPage-1)*numPerPage+1);
			pstmt.setInt(5, cPage*numPerPage);
			pstmt.setString(6, "%"+searchWord+"%");
			if(fromDate !="" && fromDate != null && toDate !="" && toDate != null) {
				pstmt.setString(7, fromDate);
				pstmt.setString(8, toDate);
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ea = new ElectronicApproval();
				ea.setPageNo(rs.getInt("rnum"));
				ea.setEmpName(rs.getString("emp_name"));
				ea.setDraftNo(rs.getString("draft_no"));
				ea.setDraftDate(rs.getTimestamp("draft_date"));
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

	public List<ElectronicApproval> selectReturnApproval(Connection conn, String empId, String searchType,
			String searchWord, int cPage, int numPerPage, String fromDate, String toDate) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectReturnApproval");
		switch(searchType) {
		case "searchUser" : sql += " AND EMP_NAME LIKE ?";  break;
		case "searchTitle" : sql += " AND draft_name LIKE ?"; break;
		case "searchTContents" : sql += " AND draft_content LIKE ?"; break;
	}

	if(fromDate !="" && fromDate != null && toDate !="" && toDate != null) {
		sql+= "and draft_date between ? and ?";
		fromDate = transForm(fromDate);
		toDate = transForm(toDate);
	}
		ArrayList<ElectronicApproval> list = new ArrayList();
		ElectronicApproval ea;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "반려");
			pstmt.setString(2, empId);
			pstmt.setString(3, empId);
			pstmt.setString(4, "반려");
			pstmt.setInt(5, (cPage-1)*numPerPage+1);
			pstmt.setInt(6, cPage*numPerPage);
			pstmt.setString(7, "%"+searchWord+"%");
			if(fromDate !="" && fromDate != null && toDate !="" && toDate != null) {
				pstmt.setString(8, fromDate);
				pstmt.setString(9, toDate);
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ea = new ElectronicApproval();
				ea.setPageNo(rs.getInt("rnum"));
				ea.setEmpName(rs.getString("emp_name"));
				ea.setDraftNo(rs.getString("draft_no"));
				ea.setDraftDate(rs.getTimestamp("draft_date"));
				ea.setEmpId(rs.getString("emp_id"));
				ea.setDraftDept(rs.getString("draft_dept"));
				ea.setDraftName(rs.getString("draft_name"));
				ea.setDraftContent(rs.getString("draft_content"));
				ea.setDraftState(rs.getString("draft_state"));
				ea.setCompletionDate(rs.getTimestamp("MATERIAL_DATE"));
				list.add(ea);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public List<ElectronicApproval> selectWaitingApproval(Connection conn, String empId, String searchType,
			String searchWord, int cPage, int numPerPage, String fromDate, String toDate) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectWaitApproval");
		switch(searchType) {
		case "searchUser" : sql += " AND EMP_NAME LIKE ?";  break;
		case "searchTitle" : sql += " AND draft_name LIKE ?"; break;
		case "searchTContents" : sql += " AND draft_content LIKE ?"; break;
	}

	if(fromDate !="" && fromDate != null && toDate !="" && toDate != null) {
		sql+= "and draft_date between ? and ?";
		fromDate = transForm(fromDate);
		toDate = transForm(toDate);
	}
		ArrayList<ElectronicApproval> list = new ArrayList();
		ElectronicApproval ea;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, empId);
			pstmt.setString(2, "진행");
			pstmt.setInt(3, (cPage-1)*numPerPage+1);
			pstmt.setInt(4, cPage*numPerPage);
			pstmt.setString(5, "%"+searchWord+"%");
			if(fromDate !="" && fromDate != null && toDate !="" && toDate != null) {
				pstmt.setString(6, fromDate);
				pstmt.setString(7, toDate);
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ea = new ElectronicApproval();
				ea.setPageNo(rs.getInt("rnum"));
				ea.setEmpName(rs.getString("emp_name"));
				ea.setDraftNo(rs.getString("draft_no"));
				ea.setDraftDate(rs.getTimestamp("draft_date"));
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

	public int deleteCommentByEmpId(Connection conn, String draftNo, String empId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteCommentByEmpId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, draftNo);
			pstmt.setString(2, empId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(pstmt);
		
		return result;
	}

	public int updateMaterial(Connection conn, String draftNo, String empId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateMaterial");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "진행");
			pstmt.setString(2, empId);
			pstmt.setString(3, draftNo);
			pstmt.setString(4, empId);
			pstmt.setString(5, draftNo);
			pstmt.setString(6, draftNo);
			pstmt.setString(7, draftNo);
			pstmt.setString(8, empId);
			pstmt.setString(9, draftNo);
			pstmt.setString(10, "진행");
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(pstmt);
		
		return result;
	}

	public int deleteMaterial(Connection conn, String draftNo, String empId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteMaterial");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, draftNo);
			pstmt.setString(2, draftNo);
			pstmt.setString(3, empId);
			pstmt.setString(4, draftNo);
			pstmt.setString(5, "진행");
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(pstmt);
		
		return result;
	}

	public int deleteElectronicApproval(Connection conn, String draftNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteElectronicApproval");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, draftNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(pstmt);
		
		return result;
	}
	
}
