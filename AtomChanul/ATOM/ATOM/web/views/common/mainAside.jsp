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
<aside>
	<div class="leftmenu_top">
        <h3>
            <a href="#">근태관리</a>
        </h3>
    </div>
    <div class="leftmenu_attr">
        <div class="panel panel-default">
			<div class="panel-heading">근태관리</div>
			<div class="panel-body" style="text-align: center">
				<div style="margin: 10px; border:5px solid #79a5e7; border-radius:50px; width:200px; height:90px; line-height:30px; color:#666; font-size:30px; text-align:center;" id="clock"></div>
				<button class="btn btn-default">출근하기</button>
				<button class="btn btn-default">퇴근하기</button>
			</div>
		</div>
    </div>
</aside>