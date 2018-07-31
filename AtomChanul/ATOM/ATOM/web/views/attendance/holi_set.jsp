<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ include file="/views/common/attendanceAside.jsp" %>

<link href="<%=request.getContextPath()%>/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/dist/js/bootstrap.min.js"></script>
<link href="<%=request.getContextPath() %>/dist/css/datepicker.css" rel="stylesheet" >
<script src="<%=request.getContextPath()%>/dist/js/datepicker.js"></script>

    <script>
    $(function(){
        $('.dateholi').datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy/mm/dd",
            language: "kr"
        });
    });
    </script>

    <section>
        <div class="content">
           <div class='col-lg-12'>
                <h3 class="page-header">휴일 설정</h3>
                <!-- 조회 화면 -->
                <div class='row'></div>
                <div class="panel panel-default">
                    <div class='panel-heading'>
                        <!-- <i class="fas fa-users"></i> -->
                        <h4>휴일/공휴일 설정</h4>
                    </div>
                    <div class="panel panel-body table-responsive form-group">
                        <table class="table table-hove">
                            <tr>
                                <th>날짜</th>
                                <td class='input-group'>
                                    <span class='input-group-addon' id='basic-addon2'>
                                        <i class="fa fa-calendar" aria-hidden="true"></i>
                                    </span>
                                    <input type="text" id='date' class='dateholi form-control' placeholder="시작 날짜 선택">
                                    <span class='input-group-addon' style="background-color: #fff;border: none">~</span>
                                    <span class='input-group-addon' id='basic-addon2'>
                                        <i class="fa fa-calendar" aria-hidden="true"></i>
                                    </span>
                                    <input type="text" id='date' class='dateholi form-control' placeholder="끝 날짜 선택">
                                </td>
                            </tr>
                            <tr>
                                <th>이름</th>
                                <td><input type="text" class="form-control" placeholder="휴일이름 설정"></td>
                            </tr>
                            <tr>
                                <th>내용</th>
                                <td><textarea name="note" id="note" cols="100" rows="5" style="resize: none;width:100%"></textarea></td>
                            </tr>
                        </table>
                    </div>
                    <div class="panel-footer">
                        <button type="button" class="btn btn-primary">등록</button>
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
