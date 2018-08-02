package atom.job.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atom.dept.model.service.DeptService;
import atom.dept.model.vo.Dept;
import atom.employee.model.service.EmployeeService;
import atom.employee.model.vo.Employee;
import atom.job.model.service.JobService;
import atom.job.model.vo.Job;

/**
 * Servlet implementation class JobInsertEndServlet
 */
@WebServlet("/jobInsertEnd")
public class JobInsertEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JobInsertEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Job> list = new JobService().jobList();
		System.out.println(list);
		request.setAttribute("Job", list);
		request.getRequestDispatcher("/views/orgchat/admin/jobInsert.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
