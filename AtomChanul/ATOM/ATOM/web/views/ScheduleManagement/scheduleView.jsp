<%@page import="java.text.SimpleDateFormat"%>
<%@page import="atom.calendar.model.vo.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%
	Calendar s = (Calendar)request.getAttribute("calendar");
	SimpleDateFormat sd = new SimpleDateFormat("MM/dd/yyyy");
	String[] dayOfWeeks = null;
	if(s.getDayOfWeek() != null)
		dayOfWeeks = s.getDayOfWeek().split(",");
%>
	<!-- daterangepicker -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/dist/css/daterangepicker-bs3.css">

	<!-- 데이트피커 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>\dist\css\datepicker.css">
    <link href="<%=request.getContextPath()%>/dist/css/bootstrap.min.css" rel="stylesheet"> <!-- 왜 두번선언해야하지.. -->

	<style>
		.panel-footer{
			min-height:55px;
		}
	</style>
	<style>
    	.fc-day-number {color : #000000}    /* 기본색상 검정  */
    	.fc-sun{color:#e31b23}
    	.fc-sun .fc-day-number {color:#e31b23}
    	.fc-sat {color:#0100FF}
    	.fc-sat .fc-day-number {color:#0100FF}
    	aside div.leftmenu_top {
            background: #53b5e6;
            color: #fff;
            text-align: center;
            height: 50px;
        }
        aside div.leftmenu_top h3{
            padding-top: 10px;
            margin: 0;
        }
    </style>
    <aside>
    <div class="leftmenu_top">
            <h3>
               	 일정관리
            </h3>
     </div>
     <br>
      <div class="sidebar" style="margin: 0px 10px">
        <div class="create-schedule">
          <a href="<%=request.getContextPath()%>/schedule/scheduleList" class="btn btn-default btn-block ">돌아가기</a>
        </div>
        <br>
      </div>
    </aside>


    <section>
      <div class="container-fluid">
        <div class="row">
         <form action ="<%=request.getContextPath()%>/calendar/calendarUpdate" id = 'forma'>
          <div class="panel panel-default">
            <div class="panel-heading">일정 정보</div>
            <div class="panel-body"> <!-- panal body -->
              <div class="create-schedule-table">
                <table class="table table-bordered">
                  <tbody>
                    <tr>
                      <td>기간</td>
                      <td>
                        <div class="input-group">
                          <span class="input-group-addon" id="basic-addon2"><i class="fa fa-calendar" aria-hidden="true"></i></span>
                          <input name="schedule-date" type="text" class="form-control" id="reservationtime" name="reservationtime" value="<%=s.getStartDate()%> - <%=s.getEndDate()%>" required>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>제목</td>
                      <td>
                        <input id="schedule-name" name="schedule-name" class="form-control" placeholder="제목" value="<%=s.getScheduleName()%>" required>
                      </td>
                    </tr>
                    <tr>
                      <td>작성자</td>
                      <td>
                        <label><%=s.getEmpName() %></label>
                      </td>
                    </tr>
                    <tr>
                      <td>장소</td>
                      <td>
                        <input id="schedule-place" name="schedule-place" class="form-control" placeholder="장소" value="<%=s.getPlace()%>">
                      </td>
                    </tr>
                    <tr>
                      <td>반복</td>
                      <td>
                        <select class="form-control" id="repeat-select" name="repeat-select" style="width: 100%";>
                          <option>반복 없음</option>
                          <option>매일</option>
                          <option>주중</option>
                          <option>매주(요일지정)</option>
                          <option>매월(날짜기준)</option>
                          <option>매월(요일기준)</option>
                          <option>매년</option>
                        </select>
                      </td>
                    </tr>
                    <tr id='repeat-cycle' hidden>
                      <td>반복주기</td>
                      <td>
                        <span id="day-checkbox" name="day-checkbox" hidden>
                        <label for="sunday"><input type="checkbox" name="dayOfWeek" value="2" id="sunday">일</label>&nbsp;
                        <label for="monday"><input type="checkbox" name="dayOfWeek" value="3" id="monday">월</label>&nbsp;
                        <label for="tuesday"><input type="checkbox" name="dayOfWeek" value="4" id="tuesday">화</label>&nbsp;
                        <label for="wednesday"><input type="checkbox" name="dayOfWeek" value="5" id="wednesday">수</label>&nbsp;
                        <label for="thursday"><input type="checkbox" name="dayOfWeek" value="6" id="thursday">목</label>&nbsp;
                        <label for="friday"><input type="checkbox" name="dayOfWeek" value="7" id="friday">금</label>&nbsp;
                        <label for="saturday"><input type="checkbox" name="dayOfWeek" value="1" id="saturday">토</label>&nbsp;
                        </span>
                      </td>
                    </tr>
                    <tr id='repeat-end' hidden>
                      <td>반복종료</td>
                      <td>
                        <div class="input-group">
                          <span class="input-group-addon" id="basic-addon2"><i class="fa fa-calendar" aria-hidden="true"></i></span>
                          <input name="repeat-end" type="text" class="form-control" id="repeat_end_date" <%if(s.getRepeatEndDate()!=null){%>
                          value="<%=sd.format(s.getRepeatEndDate())%><%}%>">
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>내용</td>
                      <td>
                        <textarea name="schedule-content" rows="8" cols="80" class="form-control" name="schedule-content"><%=s.getContent() %></textarea>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div> <!-- create-schedule-table -->

            </div> <!-- panel-body -->
            <div class="panel-footer">
              <div class="buttons pull-right">
              
              <%if(s.getEmpId().equals(empLoggedIn.getEmpId())){%>
                <button type="submit" class="btn btn-primary" id="submit">수정</button>
                <button type="button" class="btn btn-danger" id="delete" onclick="deleteButtonClick();">삭제</button>
              <%}%>
                <button type="reset" onclick="history.go(-1)"class="btn btn-default">취소</button>
              </div>
              <input name="scheduleId" value="<%=s.getScheduleId()%>" hidden>
              

            </div> <!-- panel-footer -->
          </div> <!-- panel panel-default -->
		 </form>
        </div> <!-- row -->
      </div> <!-- container-fluid -->

    </section>

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="<%=request.getContextPath()%>/dist/js/bootstrap.min.js"></script>

    <script src="<%=request.getContextPath()%>/dist/lib/moment.min.js"></script>
    <script src="<%=request.getContextPath()%>/dist/js/daterangepicker.js"></script>
    <script src="<%=request.getContextPath()%>/dist/js/datepicker.js"></script>


    <script>
    $(function(){
      $('#repeat_end_date').datepicker();

      $('#reservationtime').daterangepicker({
        timePicker         : true,
        timePickerIncrement: 30,
        format             : 'MM/DD/YYYY h:mm A'
      })
      
      $('#repeat-select').val('<%=s.getRepeatCategory()%>').attr("selected","selected");

      if($('#repeat-select').val()!='반복 없음'){
    	  if($('#repeat-select option:selected').val() == '매주(요일지정)'){
              $('#day-checkbox').show();
              $('#repeat-cycle').show();
          }else{
          	$('#day-checkbox').hide();
            $('#repeat-cycle').hide();

          }
          $('#repeat-end').show();

          $('#repeat_end_date').attr("required",true);
      }
      
      
      
      
      
      
    });
    
    $('#submit').click(function(){
      console.log($('#repeat-select option:selected').val());
    });

    $('#repeat-select').change(function(){
        if($('#repeat-select option:selected').val() == '반복 없음'){
          $('#repeat-end').hide();
          $('#repeat-cycle').hide();      
          $('#repeat_end_date').attr("required",false);
          $('#repeat-select').attr("required",false);
          $('input:checkbox[name="dayOfWeek"]').attr("required", false); 

        }else{
          if($('#repeat-select option:selected').val() == '매주(요일지정)'){
            $('#day-checkbox').show();
            $('#repeat-cycle').show();
            $('input:checkbox[name="dayOfWeek"]').attr("required", true); 
            $('input:checkbox[name="dayOfWeek"]').change(function(){
          	  $('input:checkbox[name="dayOfWeek"]').each(function(){
          		  if($('input:checkbox[name="dayOfWeek"]').is(":checked") == true){
          	          $('input:checkbox[name="dayOfWeek"]').attr("required", false); 
          		  }else{
          	          $('input:checkbox[name="dayOfWeek"]').attr("required", true); 
          		  }
          	  });
            });
          }else{
            $('#day-checkbox').hide();
            $('#repeat-cycle').hide();         
            $('#day-checkbox').attr("required",false);
            $('input:checkbox[name="dayOfWeek"]').attr("required", false); 
            
          }
          $('#repeat-end').show();
          
          $('#repeat_end_date').attr("required",true);
        }
            
    });
    
	function deleteButtonClick(){
		location.href="<%=request.getContextPath()%>/calendar/calendarDelete?scheduleId=<%=s.getScheduleId()%>";
	}
	var list = [];
	<%if(dayOfWeeks != null){for(int i =0;i<dayOfWeeks.length;i++){%>
		list.push('<%=dayOfWeeks[i]%>');
	<%}}%>
	$('input:checkbox[name="dayOfWeek"]').each(function(){
		if(jQuery.inArray( $(this).val(), list ) > -1)
			$(this).attr("checked",true);
    });
	
    
    

    </script>








<!-- <script src="http://js.nicedit.com/nicEdit-latest.js"></script>
 -->


</body>
</html>