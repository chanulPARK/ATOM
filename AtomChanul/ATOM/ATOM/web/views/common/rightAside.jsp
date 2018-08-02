<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import='java.util.Date' %>

<style>
	aside div.leftmenu_top {
        background: #353b47;
        color: #fff;
        text-align: center;
        height: 50px;
    }
    aside div.leftmenu_top h3{
        padding-top: 10px;
        margin: 0;
    }
    aside div.leftmenu_top h3 a{
        font-size: 20px;
        text-decoration: none;
        padding: 0 10px;
    }
    aside div.leftmenu_top h3 a:hover{
        text-decoration: none;
        color: #fff;
    }
    aside div.leftmenu_top h3 a:active{
        text-decoration: none;
        color: #fff;
    }
    aside div.leftmenu_top h3 a:visited{
        text-decoration: none;
        color: #fff;
    }
    aside div.leftmenu_top h3 a:link{
        text-decoration: none;
        color: #fff;
    }
</style>
<style type="text/css">
    .jsCalendar.custom-purple tbody td.jsCalendar-current {
        background-color: #53b5e6;
    }
    .jsCalendar.custom-purple *::selection {
        background: #53b5e6;
    }
    .jsCalendar.custom-purple *::-moz-selection {
        background: #53b5e6;
    }
    .jsCalendar.material-theme.custom-purple thead {
        background-color: #53b5e6;
    }
    .jsCalendar.material-theme.custom-purple thead .jsCalendar-nav-left:hover,
    .jsCalendar.material-theme.custom-purple thead .jsCalendar-nav-right:hover {
        background-color: #ef00ff;
    }
    .jsCalendar.classic-theme.custom-purple thead {
        background-color: #53b5e6;
    }
    .jsCalendar.classic-theme.custom-purple thead .jsCalendar-nav-left:hover,
    .jsCalendar.classic-theme.custom-purple thead .jsCalendar-nav-right:hover {
        background-color: #ef00ff;
    }
</style>
<link href="<%=request.getContextPath()%>/dist/css/jsCalendar.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/dist/js/jsCalendar.js"></script>


<script>
	function printClock() {
	    var clock = document.getElementById("clock");		// 출력할 장소 선택
	    var currentDate = new Date();						// 현재시간
	    var calendar = currentDate.getFullYear() + "년 " + (currentDate.getMonth()+1) + "월 " + currentDate.getDate() + "일"; // 현재 날짜
	    var amPm = 'AM'; // 초기값 AM
	    var currentHours = addZeros(currentDate.getHours(),2); 
	    var currentMinute = addZeros(currentDate.getMinutes() ,2);
	    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
	    
	    if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
	    	amPm = 'PM';
	    	currentHours = addZeros(currentHours - 12,2);
	    }
	
	    if(currentSeconds >= 50){ // 50초 이상일 때 색을 변환해 준다.
	       currentSeconds = '<span style="color:#de1951;">'+currentSeconds+'</span>'
	    }
	    clock.innerHTML = "<span style='font-size:15px;'>"+calendar+"</span><br>";
	    clock.innerHTML += currentHours+":"+currentMinute+":"+currentSeconds +" <span style='font-size:10px;'>"+ amPm+"</span>"; //날짜를 출력해 줌
	    
	    setTimeout("printClock()",1000);		// 1초마다 printClock() 함수 호출
	}
	
	function addZeros(num, digit) { // 자릿수 맞춰주기
		  var zero = '';
		  num = num.toString();
		  if (num.length < digit) {
		    for (i = 0; i < digit - num.length; i++) {
		      zero += '0';
		    }
		  }
		  return zero + num;
	}
	
	window.onload = function() {                         // 페이지가 로딩되면 실행
		printClock();
	}

</script>
<style>
	.aside_right{
	    right: 0px;
	    width: 250px;
	    height: 300px;
	    position: absolute;
	    border-bottom: solid 1px rgb(222, 226, 230);
	}
</style>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
<div class="aside_right" style="height: 100%; min-height: 900px; right: 0px; background: #eaeaea; ">
	<div class="menu-calendar" style="margin: 9px 9px 20px 9px;">
		<div class="auto-jsCalendar custom-purple"></div>
	</div>
	<div class="menu_elect" style="margin: 9px;">
		<div class="list-group panel panel-default">
			<div class="panel-heading"><i class="far fa-file"></i> 전자결재</div>
			<div class="panel-body" style="text-align: center">
				<a href="<%=request.getContextPath()%>/electronic/electronicRequestBox" class="list-group-item" >결재요청함
					<span id="requestCount" class="badge"></span>
				</a>
				<a href="<%=request.getContextPath()%>/electronic/electronicWaitingBox" class="list-group-item" >결재대기함
                            <span id="waitCount" class="badge"></span>
				</a>
				<a href="<%=request.getContextPath()%>/electronic/electronicProgressBox" class="list-group-item" >결재진행함
                            <span id="progressCount" class="badge"></span>
				</a>
				<a href="<%=request.getContextPath()%>/electronic/electronicCompletionBox" class="list-group-item" >완료문서함
                            <span id="completionCount" class="badge"></span>
				</a>
				<a href="<%=request.getContextPath()%>/electronic/electronicReturnBox" class="list-group-item" >반려문서함
                            <span id="returnCount" class="badge"></span>
				</a>
			</div>
		</div>
	</div>
</div>
 <script type="text/javascript" language="javascript">
 
    $(document).ready(function(){
         
         
        $.ajax({
             
            type : "GET",
            url : "<%=request.getContextPath()%>/electronic/approvalCountServlet",
            dataType : "text",
            error : function(){
                alert('통신실패!!');
            },
            success : function(data){
            	var temp = data.split(" ");
            	$('#requestCount').text(temp[0]);
            	$('#waitCount').text(temp[1]);
            	$('#progressCount').text(temp[2]);
            	$('#completionCount').text(temp[3]);
            	$('#returnCount').text(temp[4]);
            }
             
        });
         
 
    });
 
	</script>