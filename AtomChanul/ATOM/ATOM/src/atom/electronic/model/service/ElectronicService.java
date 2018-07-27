package atom.electronic.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import atom.electronic.model.dao.ElectronicDAO;
import atom.electronic.model.vo.AuthoriaztionComment;
import atom.electronic.model.vo.ElectronicApproval;
import atom.electronic.model.vo.MaterialLine;

public class ElectronicService {

	public int insertApproval(ElectronicApproval ea) {
		Connection conn = getConnection();
		int result = new ElectronicDAO().insertApproval(conn,ea);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int insertMaterialLine(MaterialLine m) {
		Connection conn = getConnection();
		int result = new ElectronicDAO().insertMaterialLine(conn,m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public List<ElectronicApproval> selectWaitApproval(String empId, int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<ElectronicApproval> list = new ElectronicDAO().selectWaitApproval(conn,empId,cPage,numPerPage);
		close(conn);
		return list;
	}

	public int selectApproavalCount(String empId) {
		Connection conn = getConnection();
		int approvalCnt= new ElectronicDAO().selectApproavalCount(conn,empId);
		close(conn);
		return approvalCnt;
	}

	public ElectronicApproval selectDraftNo(String draftNo) {
		Connection conn = getConnection();
		ElectronicApproval ea = new ElectronicDAO().selectDraftNo(conn,draftNo);
		close(conn);
		return ea;
	}

	public int updateMaterialLine(MaterialLine m) {
		Connection conn = getConnection();
		int result = new ElectronicDAO().updateMaterialLine(conn,m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public List<MaterialLine> selectMaterialLineDraftNo(String draftNo) {
		Connection conn = getConnection();
		ArrayList<MaterialLine> list = new ElectronicDAO().selectMaterialLineDraftNo(conn,draftNo);
		close(conn);
		return list;
	}

	public int updateApprovalstate(MaterialLine m) {
		Connection conn = getConnection();
		int result = new ElectronicDAO().updateApprovalstate(conn,m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int selectMaterialLineapproveCount(MaterialLine m) {
		Connection conn = getConnection();
		int approvalCnt= new ElectronicDAO().selectMaterialLineapproveCount(conn,m);
		close(conn);
		return approvalCnt;
	}

	public int selectMaterialLineCount(MaterialLine m) { // 총 수
		Connection conn = getConnection();
		int materialcnt= new ElectronicDAO().selectMaterialLineCount(conn,m);
		close(conn);
		return materialcnt;
	}

	public int selectMaterialLinereject(MaterialLine m) {
		Connection conn = getConnection();
		int materialrejectyn= new ElectronicDAO().selectMaterialLinereject(conn,m);
		close(conn);
		return materialrejectyn;
	}

	public int updateElectronicApprovalState(MaterialLine m) {
		Connection conn = getConnection();
		int result = new ElectronicDAO().updateElectronicApprovalState(conn,m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public List<ElectronicApproval> selectCompletionApproval(String empId, int cPage, int numPerPage) {
		Connection conn = getConnection();
		ArrayList<ElectronicApproval> list = new ElectronicDAO().selectCompletionApproval(conn,empId,cPage,numPerPage);
		close(conn);
		return list;
	}

	public int selectCompletionCount(String empId) {
		Connection conn = getConnection();
		int totalContent= new ElectronicDAO().selectCompletionCount(conn,empId);
		close(conn);
		return totalContent;
	}

	public List<AuthoriaztionComment> selectCommentDraftNo(String draftNo) {
		Connection conn = getConnection();
		ArrayList<AuthoriaztionComment> commentList= new ElectronicDAO().selectCommentDraftNo(conn,draftNo);
		close(conn);
		return commentList;
	}

	public int insertComment(AuthoriaztionComment ac) {
		Connection conn = getConnection();
		int result = new ElectronicDAO().insertComment(conn,ac);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int updateMaterialLineafterProgree(MaterialLine m) {
		Connection conn = getConnection();
		int result = new ElectronicDAO().updateMaterialLineafterProgree(conn,m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public List<ElectronicApproval> selectProgressApproval(String empId, int cPage, int numPerPage) {
		Connection conn = getConnection();
		ArrayList<ElectronicApproval> list = new ElectronicDAO().selectProgressApproval(conn,empId,cPage,numPerPage);
		close(conn);
		return list;
	}

	public int selectProgressApprovalCount(String empId) {
		Connection conn = getConnection();
		int approvalprogressCnt= new ElectronicDAO().selectProgressApprovalCount(conn,empId);
		close(conn);
		return approvalprogressCnt;
	}

	public List<ElectronicApproval> selectRequestApproval(String empId, int cPage, int numPerPage) {
		Connection conn = getConnection();
		ArrayList<ElectronicApproval> list = new ElectronicDAO().selectRequestApproval(conn,empId,cPage,numPerPage);
		close(conn);
		return list;
	}

	public int selectRequestApprovalCount(String empId) {
		Connection conn = getConnection();
		int approvalprogressCnt= new ElectronicDAO().selectRequestApprovalCount(conn,empId);
		close(conn);
		return approvalprogressCnt;
	}

	public List<ElectronicApproval> selectReturnApproval(String empId, int cPage, int numPerPage) {
		Connection conn = getConnection();
		ArrayList<ElectronicApproval> list = new ElectronicDAO().selectReturnApproval(conn,empId,cPage,numPerPage);
		close(conn);
		return list;
	}

}
