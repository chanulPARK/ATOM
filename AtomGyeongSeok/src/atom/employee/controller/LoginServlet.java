package atom.employee.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import atom.employee.model.service.EmployeeService;
import atom.employee.model.vo.Employee;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name="LoginServlet",urlPatterns="/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = (String)request.getParameter("userId");
		String pw = (String)request.getParameter("userPw");
	
		System.out.println("암호화pw : "+pw);
		
		
		Employee e = new EmployeeService().selectOne(id);
		System.out.println("아이디"+id);
		
		
		String msg="";
		String loc="";
		String view="views/common/msg.jsp";
		
		if(e!=null) {
			if(e.getEmpPw().equals(pw)) {
				msg="로그인 되셨습니다.";
				loc="/views/main.jsp";
				
				HttpSession session = request.getSession();
				session.setAttribute("empLoggedIn", e);
				
				String saveId = request.getParameter("saveId");
				if(saveId!=null) {
					Cookie c = new Cookie("saveId", id);
					c.setMaxAge(7*24*60*60);
					c.setPath("/");
					response.addCookie(c);
				} else {
					Cookie c = new Cookie("saveId", id);
					c.setMaxAge(0);
					c.setPath("/");
					response.addCookie(c);
				}
			} else {
				msg="비밀번호가 다릅니다";
				loc="/";
			}
		} else {
			msg="존재하지 않는 사번입니다. 관리자에게 문의하세요.";
			loc="/";
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
