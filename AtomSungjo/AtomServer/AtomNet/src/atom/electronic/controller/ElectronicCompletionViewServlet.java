package atom.electronic.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atom.electronic.model.service.ElectronicService;
import atom.electronic.model.vo.AuthoriaztionComment;
import atom.electronic.model.vo.ElectronicApproval;
import atom.electronic.model.vo.MaterialLine;

/**
 * Servlet implementation class ElectronicCompletionViewServlet
 */
@WebServlet("/electronic/electronicCompletionView")
public class ElectronicCompletionViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ElectronicCompletionViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String draftNo = request.getParameter("draftNo");
		System.out.println("draftNo   : " + draftNo);
		
		ElectronicApproval ea = new ElectronicService().selectDraftNo(draftNo); // 기안 내용
		List<MaterialLine> list = new ElectronicService().selectMaterialLineDraftNo(draftNo); // 결재선 리스트
		List<AuthoriaztionComment> commentList = new ElectronicService().selectCommentDraftNo(draftNo); // 결재의견 리스트
		
		System.out.println("list22 : " + list);
		
		String view="";
		if(ea!=null)
		{
			request.setAttribute("ea", ea);
			request.setAttribute("materialline", list);
			request.setAttribute("commentList", commentList);
			view="/views/ElectronicApprovalManagement/electronicCompletionView.jsp";
		}
		else
		{
			request.setAttribute("msg", "조회한 기안이 없습니다.");
			request.setAttribute("loc", "/views/ElectronicApprovalManagement/electronicWaitingBox.jsp");
			view="/views/common/msg.jsp";
		}
		request.getRequestDispatcher(view).forward(request, response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
