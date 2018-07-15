package atom.calendar.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atom.calendar.model.service.CalendarService;
import atom.calendar.model.vo.Calendar;

/**
 * Servlet implementation class CalendarRegistrationFormEndServlet
 */
@WebServlet("/calendar/calendarRegistrationFormEnd")
public class CalendarRegistrationFormEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalendarRegistrationFormEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String scheduleName = request.getParameter("schedule-name");
		String schedulePlace = request.getParameter("schedule-place");
		String repeatSelect = request.getParameter("repeat-select");
		int repeatCycle = 0;
		Date repeatEndDate = null;
		char repeatYN = 'N';
		if(!repeatSelect.equals("반복 없음")) {
			repeatYN = 'Y';
			repeatCycle = Integer.parseInt(request.getParameter("repeat-cycle"));
			repeatEndDate = transformDate(request.getParameter("repeat-end"));
		}
		String content = request.getParameter("schedule-content");
		String scheduleDate= request.getParameter("schedule-date");
		String[] scheduleDateSE = scheduleDate.split(" - ");
		String startDate = scheduleDateSE[0];
		String endDate = scheduleDateSE[1];
		System.out.println("startDate : " + startDate);
		System.out.println("endDate : " + endDate);
		
		Calendar s = new Calendar();
		s.setScheduleName(scheduleName);
		s.setStartDate(startDate);
		s.setEndDate(endDate);
		s.setCategory("부서명");
		s.setEmpId("EMP_ID 01");
		s.setContent(content);
		s.setPlace(schedulePlace);
		s.setRepeatYN(repeatYN);
		s.setRepeatCategory(repeatSelect);
		s.setRepeatCycle(repeatCycle);
		s.setRepeatEndDate(repeatEndDate);
		
		int result = new CalendarService().insertSchedule(s);
		
		String msg="";
		String loc="/schedule/scheduleList";
		if(result>0)
		{
			msg="일정 등록 성공";
		}
		else
		{
			msg="일정 등록 실패";
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
	

	public Date transformDate(String date)
    {
        SimpleDateFormat beforeFormat = new SimpleDateFormat("MM/dd/yyyy");
        
        // Date로 변경하기 위해서는 날짜 형식을 yyyy-mm-dd로 변경해야 한다.
        SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy-MM-dd");
        
        java.util.Date tempDate = null;
        
        try {
            // 현재 yyyy/mm/dd로된 날짜 형식으로 java.util.Date객체를 만든다.
            tempDate = beforeFormat.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        
        // java.util.Date를 yyyy-mm-dd 형식으로 변경하여 String로 반환한다.
        String transDate = afterFormat.format(tempDate);
        
        // 반환된 String 값을 Date로 변경한다.
        Date d = Date.valueOf(transDate);
        
        return d;
    }
	
	
	public Date transformDateSE(String date)
    {
        SimpleDateFormat beforeFormat = new SimpleDateFormat("MM/dd/yyyy hh:mm a", new Locale("en", "US")); //, new Locale("en", "US")
        
        SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy-MM-dd HH:MM:SS AM");
        
        //TO_DATE('2015/05/15 8:30:25 PM', 'YYYY/MM/DD HH:MI:SS AM')
        java.util.Date tempDate = null;
        
        try {
            // 현재 yyyy/mm/dd로된 날짜 형식으로 java.util.Date객체를 만든다.
            tempDate = beforeFormat.parse(date);
            System.out.println("tempDate2" + tempDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        
        // java.util.Date를 yyyy-mm-dd 형식으로 변경하여 String로 반환한다.
        String transDate = afterFormat.format(tempDate);
        System.out.println("transDate : " + transDate);
        // 반환된 String 값을 Date로 변경한다.
        Date d = Date.valueOf(transDate);
        
        return d;
    }
	
}
