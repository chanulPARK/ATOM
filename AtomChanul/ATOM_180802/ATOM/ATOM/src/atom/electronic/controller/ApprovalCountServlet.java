package atom.electronic.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import atom.electronic.model.service.ElectronicService;
import atom.employee.model.vo.Employee;

/**
 * Servlet implementation class ApprovalCountServlet
 */
@WebServlet("/electronic/approvalCountServlet")
public class ApprovalCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApprovalCountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Employee e = (Employee)session.getAttribute("empLoggedIn");
		int requestCount=new ElectronicService().selectRequestApprovalCount(e.getEmpId());
		int waitCount = new ElectronicService().selectApproavalCount(e.getEmpId());
		int completionCount=new ElectronicService().selectCompletionCount(e.getEmpId());
		int progressCount=new ElectronicService().selectProgressApprovalCount(e.getEmpId());
		int returnCount=new ElectronicService().selectReturnCount(e.getEmpId());
		
		response.setContentType("application/x-json; charset=UTF-8");
		  response.getWriter().print(requestCount);
		  response.getWriter().print(" "+waitCount);
		  response.getWriter().print(" "+progressCount);
		  response.getWriter().print(" "+completionCount);
		  response.getWriter().print(" "+returnCount);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
