package atom.resource.admin.manage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atom.resource.admin.manage.model.service.AdminResourceService;
import atom.resource.emp.reservation.model.vo.ResourceList;

/**
 * Servlet implementation class AdminResourceReEditServlet
 */
@WebServlet("/admin/ReEdit")
public class AdminResourceReEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminResourceReEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
//		String rscCatecode = request.getParameter("editCatecode");
		int rscCode = Integer.parseInt(request.getParameter("editRscCode"));
		String rscName = request.getParameter("editRscName");
		String rscCondition = request.getParameter("edit_condition");
		
//		System.out.println("여기는 서블릿임당");
//   	System.out.println(rscCatecode+rscCode+rscName+rscCondition);
	
		ResourceList rl = new ResourceList(rscCode,rscName,rscCondition);
		
		int result = new AdminResourceService().editResource(rl);
	
		String msg = "";
		String loc = "/admin/resourcehome";
		String view = "/views/common/msg.jsp";
		
		if(result>0)
		{
			msg="선택한 자원이 수정 되었습니다.";
		}
		else
		{
			msg="자원 수정을 실패하였습니다.";
			
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
