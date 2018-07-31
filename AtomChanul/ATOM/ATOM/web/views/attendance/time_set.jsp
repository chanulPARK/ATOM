<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ include file="/views/common/attendanceAside.jsp" %>

<link href="<%=request.getContextPath()%>/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/dist/js/bootstrap.min.js"></script>
<link href="<%=request.getContextPath() %>/dist/css/datepicker.css" rel="stylesheet" >
<script src="<%=request.getContextPath()%>/dist/js/datepicker.js"></script>
<link href="<%=request.getContextPath() %>/dist/css/bootstrap-timepicker.css" rel="stylesheet" >
<script src="<%=request.getContextPath()%>/dist/js/bootstrap-timepicker.js"></script>

    <script>
    $(function(){
        $('.dateset').datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy/mm/dd",
            language: "kr"
        });
        $(".atttime").timepicker({
        	minuteStep:1,
        	defaultTime:'9:00 AM',
        	showMeridian:false /* 24시모드 */
        });
        $(".leavetime").timepicker({
        	minuteStep:1,
        	defaultTime:'6:00 PM',
        	showMeridian:false /* 24시모드 */
        });
        $(".lunchtime").timepicker({
        	minuteStep:1,
        	defaultTime:'12:00 PM',
        	showMeridian:false /* 24시모드 */
        });
    });
    </script>

    <section>
        <div class="content">
           <div class='col-lg-12'>
                <h3 class="page-header">기준시간 설정</h3>
                <!-- 조회 화면 -->
                <div class='row'></div>
                <div class="panel panel-default">
                    <div class='panel-heading'>
                        <!-- <i class="fas fa-users"></i> -->
                        <h4>기준시간 설정</h4>
                    </div>
                    <div class="panel panel-body table-responsive form-group">
                        <table class="table table-hover">
                            <tr>
                                <th>날짜</th>
                                <td class='input-group'>
                                    <span class='input-group-addon' id='basic-addon2'>
                                        <i class="fa fa-calendar" aria-hidden="true"></i>
                                    </span>
                                    <input type="text" id='dateset' class='input-date dateset form-control' placeholder="시작 날짜 선택">
                                    <span class='input-group-addon' style="background-color: #fff;border: none">부터 적용</span>
                                </td>
                            </tr>
                            <tr>
                                <th>출근시간</th>
                                <td><input type="text" class="atttime form-control"></td>
                            </tr>
                            <tr>
                                <th>퇴근시간</th>
                                <td><input type="text" class="leavetime form-control"></td>
                            </tr>
                            <tr>
                                <th>점심시간</th>
                                <td><input type="text" class="lunchtime form-control"></td>
                            </tr>
                        </table>
                    </div>
                    <div class="panel-footer">
                        <button type="button" class="btn btn-primary">저장</button>
                        <button type="button" class="btn btn-default">취소</button>
                    </div>
                </div>
            </div>
        </div>
    </section>  


<%@ include file="/views/common/footer.jsp" %>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
