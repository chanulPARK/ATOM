package atom.attendance.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atom.attendance.model.service.AttendanceService;
import atom.attendance.model.service.HolidayService;
import atom.attendance.model.vo.Attendance;
import atom.employee.model.vo.Employee;
import common.DateFormat;

/**
 * Servlet implementation class SearchUserMonthServlet
 */
@WebServlet("/attendance/searchUserMonth")
public class SearchUserMonthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchUserMonthServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Employee e = (Employee)request.getSession().getAttribute("empLoggedIn");
		// 캘린더에 출력해 줄 사원 근태 값을 가져옴
		List<Attendance> aList = new AttendanceService().selectAtt(e.getEmpId());
		
		// 입력한 월 값
		String searchMonth = request.getParameter("searchMonth");
		DateFormat df = new DateFormat();
		String view="";
		int attcnt=0;
		int latecnt=0;
		int earlycnt=0;
		int abcnt=0;
		int nocnt=0;
		String totalTime="0:0";
		String total = "0시간 0분";
		
		// 주말을 제외한 현재 월의 일 수
		int monthcnt = new HolidayService().getCnt();
		// 관리자가 지정한 휴일 일 수
		int holicnt = new HolidayService().holiCnt();
		int count = monthcnt-holicnt; // 출근일 수
		double avg = 0; // 출근률
		String totalavg = "0";
		
		// 입력한 날짜 값이 있을 경우
		if(!searchMonth.trim().equals("")) {
			// 입력한 월에 대한 사용자의 근태정보 가져옴
			List<Attendance> list = new AttendanceService().searchUserMonthAtt(e.getEmpId(),searchMonth);
			
			for(Attendance a : list) {
				// 사원 근태 횟수 계산
				if(a.getAttType().equals("정상")) attcnt++;
				else if(a.getAttType().contains("지각")) latecnt++;
				else if(a.getAttType().contains("조퇴")) earlycnt++;
				else if(a.getAttType().equals("결근")) nocnt++;
				else abcnt++;
				
				//근무시간
				if(a!=null && a.getWorkTime()!=null)
					totalTime = df.timeSum(totalTime, a.getWorkTime());
			}
			total = df.timeType(totalTime);
			
			nocnt=count-(attcnt+latecnt+earlycnt+abcnt);
			avg = ((double)(count-nocnt)/count)*100;
			DecimalFormat fm = new DecimalFormat("#.##");
			if(attcnt>0)
				totalavg = fm.format(avg);

			request.setAttribute("month", searchMonth);
			request.setAttribute("attcnt", attcnt);
			request.setAttribute("latecnt", latecnt);
			request.setAttribute("earlycnt", earlycnt);
			request.setAttribute("abcnt", abcnt);
			request.setAttribute("nocnt", nocnt);
			request.setAttribute("totalTime", total);
			request.setAttribute("count", count);
			request.setAttribute("totalavg", totalavg);
			request.setAttribute("aList", aList);
			view="/views/attendance/user_month.jsp";
		} else {
			// 검색어 입력 x
			view = "/attendance/userMonth";
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
