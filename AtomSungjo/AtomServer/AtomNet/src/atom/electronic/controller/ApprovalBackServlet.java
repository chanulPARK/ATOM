package atom.electronic.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import atom.electronic.model.service.ElectronicService;
import atom.electronic.model.vo.ElectronicApproval;
import atom.employee.model.vo.Employee;

/**
 * Servlet implementation class ApprovalBackServlet
 */
@WebServlet("/electronic/approvalBack")
public class ApprovalBackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApprovalBackServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Employee e = (Employee)session.getAttribute("empLoggedIn");
		
		String draftNo = request.getParameter("draftNo");
		System.out.println(draftNo);
		ElectronicApproval ea = new ElectronicService().selectDraftNo(draftNo);
		int result =0 ;
		int result2 =0 ;
		if(ea.getEmpId().equals(e.getEmpId())) {
			result = new ElectronicService().deleteMaterial(draftNo,e.getEmpId());// 결재선 삭제
			result2 = new ElectronicService().deleteElectronicApproval(draftNo);// 결재문서 삭제
		}else {
			result = new ElectronicService().updateMaterial(draftNo,e.getEmpId());//결재선 변경
			result2 = new ElectronicService().deleteCommentByEmpId(draftNo,e.getEmpId());//결재의견 회수  -- (내가 결재했고 다음이 결재를 안했을때만.. 해야함)
		}
		
		String msg="";
		String loc="/electronic/electronicWaitingBox";
		if(result>0 && result > 0)
		{
			msg="결재 회수 성공";
		}
		else
		{
			msg="결재 회수 실패";
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
