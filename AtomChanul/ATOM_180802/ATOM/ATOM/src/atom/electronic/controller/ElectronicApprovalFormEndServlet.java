package atom.electronic.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import atom.electronic.model.service.ElectronicService;
import atom.electronic.model.vo.ElectronicApproval;
import atom.electronic.model.vo.MaterialLine;
import atom.employee.model.vo.Employee;

/**
 * Servlet implementation class ElectronicApprovalFormEndServlet
 */
@WebServlet("/approval/createApprDoc.do")
public class ElectronicApprovalFormEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ElectronicApprovalFormEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		HttpSession session = request.getSession();
		Employee e = (Employee)session.getAttribute("empLoggedIn");
		Date d = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("YYYYMMddHHmmss");
		Random r = new Random();
		
		String apprTitle = request.getParameter("apprTitle");
		String apprContent = request.getParameter("apprContent");
		System.out.println("asdfasdfasdf : " + apprContent);
		String draftNo = e.getDeptCode() + e.getEmpId() + sd.format(d);
		// 문서 자동채번 코드 ---- 부서코드+아이디+시간
		ElectronicApproval ea = new ElectronicApproval();
		ea.setDraftNo(draftNo);
		ea.setDraftDate(d);
		ea.setEmpId(e.getEmpId());
		ea.setDraftDept(e.getDeptName());
		ea.setDraftName(apprTitle);
		ea.setDraftContent(apprContent);
		
		/* 일단 보류 */
		MaterialLine m = new MaterialLine();

		String[] material_ids = request.getParameterValues("material_id");
		String[] material_squence_str = request.getParameterValues("material_squence");
		
		int[] material_squences = new int[material_squence_str.length];
		  
		
		int result = new ElectronicService().insertApproval(ea);
		int result2[] = new int[material_squence_str.length];
		for (int i = 0; i < material_squence_str.length; i++) {
			   material_squences[i] = Integer.parseInt(material_squence_str[i]);
				m.setDraftNo(draftNo);
				m.setEmpId(material_ids[i]);
				m.setMaterialSquence(Integer.parseInt(material_squence_str[i]));
				result2[i] = new ElectronicService().insertMaterialLine(m); // 결재선 변경
		}
		
		String msg="";
		String loc="/electronic/electronicWaitingBox";
		if(result>0)
		{
			msg="기안 등록 성공";
		}
		else
		{
			msg="기안 등록 실패";
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
