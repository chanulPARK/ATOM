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
	  <!--  -->
	  
 	 <!-- 사이드바  -->
	<!--  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">   -->
	

	  <title>예약 관리</title>
	  
	  <script>
	  
	  //승인 버튼 confirm 창
		 $(function () 
	   	{
			 $('#okconfirmbtn').click(function() 
			{
				if(confirm("승인 하시겠습니까?")==true)
				{
					alert("승인 되었습니다.")
				}
				else
				{
					return;
				}	
			});
		});	
	  
		 //반려 버튼 confirm 창
		 $(function () 
	   	{
			 $('#noconfirmbtn').click(function() 
			{
				if(confirm("반려 하시겠습니까?")==true)
				{
					alert("반려 되었습니다.")
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
                    <li><a href="#">자원</a></li>
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
	          	<a data-toggle="collapse" href="#collapse1">자원 관리 메뉴</a>
	        	</h4>
	       </div>
	       
	       <div id="collapse1" class="panel-collapse collapse">
	      	  <div class="panel-body">
	       		<a href="rsc_admin_home.jsp">자원 관리 홈</a>
	          </div>
	        
	        <div class="panel-footer">
	     		<a href="rsc_admin_reservation_manager.jsp">승인 요청 현황</a>
	        </div>
	        
	      </div>
	    </div>
	  </div>
	</div>
	
    </aside>


    <section>
        <div class="content-fluid">
        
            <div class="col-md-8, topinfo">
                <h3>예약 요청 현황</h3>
                
                <div class="alert alert-info">
    
    					<span class="glyphicon glyphicon-bullhorn"></span>	
    					
    					<div>
    					<p class="marginzero">
    					1. 관리자는 하단  <kbd class="kbdfont">추가</kbd>  <kbd class="kbdfont">수정</kbd>  
    					<kbd class="kbdfont">삭제</kbd>버튼으로 자원 정보를 관리할 수 있습니다.	<br>
 			 			2. 사용자에게서 받은 예약 승인 건에 대해 승인을 할 때 중복된 시간은 없는지, 반려 대상인지등을 고려 후 승인을 해주시기 바랍니다. <br></p>
 			 			3. 예약된 자원의 반납이 잘 이루어지는지 수시로 체크해주시길 바랍니다.
    					</div>	
 			 			
  			 	</div>  
 			</div>
 			
	
			 <!-- ================ 자원리스트 ================= -->
			 
 			<div class="col-sm-12 well s3list">
 			<table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col"  class="text-center">자원 분류</th>
                            <th scope="col"  class="text-center">자원 코드</th>
                            <th scope="col"  class="text-center">자원 명</th>
                            <th scope="col"  class="text-center">예약 상태</th>
                            <th scope="col"  class="text-center">예약 신청 날짜</th>
                            <th scope="col"  class="text-center">반납 여부</th>
                        </tr>
                    </thead>
                    <tbody class="table-condensed">
                        <tr>
                            <td class="text-center">공간</td>
                            <td class="text-center">001</td>
                            <td class="text-center">2F 회의실 2A</td>
                            <td class="text-center">
                            <span class="label label-default"> 반려 </span>
                            </td>
                            <td class="text-center"> 2018/07/25 13:00 ~ 2018/07/25 16:00</td>
                            <td></td>
                        </tr>
                        
                        <tr>
                            <td class="text-center">물품</td>
                            <td class="text-center">003</td>
                            <td class="text-center">맥북</td>
                            <td class="text-center">
                            <span class="label label-success"> 예약 승인 </span>
                            </td>
                            <td class="text-center">2018/07/11 17:00 ~ 2018/07/11 20:00</td>
                            <td><span class="label label-danger text-center">미납</span></td>
                        </tr>
                        
                        <tr>
                            <td class="text-center">법인 차량</td>
                            <td class="text-center">008</td>
                            <td class="text-center">벤츠 지바겐</td>
                            <td class="text-center">
                            <span class="label label-success"> 예약 승인 </span>
                            </td>
                            <td class="text-center">2018/07/1 16:00 ~ 2018/07/1 20:00</td>
                            <td><span class="label label-primary">반납 완료</span></td>
                        </tr>
                        
                        
                        <tr>
                            <td class="text-center">공간</td>
                            <td class="text-center">001</td>
                            <td class="text-center">2F 회의실 2A</td>
                            <td class="text-center">
                            <span class="label label-warning"> 승인 대기 </span>
                            </td>
                            <td class="text-center">2018/07/25 13:00 ~ 2018/07/25 16:00</td>
                            <td></td>
                        </tr>
                        
                        <tr>
                            <td class="text-center">물품</td>
                            <td class="text-center">003</td>
                            <td class="text-center">맥북</td>
                            <td class="text-center">
                            <span class="label label-success"> 예약 승인 </span>
                            </td>
                            <td class="text-center">2018/07/11 17:00 ~ 2018/07/11 20:00</td>
                            <td><span class="label label-danger text-center">미납</span></td>
                        </tr>
                        
                        <tr>
                            <td class="text-center">법인 차량</td>
                            <td class="text-center">008</td>
                            <td class="text-center">벤츠 지바겐</td>
                            <td class="text-center">
                            <span class="label label-success"> 예약 승인 </span>
                            </td>
                            <td class="text-center">2018/07/1 16:00 ~ 2018/07/1 20:00</td>
                            <td><span class="label label-primary">반납 완료</span></td>
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
	 				 data-target="#myModalx" >반려</button>
	 				  <button type="button" class="btn btn-default btn-sm floatright" data-toggle="modal" 
	 				 data-target="#myModalo" >승인</button>
	 				 
	 				 </nav>
	 				 
	 				<!-- 모달 부분 -->
	 				<div class="modal fade" id="myModalo" role="dialog">
				    <div class="modal-dialog">
				    
				      <!-- Modal 내용-->
				      <div class="modal-content">
				      
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				         <h3 class="txtcenter">승인 처리</h3>
				         </div> 
				         
				          <div class="modal-body">
				          
				           <div class="row">
							    <div class="col-xs-4 col-md-4">
							    
							    <label>자원 분류</label>
									 <select class="form-control" id="sel1">
									    <option>공간</option>
									    <option>물품</option>
									    <option>법인 차량</option>
									    <option>추가</option>
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
						 
						   
				          
				        
				        <div class="modal-footer">
				         <button id="okconfirmbtn" type="button" class="btn btn-default" >승인하기</button>
				         	<!-- 반납하시겠습니까 confirm창 하나 더 추가 -->
				         
				         </div>   
				         
				         
				         </div>
				      
				    </div>
				  </div> 
			 
 			</div>		 
 		
 		 <!--끝 모달 부분 끝-->
 		 
 		 <!-- 모달 부분 -->
	 				<div class="modal fade" id="myModalx" role="dialog">
				    <div class="modal-dialog">
				    
				      <!-- Modal 내용-->
				      <div class="modal-content">
				      
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				         <h3 class="txtcenter">반려 처리</h3>
				         </div> 
				         
				          <div class="modal-body">
				          
				           <div class="row">
							    <div class="col-xs-4 col-md-4">
							    
							    <label>자원 분류</label>
									 <select class="form-control" id="sel1">
									    <option>공간</option>
									    <option>물품</option>
									    <option>법인 차량</option>
									    <option>추가</option>
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
							    
							    <div class="col-xs-12 col-md-12">
							    <label>반려 이유 </label>
							      <input type="text" name="rsc_name" class="form-control input-sm" placeholder="반려 이유 작성" />
							      <br>
							    </div>
							    
							    
						 </div>
						 
						   
				        <div class="modal-footer">
				         <button id="noconfirmbtn" type="button" class="btn btn-default" >반려하기</button>
				         </div>   
				         
				         
				         </div>
				      
				    </div>
				  </div> 
			 
 			</div>		 
 		
 		 <!--끝 모달 부분 끝-->

 		    <!-- 끝 ================ 자원 리스트  ================= 끝-->
 		</div>
 		</div>
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