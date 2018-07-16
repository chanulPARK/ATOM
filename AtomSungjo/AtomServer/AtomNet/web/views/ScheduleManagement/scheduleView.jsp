<%@page import="java.text.SimpleDateFormat"%>
<%@page import="atom.calendar.model.vo.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%
	Calendar s = (Calendar)request.getAttribute("calendar");
	SimpleDateFormat sd = new SimpleDateFormat("MM/dd/yyyy");

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

    <aside>
      <div class="sidebar">
        <div class="" style="margin: 0px 10px">
          <a href="<%=request.getContextPath()%>/schedule/scheduleList" class="btn btn-primary btn-block ">돌아가기</a>
        </div>
      </div>
    </aside>

    <section>
      <div class="container-fluid">
        <div class="row">
         <form action ="<%=request.getContextPath()%>/calendar/calendarUpdate">
          <div class="panel panel-default">
            <div class="panel-heading">일정 등록</div>
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
                        <select id="repeat-cycle" name="repeat-cycle" class="form-control" style="width:10%;display:inline">
                          <option>1</option>
                          <option>2</option>
                          <option>3</option>
                          <option>4</option>
                          <option>5</option>
                          <option>6</option>
                          <option>7</option>
                          <option>8</option>
                          <option>9</option>
                          <option>10</option>
                        </select>
                        주/개월/년 &nbsp;
                        <span id="day-checkbox" name="day-checkbox" hidden>
                        <label for="sunday"><input type="checkbox" name="dayOfWeek" value="" id="sunday">일</label>&nbsp;
                        <label for="monday"><input type="checkbox" name="dayOfWeek" value="" id="monday">월</label>&nbsp;
                        <label for="tuesday"><input type="checkbox" name="dayOfWeek" value="" id="tuesday">화</label>&nbsp;
                        <label for="wednesday"><input type="checkbox" name="dayOfWeek" value="" id="wednesday">수</label>&nbsp;
                        <label for="thursday"><input type="checkbox" name="dayOfWeek" value="" id="thursday">목</label>&nbsp;
                        <label for="friday"><input type="checkbox" name="dayOfWeek" value="" id="friday">금</label>&nbsp;
                        <label for="saturday"><input type="checkbox" name="dayOfWeek" value="" id="saturday">토</label>&nbsp;
                        </span>
                      </td>
                    </tr>
                    <tr id='repeat-end' hidden>
                      <td>반복종료</td>
                      <td>
                        <div class="input-group">
                          <span class="input-group-addon" id="basic-addon2"><i class="fa fa-calendar" aria-hidden="true"></i></span>
                          <input name="repeat-end" type="text" class="form-control" id="repeat-end_date" <%if(s.getRepeatEndDate()!=null){%>
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
                    <tr>
                      <td>참여자</td>
                      <td></td>
                    </tr>
                  </tbody>
                </table>
              </div> <!-- create-schedule-table -->

            </div> <!-- panel-body -->
            <div class="panel-footer">
              <div class="buttons pull-right">
                <button type="submit" class="btn btn-primary" id="submit">수정</button>
                <button type="button" class="btn btn-danger" id="delete" onclick="deleteButtonClick();">삭제</button>
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
      $('#repeat-end_date').datepicker();

      $('#reservationtime').daterangepicker({
        timePicker         : true,
        timePickerIncrement: 30,
        format             : 'MM/DD/YYYY h:mm A'
      })
      
      $('#repeat-select').val('<%=s.getRepeatCategory()%>').attr("selected","selected");
      $('#repeat-cycle').val('<%=s.getRepeatCycle()%>').attr("selected","selected");
      
      if($('#repeat-select').val()!='반복 없음'){
    	  if($('#repeat-select option:selected').val() == '매주(요일지정)'){
              $('#day-checkbox').show();
            }else{
              $('#day-checkbox').hide();
            }
            $('#repeat-cycle').show();
            $('#repeat-end').show();
            $('#repeat-end_date').attr("required",true);

      }
    });
    
    $('#submit').click(function(){
      console.log($('#repeat-select option:selected').val());
    });

    $('#repeat-select').change(function(){
      if($('#repeat-select option:selected').val() == '반복 없음'){
        $('#repeat-cycle').hide();
        $('#repeat-end').hide();
      }else{
        if($('#repeat-select option:selected').val() == '매주(요일지정)'){
          $('#day-checkbox').show();
        }else{
          $('#day-checkbox').hide();
        }
        $('#repeat-cycle').show();
        $('#repeat-end').show();
        
        $('#repeat-end_date').attr("required",true);
      }
            
    });
    
	function deleteButtonClick(){
		location.href="<%=request.getContextPath()%>/calendar/calendarDelete?scheduleId=<%=s.getScheduleId()%>";
	}
    
    

    </script>







<%@ include file="/views/common/footer.jsp"%>