package atom.electronic.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import atom.electronic.model.service.ElectronicService;
import atom.electronic.model.vo.MaterialLine;
import atom.employee.model.vo.Employee;

/**
 * Servlet implementation class ElectonicApprovalSystemServlet
 */
@WebServlet("/electronic/ellectonicApprovalSystem")
public class ElectonicApprovalSystemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ElectonicApprovalSystemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Employee e = (Employee)session.getAttribute("empLoggedIn");
		String electAppr = request.getParameter("appr");
		String apprComment = request.getParameter("apprComment");
		String draftNo = request.getParameter("draftNo");
		MaterialLine m = new MaterialLine();
		m.setDraftNo(draftNo);
		m.setEmpId(e.getEmpId());
		m.setMaterialState(electAppr); //승인,거절
		
		int result = new ElectronicService().updateMaterialLine(m); // 결재선 변경
		int materialcnt = new ElectronicService().selectMaterialLineCount(m); // 결재선 총 수
		int materialapprovecnt = new ElectronicService().selectMaterialLineapproveCount(m); // 결재선 총 승인 수
		int materialrejectyn = new ElectronicService().selectMaterialLinereject(m); // 결재선 반려 여부
		// count는 3인데 승인 3이다 문서 종결, count 3인데 승인 2이다 진행, 반려가 포함되어있다 반려
		if(materialrejectyn>0) {
			m.setMaterialState("반려");
		}else if(materialcnt == materialapprovecnt) {
			m.setMaterialState("종결");		
		}else {
			m.setMaterialState("진행");
		}
		int result2 = new ElectronicService().updateElectronicApprovalState(m);
		
		String msg="";
		String loc="/electronic/electronicWaitingBox";
		if(result>0)
		{
			msg="결재 성공";
		}
		else
		{
			msg="결재 실패";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
		
		
//		AuthoriaztionComment ac = new AuthoriaztionComment();
//		ac.setDraftNo(draftNo);
//		ac.setEmpId(e.getEmpId());
//		ac.setComment(apprComment);
//		
//		
//		
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
