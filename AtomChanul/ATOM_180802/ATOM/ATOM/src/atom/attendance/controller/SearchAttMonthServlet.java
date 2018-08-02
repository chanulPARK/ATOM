package atom.attendance.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atom.attendance.model.service.AttendanceService;
import atom.attendance.model.service.HolidayService;
import atom.attendance.model.vo.Attendance;
import atom.attendance.model.service.EmployeeService;
import atom.employee.model.vo.Employee;
import common.DateFormat;

/**
 * Servlet implementation class SearchAttMonthServlet
 */
@WebServlet("/attendance/searchAttMonth")
public class SearchAttMonthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchAttMonthServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    // 관리자 월별 날짜 검색
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchMonth = request.getParameter("searchmonth");
		List<Employee> empList = new EmployeeService().selectEmpList();
		
		List<String[]> listdata = new ArrayList<>();
		String[] data = null;
		
		int monthcnt = new HolidayService().getMonthCnt(searchMonth);
		int holicnt = new HolidayService().holiMonthCnt(searchMonth);
		int count = monthcnt-holicnt;
		
		DateFormat df = new DateFormat();
		String view="";
		
		if(!searchMonth.trim().equals("")) {
			
			for(Employee e : empList) {
				if(!e.getEmpId().equals("admin")) {
					List<Attendance> list = new AttendanceService().searchMonthList(e.getEmpId(), searchMonth);
					
					int attcnt=0;
					int latecnt=0;
					int earlycnt=0;
					int abcnt=0;
					int nocnt=0;
					String totalTime="0:0";
					String total = "0시간 0분";
					double avg = 0; // 출근률
					String totalavg = "0";
					
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
						total = df.timeType(totalTime);
						
					}
					nocnt=count-(attcnt+latecnt+earlycnt+abcnt);
					avg = ((double)(count-nocnt)/count)*100;
					DecimalFormat fm = new DecimalFormat("#.##");
					if(attcnt>0)
						totalavg = fm.format(avg);
					
					data = new String[11];
					data[0]=e.getDeptName();
					data[1]=e.getJobName();
					data[2]=e.getEmpName();
					data[3]=searchMonth;
					data[4]=Integer.toString(attcnt);
					data[5]=Integer.toString(latecnt);
					data[6]=Integer.toString(earlycnt);
					data[7]=Integer.toString(abcnt);
					data[8]=Integer.toString(nocnt);
					data[9]=total;
					data[10]=totalavg;
					listdata.add(data);
				}
			}
			request.setAttribute("month", searchMonth);
			request.setAttribute("list", listdata);
			request.setAttribute("count", count);

			view="/views/attendance/att_month.jsp";	
		} else {
			view = "/attendance/monthList";
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
