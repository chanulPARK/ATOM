package atom.electronic.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import atom.electronic.model.service.ElectronicService;
import atom.electronic.model.vo.AuthoriaztionComment;
import atom.electronic.model.vo.MaterialLine;
import atom.employee.model.vo.Employee;

/**
 * Servlet implementation class SelectApprovalServlet
 */
@WebServlet("/electronic/selectApproval")
public class SelectApprovalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectApprovalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] draftNos = request.getParameterValues("allCheck");
		
		HttpSession session = request.getSession();
		Employee e = (Employee)session.getAttribute("empLoggedIn"); // 작성자 내용
		String electAppr = request.getParameter("appr"); // 승인/거절
		String apprComment = request.getParameter("apprComment"); // 결재의견
		
		MaterialLine m = null;
		int result = 0;
		int result2 = 0;
		int result3 = 0;
		
		for(String draftNo : draftNos) {
			m = new MaterialLine();
			m.setDraftNo(draftNo);
			m.setEmpId(e.getEmpId());
			m.setMaterialState(electAppr); //승인,거절
			
			result = new ElectronicService().updateMaterialLine(m); // 결재선 변경
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
				int result4 = new ElectronicService().updateMaterialLineafterProgree(m);
			}
			result2 = new ElectronicService().updateElectronicApprovalState(m); // 문서 상태 변경
			AuthoriaztionComment ac = new AuthoriaztionComment(); // 결재의견
			ac.setComment(apprComment);
			ac.setDraftNo(draftNo);
			ac.setEmpId(e.getEmpId());
			result3 = new ElectronicService().insertComment(ac); // 결재의견 추가
		}
		
		String msg="";
		String loc="/electronic/electronicWaitingBox";
		if(result>0 && result2>0 && result3 >0)
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
