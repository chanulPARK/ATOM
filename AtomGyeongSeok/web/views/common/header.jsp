<%@page import="atom.employee.model.vo.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Employee empLoggedIn = (Employee)session.getAttribute("empLoggedIn");
    	
    %>
    
    
    
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>기본 페이지</title>
    
    <!-- 부트스트랩 -->
    <link href="<%=request.getContextPath()%>/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:700" rel="stylesheet">
    
    <!-- awesome font -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/dist/fonts/font-awesome-4.7.0/css/font-awesome.min.css">

    <!-- jQuery -->
    <script src='<%=request.getContextPath()%>/dist/lib/jquery.min.js'></script>
	
	<!-- 메인 css -->
    <link href="<%=request.getContextPath()%>/dist/css/main.css" rel="stylesheet">
    
    <style>
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
  </style>
 
    
    
    
    
    
    </head>
  
  
  
  
  <body>

    
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                
                
                <!-- 추가부분!  -->
       				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				        <span class="icon-bar"></span>	<!-- 모바일웹일때 3줄 보이게 하는것 -->
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>                        
      				</button>    
                
                
                
              		<!-- 로고 클릭시 메인 홈으로 이동 -->
                    <a class="navbar-brand" href="<%=request.getContextPath()%>">
                        <img src="<%=request.getContextPath()%>/dist/img/login.png">
                    </a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="myNavbar">
	                <ul class="nav navbar-nav">
	                    <li><a href="<%=request.getContextPath()%>/views/default.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a></li>
	                    <li><a href="electronicApproval.jsp">전자결재</a></li>
	                    <li><a href="<%=request.getContextPath()%>/schedule/scheduleList">일정</a></li>
	                    <li><a href="#">업무관리</a></li>
	                    <li><a href="#">게시판</a></li>
	                   
	                   <!-- 일단 내 페이지에서 관리자인지 아닌지 분기 하기 -->
	                   <%if(empLoggedIn.getAdminCode().trim().equals("1")){ %>
                       			<!-- 관리자  -->
                       <li><a href="<%=request.getContextPath()%>/emp/selectAll">조직도</a></li>
                       <%} else { %>
                       			<!-- 사용자  -->
                       <li><a href="<%=request.getContextPath()%>/attendance/userDay">조직도</a></li>
                       <%} %>
	           
	                    <li><a href="#">근태관리</a></li>
	                </ul>
	                
	                
	                <ul class="nav navbar-nav navbar-right">
	                	<li><h5 style='color:#777;margin-top:15px;'><%=empLoggedIn.getEmpId().equals("admin")?"":"00부 인턴"%> <%=empLoggedIn.getEmpName()%>님 안녕하세요&nbsp;</p></li>
	                    <li class="dropdown">
		                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span></a>
		                    <ul class="dropdown-menu" role="menu">
		                        <li><a href="#">마이페이지</a></li>
		                        <li><a href="#">설정</a></li>
		                        <li class="divider"></li>
		                        <li><a href="<%=request.getContextPath()%>/logout">로그아웃</a></li>
		                    </ul>
	                    </li>
	                </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
  