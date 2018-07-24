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

    <style>
        * {box-sizing: border-box;font-family: 'Nanum Gothic', sans-serif;}
        body ,header{margin: 0px;}
        header{
            color: #fff!important;
            border-bottom: 1px solid rgb(153, 153, 153);
            height: 60px;
            position: relative;
            display: block;
        }
        aside{
            margin-top: 30px;
            left: 0px;
            width: 250px;
            height: 300px;
            display: block;
            position: absolute;
            /* position: fixed; */
            border-bottom: solid 1px rgb(222, 226, 230);
            background: rgb(222, 226, 230);
        }
        section{
            padding: 20px;
            /* padding-left: 20px;
            padding-right: 20px; */
            background: rgb(255, 255, 255);
            border-left: 1px solid rgb(222, 226, 230);
            width: 100%-250px;
            /* height: 500px; */
            margin-left: 250px;
            /* background : palegreen; */
            min-height: 675px;
            display: block;
        }
        footer{
            width: 100%;
            height: 40px;
            border-top: 1px solid rgb(222, 226, 230);
            display: block;
        }
        footer > p{
            font-size: 12px;
            text-align: end;
            color: rgb(153, 153, 153);
        }
        /* border-bottom: solid 1px rgb(153, 153, 153); */
        /* border-bottom: solid 1px rgb(222, 226, 230); */

        .schedule-group{
           style=padding-bottom: 10px;
           display: block;
           text-align:left;
           width: 100%;

        }
        .schedule-group > input{
          /* vertical-align: middle; */
        }

        .input-group{
          display: inline;
        }

    </style>
    
    </head>
  <body>

    <header>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                <!-- <a class="navbar-brand" href="#">Brand</a> -->
                    <a class="navbar-brand" href="#">
                        <img src="<%=request.getContextPath()%>/dist/img/login.png">
                    </a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	                <ul class="nav navbar-nav">
	                    <li><a href="<%=request.getContextPath()%>/views/default.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a></li>
	                    <li><a href="<%=request.getContextPath()%>/electronic/electronicWaitingBox">전자결재</a></li>
	                    <li><a href="<%=request.getContextPath()%>/schedule/scheduleList">일정</a></li>
	                    <li><a href="#">업무관리</a></li>
	                    <li><a href="#">게시판</a></li>
	                    <li><a href="#">조직도</a></li>
	                    <li><a href="#">근태관리</a></li>
	                </ul>
	                <ul class="nav navbar-nav navbar-right">
	                	<li><h5 style='color:#777;margin-top:15px;'><%=empLoggedIn.getEmpId().equals("admin")?"":empLoggedIn.getDeptName() + " " + empLoggedIn.getJobName()%> <%=empLoggedIn.getEmpName()%>님 안녕하세요&nbsp;</p></li>
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
    </header>