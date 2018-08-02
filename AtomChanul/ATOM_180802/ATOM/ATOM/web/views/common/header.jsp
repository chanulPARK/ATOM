<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="atom.employee.model.vo.Employee"%>
<%
   	Employee empLoggedIn = (Employee)session.getAttribute("empLoggedIn");
%>
<!-- <!DOCTYPE html> -->
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>기본 페이지</title>

<!-- 부트스트랩 -->
<link href="<%=request.getContextPath()%>/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:700" rel="stylesheet">
<!-- awesome font -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/dist/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!-- jstree css -->
<link href="<%=request.getContextPath()%>/dist/css/jstree/style.min.css" rel="stylesheet">
<!-- datepicker css -->
<link href="<%=request.getContextPath()%>/dist/css/datepicker.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/dist/css/daterangepicker-bs3.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/dist/css/daterangepicker-bs3.css" rel="stylesheet">
<!-- tablesorter -->
<link href="<%=request.getContextPath()%>/dist/css/blue/style.css" rel="stylesheet">
<!-- style css -->
<link href="<%=request.getContextPath()%>/dist/css/style.css" rel="stylesheet">

<!-- script -->
<!-- nicEdit -->
<script type="text/javascript" src="http://js.nicedit.com/nicEdit-latest.js"></script>

<!-- jquery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>

<body>
	<header>
		<nav class="navbar navbar-inverse navbar-fixed-top" style="border: 0; border-radius: 0; margin: 0;">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
			        <span class="icon-bar"></span>	<!-- 모바일웹일때 3줄 보이게 하는것 -->
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>                        
   				</button>
					<!-- <a class="navbar-brand" href="#">Brand</a> -->
					<a class="navbar-brand" href="<%=request.getContextPath()%>">
						<img src="<%=request.getContextPath()%>/dist/img/main.png" style="margin-top: -4px">
					</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="<%=request.getContextPath()%>/views/main.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a></li>
						<li><a href="<%=request.getContextPath()%>/electronic/electronicWaitingBox">전자결재</a></li>
	                    <li><a href="<%=request.getContextPath()%>/schedule/scheduleList">일정</a></li>
						<li><a href="<%=request.getContextPath()%>/task/taskList?empId=<%=empLoggedIn.getEmpId()%>">업무관리</a></li>
						<li><a href="<%=request.getContextPath()%>/board/boardList">게시판</a></li>
						<%if(empLoggedIn.getAdminCode().trim().equals("1")){ %>
						<li id= 'resourcehome'><a href='<%=request.getContextPath() %>/admin/resourcehome'>자원관리</a></li>
						<%} else { %>
						<li id= 'resourcehome'><a href='<%=request.getContextPath() %>/user/resourseHome'>자원관리</a></li>
						<%} %>
						<li><a href="<%=request.getContextPath()%>/emp/selectAll">조직도</a></li>
	                    <!-- 근태관리 -->
						<%if(empLoggedIn.getAdminCode().trim().equals("1")){ %>
	                    <li><a href="<%=request.getContextPath()%>/attendance/dayList">근태관리</a></li>
	                    <%} else { %>
	                    <li><a href="<%=request.getContextPath()%>/attendance/userDay">근태관리</a></li>
	                    <%} %>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false"><span
								class="glyphicon glyphicon-cog" aria-hidden="true"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href='<%=request.getContextPath()%>/empView?empId=<%=empLoggedIn.getEmpId() %>'>마이페이지</a></li>
								<li><a href="#">설정</a></li>
								<li class="divider"></li>
								<li><a href="<%=request.getContextPath()%>/logout">로그아웃</a></li>
							</ul>
						</li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><h5 style='color: #f6f6f6; margin-top: 17px;'><%=empLoggedIn.getEmpId().equals("admin")?"":"00부 인턴"%>
								<%=empLoggedIn.getEmpName()%>님 안녕하세요&nbsp;
							</h5>
						</li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
	</header>