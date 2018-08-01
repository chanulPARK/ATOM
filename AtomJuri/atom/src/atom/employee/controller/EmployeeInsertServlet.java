package atom.employee.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atom.employee.model.service.EmployeeService;
import atom.employee.model.vo.Employee;

/**
 * Servlet implementation class EmployeeInsertServlet
 */
@WebServlet("/employeeInsert")
public class EmployeeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String empId = request.getParameter("empId");	//인자는 폼의  네임값을 받아오는것이다
		String empPw =request.getParameter("empPw");	 
		String empName =request.getParameter("empName");
		String empRrn =request.getParameter("empRrn");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String addr = request.getParameter("addr");
		String deptCode =request.getParameter("deptCode");
		String jobCode = request.getParameter("jobCode");
		String managerId = request.getParameter("managerId");
		String empPr =request.getParameter("empPr");
		Employee e = new Employee();
		e.setEmpId(empId);
		e.setEmpPw(empPw);
		e.setEmpName(empName);
		e.setEmpRrn(empRrn);
		e.setEmail(email);
		e.setPhone(phone);
		e.setAddr(addr);
		e.setDeptCode(deptCode);
		e.setJobCode(jobCode);
		e.setManagerId(managerId);
		e.setEmpPr(empPr);
		
//		Employee e = new Employee(empId, empPw, empName, empRrn, email, phone, addr, deptCode, jobCode, managerId,empPr,null);
		System.out.println(e);
		
		//db입력해야한다
		int result= new EmployeeService().insertEmployee(e);
		
		String msg="";
		String loc="/";
		String view="/views/common/msg.jsp";
		if(result>0)
		{
			msg="사원등록 성공!";
		}
		else
		{
			msg="사원등록실패!";
			loc="/views/member/memberEnroll.jsp";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
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
