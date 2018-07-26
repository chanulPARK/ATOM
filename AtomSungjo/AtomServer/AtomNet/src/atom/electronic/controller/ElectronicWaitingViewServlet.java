package atom.electronic.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atom.electronic.model.service.ElectronicService;
import atom.electronic.model.vo.ElectronicApproval;
import atom.electronic.model.vo.MaterialLine;

/**
 * Servlet implementation class ElectronicWaitingViewServlet
 */
@WebServlet("/electronic/electronicWaitingView")
public class ElectronicWaitingViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ElectronicWaitingViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String draftNo = request.getParameter("draftNo");
		
		ElectronicApproval ea = new ElectronicService().selectDraftNo(draftNo);
		List<MaterialLine> list = new ElectronicService().selectMaterialLineDraftNo(draftNo);
		
		String view="";
		if(ea!=null)
		{
			request.setAttribute("ea", ea);
			request.setAttribute("materialline", list);
			view="/views/ElectronicApprovalManagement/electronicWaitingView.jsp";
		}
		else
		{
			request.setAttribute("msg", "조회한 기안이 없습니다.");
			request.setAttribute("loc", "/views/ElectronicApprovalManagement/electronicWaitingBox.jsp");
			view="/views/common/msg.jsp";
		}
		request.getRequestDispatcher(view).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
