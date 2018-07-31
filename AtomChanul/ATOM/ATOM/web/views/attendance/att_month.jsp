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
        $('.dateday').datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy/mm",
            language: "kr",
            /* 기본값 설정 */
        });
    });
    </script>

    <section>
        <div class="content">
            <div class='col-lg-12'>
                <h3 class="page-header">월별근태조회</h3>
                <!-- 사원 검색 (부서별 검색, 직급별 검색) -->
                <div class='col-md-12 well'>
                    <div class='col-md-8'>
                        <h5 class='col-md-2'>사원별 조회</h5>
                        <!-- 날짜 선택 -->
                        <div class='input-group col-md-4'>
                            <span class='input-group-addon' id='basic-addon2'>
                            <i class="fa fa-user"></i>
                            </span>
                            <!-- 날짜 입력 -->
                            <input type="text" id='person' class='input-text form-control' placeholder="조회할 사원명 입력">
                        </div>
                    </div>
                    <!-- 조회 버튼 -->
                    <div class='col-md-2'>
                        <button type='button' id='searchDate' class='btn btn-color5'>
                            <i class='fa fa-search fa-fw'></i>검색
                        </button>
                    </div>
                </div>
                
                <div class='row'></div>
                <!-- 월별 출석 통계 조회 -->
                <div class="panel panel-default">
                    <div class='panel-heading' style="display: inline-flex;">
                        <h5>날짜 조회</h5>&nbsp;&nbsp;&nbsp;&nbsp;
                        <!-- 년 월 입력받아 조회 -->
                        <div class='input-group col-md-2'>
                            <span class='input-group-addon' id='basic-addon2'>
                                <i class="fa fa-calendar" aria-hidden="true"></i>
                            </span>
                            <!-- 날짜 입력 -->
                            <input type="text" id='dateday' class='input-date dateday form-control' placeholder="조회할 날짜 선택">
                        </div>
                        <div class='col-md-2'>
                            <button type='button' id='searchDate' class='btn btn-color5'>
                                <i class='fa fa-search fa-fw'></i>검색
                            </button>
                        </div>
                        <div class='col-md-2'>
                            <h5>총 근무일 : 20일</h5>
                        </div>
                        <div class='col-md-2' >
                            <select class='form-control' name="att" id="att">
                                <option value="우수사원">우수사원순</option>
                                <option value="직급">직급순</option>
                                <option value="이름">이름순</option>
                            </select>
                        </div>
                    </div>
                    <div class="panel-body table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>부서</th>
                                    <th>직급</th>
                                    <th>사원명</th>
                                    <th>날짜</th>
                                    <th>출근일수</th>
                                    <th>지각횟수</th>
                                    <th>조퇴횟수</th>
                                    <th>결근일수</th>
                                    <th>총 근무시간</th>
                                    <th>출근률</th>
                                    <th>남은 휴가 수</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>영업1팀</td>
                                    <td>대리</td>
                                    <td>사람</td>
                                    <td>2018년 7월</td>
                                    <td>19일</td>
                                    <td>1일</td>
                                    <td>0일</td>
                                    <td>0일</td>
                                    <td>50:21</td>
                                    <td>98.2%</td>
                                    <td>13일</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="panel-footer"></div>
                </div>
            </div>
        </div>
    </section> 


<%@ include file="/views/common/footer.jsp" %>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
