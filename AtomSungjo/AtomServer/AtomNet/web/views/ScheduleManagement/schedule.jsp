<%@page import="java.util.Locale"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="atom.calendar.model.vo.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/views/common/header.jsp" %>
<%
	ArrayList<Calendar> lists = (ArrayList)request.getAttribute("list");
	SimpleDateFormat sd = new SimpleDateFormat("YYYY-MM-dd");
	boolean chk = true;

	
	
	
	GregorianCalendar date1 = new GregorianCalendar (Locale.KOREA);
	GregorianCalendar date2 = new GregorianCalendar (Locale.KOREA);
	/* today.setTime(new java.util.Date(2018,7-1,18));
	tomorrow.setTime(new java.util.Date(2018,8-1,18));
	for(;!today.equals(tomorrow);today.add(java.util.Calendar.DATE,1)){
		if(today.get(GregorianCalendar.DAY_OF_WEEK) !=1 && today.get(GregorianCalendar.DAY_OF_WEEK)!=7){ //주말이 아니면
			System.out.println("요일 : " + today.get(GregorianCalendar.DAY_OF_WEEK));
		}
	} */
//	today.set(Calendar.MILLISECOND, 0);
	//System.out.println(today.get(java.util.Calendar.DAY_OF_WEEK));
	//일1월2화3수4목5금6토7
	
	/* today.add(java.util.Calendar.DATE, -1); //하루전
	today.add(java.util.Calendar.MONTH, 4); //4개월 뒤
	today.add(java.util.Calendar.WEEK_OF_YEAR, -4); //4주전
	today.getMaximum(java.util.Calendar.DAY_OF_MONTH); //현재 월의 마지막 날짜 */
	//date객체필요시
//	Date date = today.getTime();
//	Date date = new Date(today.getTimeInMillis());
	//System.out.println(today.get(java.util.Calendar.DAY_OF_WEEK));
%>
	<!-- fullCalendar 3.9.0 -->
    <script src="<%=request.getContextPath()%>\dist\lib\moment.min.js"></script>
    <script src="<%=request.getContextPath()%>\dist\js\fullcalendar.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>\dist\css\fullcalendar.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>\dist\css\fullcalendar.print.css" media="print">
    <style>    
    	.fc-day-number {color : #000000}    /* 기본색상 검정  */
    	.fc-sun{color:#e31b23} 
    	.fc-sun .fc-day-number {color:#e31b23}    	
    	.fc-sat {color:#0100FF} 	
    	.fc-sat .fc-day-number {color:#0100FF}
   
  
    </style>
    <aside>

      <div class="sidebar" style="margin: 0px 10px">
        <div class="create-schedule">
          <a href="<%=request.getContextPath()%>/calendar/calendarRegistrationForm" class="btn btn-primary btn-block ">일정 등록</a>
        </div>
        <br>
        <div class="panel panel-default">
          <div class="panel-body">
            <div class="form">
              <p>일정 선택</p>
            </div>
            <div class="form-checks">
              <div class="form-check">
                <label for="schedule-group-check1" class="label label-danger schedule-group"><input type="checkbox" name="schedule-group" id="schedule-group-check1" checked> 공지사항</label>
              </div>
              <div class="form-check">
                <label for="schedule-group-check2" class="label label-success schedule-group"><input type="checkbox" name="schedule-group" id="schedule-group-check2"> 국내개발팀 </label>
              </div>
              <div class="form-check">
                <label for="schedule-group-check3" class="label label-info schedule-group"><input type="checkbox" name="schedule-group" id="schedule-group-check3" checked> 내 일정 </label>
              </div>
              <div class="input-group">
                <%-- <input id="new-event" type="text" class="form-control" placeholder="일정 추가" style="width:73%"> --%>
                <div class="input-group-append">
                  <button id="add-new-event" type="button" class="btn btn-default pull-right" style="width:100%">일정 보기</button>
                </div>

                <%-- btn-group --%>
              </div>
              <%-- input-group --%>
            </div>
          </div>

        </div>

        <div class="form-group">

        </div>

      </div>

    </aside>



    <section>
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-2"></div>
          <div id='calendar' class="col-lg-8"></div>
        </div>
      </div>

    </section>

    <footer>
        <p>COPYRIGHT @ ATOM ALL RIGHTS RESERVED</p>
    </footer>

<!-- jQuery -->
    <script>
      $(function(){
        $('#calendar').fullCalendar({
          header    : {
            left  : 'prev,next today',
            center: 'title',
            right : 'month,agendaWeek,agendaDay,listWeek'
          },
          buttonText: {
            today: '오늘',
            month: '월간',
            week : '주간',
            day  : '일간',
            listWeek : '목록보기'
          },
          lang : 'ko',
          defaultDate: new Date(), // 디폴트 날짜 설정
          navLinks : true, // 날짜 클릭시 일간목록 설정
          editable : false, // 일정 드래그 설정
          eventLimit : true, // 칸을 넘어가는 일정은 more로 표시 설정
          monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
          monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
          dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
          dayNamesShort: ["일","월","화","수","목","금","토"],
          events: [
            /* {
              title: '홈페이지 이동',
              start: '2018-07-08T08:00:00',
              end : '2018-07-08T10:00:00',
              url : '../default.jsp'
            },*/
            {
              title: '뭐지',
              start: '2018-07-01',
              end : '2018-07-13',
            },

            <%for(Calendar s : lists)
            {%>
				
	            	<%if(s.getRepeatCategory().equals("매일")){%> // 매일
	            		{
		            	color : "#d9534f",
		            	title : '<%=s.getScheduleName()%>',
		            	start : '<%=s.getStartDate()%>', 
		            	end : '<%=sd.format(s.getRepeatEndDate())%>',
		            	url : '<%=request.getContextPath()%>/calendar/calendarInfo?scheduleId=<%=s.getScheduleId()%>',
	            		},		
	            	<%}else if(s.getRepeatCategory().equals("주중")){%> // 주중
	            		
	            		<%date1.setTime(new java.util.Date(s.getStartYear(),s.getStartMonth()-1,s.getStartDay()));
	            		date2.setTime(new java.util.Date(s.getEndYear(),s.getEndMonth()-1,s.getEndDay()));
	            		System.out.print(" 요일"+date1.get(GregorianCalendar.DAY_OF_WEEK));%>
 	            		 	            		
						<%for(;!date1.equals(date2);date1.add(java.util.Calendar.DATE,1)){
							if(date1.get(GregorianCalendar.DAY_OF_WEEK) >2){//주말이 아니면
								java.util.Date tempDate = date1.getTime();
								tempDate.setYear(tempDate.getYear()-1900);
								if(chk){chk = false;%> 
									{
									color : "#d9534f",
					            	title : '<%=s.getScheduleName()%>',
					            	start : '<%=sd.format(tempDate)%>', 	
									<%System.out.println("temp2 : " + sd.format(tempDate));%>

								<%}								
				            	if(date1.get(GregorianCalendar.DAY_OF_WEEK) == 7){
				            	chk = true;
				            	date1.add(java.util.Calendar.DATE,1);
				            	java.util.Date tempDate2 = date1.getTime();
				            	date1.add(java.util.Calendar.DATE,-1);
								tempDate2.setYear(tempDate2.getYear()-1900);
								%>

				            	end : '<%=sd.format(tempDate2)%>',
				            	url : '<%=request.getContextPath()%>/calendar/calendarInfo?scheduleId=<%=s.getScheduleId()%>',
				            	},
				            	
				            	<%}
							}
						}
						if(!chk){
							date2.add(java.util.Calendar.DATE, 1);
							java.util.Date tempDate = date2.getTime();
							tempDate.setYear(tempDate.getYear()-1900);
							System.out.print("또왜:"+ sd.format(tempDate));
			            	chk = true;
						%> 
							end : '<%=sd.format(tempDate)%>',
			            	url : '<%=request.getContextPath()%>/calendar/calendarInfo?scheduleId=<%=s.getScheduleId()%>',
			            	},
	            		<%}%>
 	            		
 	            		<%-- 
 	            		color : "#d9534f",
		            	title : '<%=s.getScheduleName()%>',
		            	start : '<%=s.getStartDate()%>', 
		            	end : '<%=sd.format(s.getRepeatEndDate())%>',
		            	url : '<%=request.getContextPath()%>/calendar/calendarInfo?scheduleId=<%=s.getScheduleId()%>', --%>
		            			
		            			
 	            		
	            	<%}else{%> // 기본
	            		{
		            	//#d9534f 공지사항, #5cb85c 부서, #5bc0de 개인
		            	color : "#d9534f",
		            	
		            	title : '<%=s.getScheduleName()%>',
		            	start : '<%=s.getStartDate()%>',
		            	end : '<%=s.getEndDate()%>',
		            	url : '<%=request.getContextPath()%>/calendar/calendarInfo?scheduleId=<%=s.getScheduleId()%>',
	            		},
	            	<%}%>
	            
            <%}%>
          ]


        });
      });
      

    </script>








    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="<%=request.getContextPath()%>/dist/js/bootstrap.min.js"></script>
    <!-- <script src="../datepicker-master\src\js\daterangepicker.js"></script> <!-- 데이트피커 --> -->

  </body>
</html>
