<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.mvc.board.vo.Board"%>
<% 
	String[] items = {"공지사항", "자유게시판", "자료실", "설문조사", "게시판 관리"};
	String[] homes = {"notice", "collapse1", "data", "question", "collapse2"};
	List<Board> lBoard = (List<Board>)request.getAttribute("board");
/* 	Employee e= (Employee)request.getAttribute("empLoggedIn"); */
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>기본 페이지</title>
	<link href="<%=request.getContextPath()%>/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:700" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/dist/css/mm-vertical.css" rel="stylesheet">
	<link href='<%=request.getContextPath()%>/dist/css/style.css'>
	<link href='<%=request.getContextPath()%>/dist/css/rsc-user.css' rel='stylesheet'>
	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src='<%=request.getContextPath()%>/dist/js/jquery-3.3.1.min.js'></script>
	<script src='<%=request.getContextPath()%>/dist/js/bootstrap.min.js'></script>
</head>
	<body>
	    <header>
	        <nav class="navbar navbar-default">
	            <div class="container-fluid">
	                <!-- Brand and toggle get grouped for better mobile display -->
	                <div class="navbar-header">
	                <!-- <a class="navbar-brand" href="#">Brand</a> -->
	                    <a class="navbar-brand" href="#">
	                        <img src="<%=request.getContextPath()%>/dist/images/login.png">
	                    </a>
	                </div>
	            
	                <!-- Collect the nav links, forms, and other content for toggling -->
	                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	                <ul class="nav navbar-nav">
	                    <li class="active"><a href="#"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a></li>
	                    <li><a href="#">전자결재</a></li>
	                    <li><a href="#">일정</a></li>
	                    <li><a href="#">업무관리</a></li>
	                    <li><a href="<%=request.getContextPath()%>/board/boardList.jsp?notice">게시판</a></li>
	                    <li><a href="#">조직도</a></li>
	                    <li><a href="#">근태관리</a></li>
	                </ul>
	                <ul class="nav navbar-nav navbar-right">
	                    <li class="dropdown">
	                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                    	<span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
	                    </a>
	                    <ul class="dropdown-menu" role="menu">
	                        <li><a href="#">마이페이지</a></li>
	                        <li><a href="#">설정</a></li>
	                        <li class="divider"></li>
	                        <li><a href="#">로그아웃</a></li>
	                    </ul>
	                    </li>
	                </ul>
	                </div><!-- /.navbar-collapse -->
	            </div><!-- /.container-fluid -->
	        </nav>
	    </header>

	    <aside id='show'>
	        <div class="content-fluid">
	            <div class="panel-group">
	                <div class="panel panel-default">
	                	<%for(int i=0;i<items.length;i++){%>
	                		<div class='panel-heading'>
	                			<h4 class='panel-title'>
	                				<%if(i==1 || i==4){%>
	                					<a data-toggle='collapse' href='#<%=homes[i]%>'>
	                						<%=items[i]%>
	                					</a>
	                				<%}else{%>
	                					<a href='<%=request.getContextPath()%>/board/boardList.jsp?<%=homes[i]%>'>
	                						<%=items[i]%>
	                					</a>
	                				<%}%>
	                			</h4>
	                		</div>
	                		<%if(i==1){%>
			                	<div id='<%=homes[i]%>' class='panel-collapse collapse'>
			                		<div class='panel1'>
			                			<a href='<%=request.getContextPath()%>/board/boardList.jsp?dept1'>
			                				부서 1팀
			                			</a>
			                		</div>
			                		<div class='panel2'>
			                			<a href='<%=request.getContextPath()%>/board/boardList.jsp?dept2'>
			                				부서 2팀
			                			</a>
			                		</div>
			                	</div>
			                <%}else if(i==4){%>
			                	<div id='<%=homes[i]%>' class='panel-collapse collapse'>
			                		<div class='panel1'>
			                			<a href='<%=request.getContextPath()%>/board/createboard.jsp'>
			                				게시판 생성
			                			</a>
			                		</div>
			                		<div class='panel2'>
			                			<a href='<%=request.getContextPath()%>/board/delboard.jsp'>
			                				게시판 삭제
			                			</a>
			                		</div>
			                	</div>
			                <%} %>
	                  <%} %>
	                  <script>
	                  	$('#collapse1').click(function(){
	                  		$('.panel1').toggle("slow");
	                  		$('.panel2').toggle("slow");
	                  	});
	                  	$('#collapse2').click(function(){
	                  		$('.panel1').toggle("slow");
	                  		$('.panel2').toggle("slow");
	                  	});
	                  </script>
	                </div>
	            </div>
	        </div>
	    </aside>
    <section>