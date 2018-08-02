package atom.electronic.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atom.electronic.model.service.ElectronicService;
import atom.employee.model.service.EmployeeService;
import atom.employee.model.vo.Employee;

/**
 * Servlet implementation class ElectronicApprovalFormServlet
 */
@WebServlet("/electronic/electronicApprovalForm")
public class ElectronicApprovalFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ElectronicApprovalFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Employee> empList = new EmployeeService().selectEmployeeAll();
		List<String> deptList = new EmployeeService().selectDept();
		
		request.setAttribute("empList",empList);
		request.setAttribute("deptList",deptList);
		
		request.getRequestDispatcher("/views/ElectronicApprovalManagement/writeElectronicApproval.jsp").forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
