<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/views/common/header.jsp" %>

	<!-- niceidt -->
    <script type="text/javascript">
      bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });
    </script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/dist/js/nicEdit.js"></script>

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
         <form action ="<%=request.getContextPath()%>/calendar/calendarRegistrationFormEnd">
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
                          <input name="schedule-date" type="text" class="form-control" id="reservationtime" name="reservationtime" required>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>제목</td>
                      <td>
                        <input id="schedule-name" name="schedule-name" class="form-control" placeholder="제목" required>
                      </td>
                    </tr>
                    <tr>
                      <td>장소</td>
                      <td>
                        <input id="schedule-place" name="schedule-place" class="form-control" placeholder="장소">
                      </td>
                    </tr>
                    <tr>
                      <td>반복</td>
                      <td>
                        <select class="form-control" id="repeat-select" name="repeat-select" style="width: 100%;">
                          <option selected="selected">반복 없음</option>
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
                        <!-- <select name="repeat-cycle" class="form-control" style="width:10%;display:inline">
                          <option>1</option>
                          <option>2</option>
                          <option>3</option>
                          <option>4</option>
                          <option>5</option>
                          <option>6</option>
                          <option selected="selected">7</option>
                          <option>8</option>
                          <option>9</option>
                          <option>10</option>
                        </select>
                        주/개월/년 &nbsp; -->
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
                          <input name="repeat-end" type="text" class="form-control" id="repeat_end_date">
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>내용</td>
                      <td>
                        <textarea name="schedule-content" rows="8" cols="80" class="form-control" name="schedule-content"></textarea>
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
                <button type="submit" class="btn btn-primary" id="submit">등록</button>
                <button type="reset" onclick = "history.go(-1)" class="btn btn-default">취소</button>
              </div>

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
  
    });
    $('#submit').click(function(){
      console.log($('#repeat-select option:selected').val());
    });

    $('#repeat-select').change(function(){
      if($('#repeat-select option:selected').val() == '반복 없음'){
        $('#repeat-end').hide();
        $('#repeat_end_date').attr("required",false);

      }else{
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

    </script>
    
<%@ include file="/views/common/footer.jsp" %>

