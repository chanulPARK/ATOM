<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>

<head>
	<!-- 부트스트랩 파일 -->
	 <link href="../resource/css/bootstrap.min.css" rel="stylesheet">
     <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:700" rel="stylesheet">
    
	  <!--   외부 css 파일 -->
	  <link rel = "stylesheet" type="text/css" href="../resource/css/rsc-user.css">
	  
	  <!--   날짜 및 시간 설정 -->
	  <link rel = "stylesheet" href="../resource/css/jquery.datetimepicker.min.css">
	  <script src ="../resource/js/jquery.js" ></script>					
	  <script src = "../resource/js/jquery.datetimepicker.full.js"></script>
	  <!-- 사이드바  -->
	 <!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
	  
	  <title>예약 관리</title>
	  
	  <script>
	  
	  //예약 버튼 confirm 창
		 $(function () 
	   	{
			 $('#resconfirmbtn').click(function() 
			{
				if(confirm("예약 하시겠습니까?")==true)
				{
					alert("예약 요청이 완료 되었습니다.")
				}
				else
				{
					return;
				}	
			});
		});	
	  
	  
	  </script>
</head>

<body>	

<header>
        <nav class="navbar navbar-default">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">
                        <img src="../resource/login.png">
                    </a>
                </div>
            
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a></li>
                    <li><a href="#">전자결재</a></li>
                    <li><a href="#">일정</a></li>
                    <li><a href="#">업무관리</a></li>
                    <li><a href="#">게시판</a></li>
                    <li><a href="rsc_user_home.jsp">자원</a></li>
                    <li><a href="#">조직도</a></li>
                    <li><a href="#">근태관리</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span></a>
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

	 <aside>
	 
	 <div class="content-fluid">
		 <div class="panel-group">
	    	<div class="panel panel-default">
	      
	      	<div class="panel-heading">
	        	<h4 class="panel-title">
	          	<a data-toggle="collapse" href="#collapse1">자원 예약 메뉴</a>
	        	</h4>
	       </div>
	       
	       <div id="collapse1" class="panel-collapse collapse">
	      	  <div class="panel-body">
	       		<a href="rsc_user_home.jsp">자원 예약 홈</a>
	          </div>
	        
	        <div class="panel-footer">
	     		<a href="rsc_user_reservation.jsp">나의 예약 리스트</a>
	        </div>
	        
	      </div>
	    </div>
	  </div>
	</div>
    
    </aside>

    <section>
        <div class="content-fluid">
        
            <div class="col-md-8, floatleft">
                <h3>자원 예약</h3>
                
              <!-- =======  자원 관리 페이지 상단의 알림창 부분 ========= -->
                     
                <div class="alert alert-info">
  					<span class="glyphicon glyphicon-bullhorn"></span>	
    		
    				<div>
    					<p class="marginzero">1. 예약하고자 하는 자원은 하단  <kbd class="kbdfont">예약</kbd>버튼으로 예약 접수 할 수 있습니다.		
 			 								  2. 접수가 완료 되면 관리자 검토 후 자원 승인 또는 반려가 될 수 있습니다.</p>
    					</div>	
 			 			<div>					  
 			 			<p class="marginzero">3. 사용 완료된 자원은 <kbd class="kbdfont">나의 예약리스트</kbd>를 통해 필히 반납해주시길 바랍니다.
 			 			4. 예약 시간 중복은 허용되지 않으며, 급한 용무가 있다면 미리 예약을 해두시길 바랍니다.</p>
 			 			</div>	
  			 	</div>
			</div>
 			
 			<!-- =======  자원 관리 페이지 상단의 알림창 부분 끝 ========= -->
	
			 <!-- ================ 자원리스트 ================= -->
			 
 			<div class="col-sm-12 well rsclist">
 			
 				<!--=============== 검색 창=============== -->
 				<div class="input-group col-sm-5">
                	<div class="input-group-btn search-panel">
	                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
	                    	<span id="search_concept">
	                    	카테고리
	                    	</span> 
	                    	<span class="caret"></span>
	                    </button>
	                    
	                    <ul class="dropdown-menu" role="menu">
	                      <li><a href="#">공간</a></li>
	                      <li><a href="#">물품</a></li>
	                      <li><a href="#">법인 차량</a></li>
	                    </ul>
	           	 </div>
	           	 
                <input type="hidden" name="search_param" value="all" id="search_param">         
                <input type="text" class="form-control" name="x" placeholder="검색">
                
                <span class="input-group-btn">
                    <button class="btn btn-default" type="submit">
                	    <span class="glyphicon glyphicon-search"></span>
                    </button>
                </span>
            </div>
  
  			<br>
  			
  				<!--=============== 검색 창 끝=============== -->
  			
 			<table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col"  class="text-center">자원 분류</th>
                            <th scope="col"  class="text-center">자원 코드</th>
                            <th scope="col"  class="text-center">자원 명</th>
                            <th scope="col"  class="text-center">예약 상태</th>  
                        </tr>
                    </thead>
                    <tbody class="table-condensed">
                        <tr>
                            <td class="text-center">공간</td>
                            <td class="text-center">001</td>
                            <td class="text-center">2F 회의실 2A</td>
                            <td class="text-center">
                            <button type="button" class="btn btn-success btn-sm disabled">예약 가능</button>
                          
                        </tr>
                        <tr>
                            <td class="text-center">공간</td>
                            <td class="text-center">002</td>
                            <td class="text-center">8F 대강당</td>
                            <td class="text-center">
                            <button type="button" class="btn btn-danger btn-sm disabled">예약 불가</button>
                            
                        </tr>
                        <tr>
                            <td class="text-center">물품</td>
                            <td class="text-center">003</td>
                            <td class="text-center">캐논 80D 카메라 1pc</td>
                            <td class="text-center"><button type="button" class="btn btn-success btn-sm disabled">예약 가능</button></td>
                           
                        </tr>
                        <tr>
                            <td class="text-center">법인 차량</td>
                            <td class="text-center">004</td>
                            <td class="text-center">페라리</td>
                            <td class="text-center"><button type="button" class="btn btn-danger btn-sm disabled">예약 불가</button></td>
                         
                        </tr>
                    </tbody>
                </table>
                
                
                <!-- =============페이징 버튼=============== -->
                
            	    <nav style="text-align: center"> 
                    <ul class="pagination pagination-sm pagingbtn">
                        <li>
					      <a href="#" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span> <!-- 뒤로 -->
					      </a>
					      
					    </li>
					    <li><a href="#">1</a></li>
					    <li><a href="#">2</a></li>
					    <li><a href="#">3</a></li>
					    <li><a href="#">4</a></li>
					    <li><a href="#">5</a></li>
					    <li>
					    
					      <a href="#" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span> <!-- 앞으로 -->
					      </a>
					      
					    </li>
					  </ul>
                      <!-- =============페이징 버튼 끝=============== -->

 					<button type="button" class="btn btn-default btn-sm floatright" data-toggle="modal" 
	 			 data-target="#myModalusres" >예약</button>
	 			 
	 			  </nav>
	 			 
	 			
 					
 					<!-- 모달 부분 -->
	 				<div class="modal fade" id="myModalusres" role="dialog">
				    <div class="modal-dialog">
				    
				      <!-- Modal 내용-->
				      <div class="modal-content">
				      
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				         <h3 class="txtcenter">예약하기</h3>
				         </div> 
				         
				          <div class="modal-body">
				          
				           <div class="row">
							    <div class="col-xs-4 col-md-4">
							    
							    <label>자원 분류</label>
									 <select class="form-control" id="sel1">
									    <option>공간</option>
									    <option>물품</option>
									    <option>법인 차량</option>
								  </select>							     
							    </div>
							    
							    <div class="col-xs-4 col-md-4">
							    <label>자원 코드</label>
							      <input type="text" name="rsc_code" class="form-control input-sm" placeholder="001" />
							    </div>
							    
							    <div class="col-xs-4 col-md-4">
							    <label>자원 명</label>
							      <input type="text" name="rsc_name" class="form-control input-sm" placeholder="벤츠 지바겐" />
							      <br>
							    </div>
						 </div>
						 
						   <div class="row">
							    <div class="col-xs-4 col-md-4">
							     <label>사원 번호</label>
							      <input type="text" name="emp_no" class="form-control input-sm" placeholder="사원번호 " />
							    </div>
							    
							    <div class="col-xs-4 col-md-4">
							     <label>사원 명</label>
							      <input type="text" name="emp_name" class="form-control input-sm" placeholder="사원 명 " />
							      <br>
							    </div>
				          </div>
				          
				           <div class="row">
					           	 <div class="col-xs-4 col-md-4 floatleft">
					           	 <label>예약 시작 시간</label>
					           	 <br>
					           	 <input id="datetime_s" class="input-medium" name="start_time" placeholder="시작 시간" />
					           	 
					           	 <script>
					           	 	$("#datetime_s").datetimepicker();
					           	 </script>
					       		</div>
					       		
					       		 <div class="col-xs-4 col-md-4 ">
					           	 <label>예약 완료 시간</label>
					           	 <br>
					           	 <input id="datetime_f" class="input-medium" name="start_time" placeholder="만료 시간" />
					           	 
					           	 <script>
					           	 	$("#datetime_f").datetimepicker();
					           	 </script>
				        		  </div>
				           </div>
				          
				        </div>
				    
				        <div class="modal-footer">
				         <button id="resconfirmbtn" type="button" class="btn btn-default" >예약하기</button>  
				         </div>   
				         
					 </div>
				    </div>
				  </div>
 			<!--끝 모달 부분 끝-->
				</div>		 
 			</div>

 		    <!-- 끝 ================ 자원 리스트  ================= 끝-->

    </section>

    <footer>
        <p>COPYRIGHT @ ATOM ALL RIGHTS RESERVED</p>
    </footer> 

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="../resource/js/bootstrap.min.js"></script>
   </body>
</html> 
