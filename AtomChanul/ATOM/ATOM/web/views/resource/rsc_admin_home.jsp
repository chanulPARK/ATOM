<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='java.util.*, atom.resource.emp.reservation.model.vo.ResourceList'%>

<%
	List<ResourceList> list = (List<ResourceList>)request.getAttribute("list");
	String pageBar = (String)request.getAttribute("pageBar");
	
 	//검색 창
	String searchResource = "";
	
	if(request.getAttribute("searchResource")!=null)	
		searchResource = (String)request.getAttribute("searchResource");
	else
		System.out.println("입력 값이 null로 들어와");
	
	//아이디 값 받아오기 
/* 	String empId = (String)session.getAttribute("empId");
	
	if(empId==null)
	{
		System.out.println("아이디 값 왜 안나오는거지>");
	}
	else
	{
		System.out.println("아이디 값 출력됩니다아아//");
	} */

%>

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
	  
	 
	 <script>
	 
	
	 //추가 버튼 confirm 창
	 $(function () 
   	{
		 $('#addconfirmbtn').click(function() 
		{
			if(confirm("추가 하시겠습니까?")==true)
			{
				alert("자원이 추가되었습니다.")
			}
			else
			{
				return;
			}	
		});
	});	
	 
	 //수정 버튼 confirm 창
	 $(function () 
   	{
		 $('#editconfirmbtn').click(function() 
		{
			if(confirm("수정 하시겠습니까?")==true)
			{
				alert("선택한 자원 정보가 수정되었습니다.")
			}
			else
			{
				return;
			}	
		});
	});		
	 
	 //삭제 버튼 confirm 창
	 $(function () 
   	{
		 $('#delconfirmbtn').click(function() 
		{
			if(confirm("삭제 하시겠습니까?")==true)
			{
				alert("선택한 자원이 삭제되었습니다.")
			}
			else
			{
				return;
			}	
		});
	});		 
	 </script>

	  <title>자원 관리</title>
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
	       		<a href="<%=request.getContextPath()%>/admin/resourcehome">자원 관리 홈</a>
	          </div>
	        
	        <div class="panel-footer">
	     		<a href='<%=request.getContextPath()%>/admin/resourceAcceptList'>승인 요청 현황</a>
	        </div>
	        
	      </div>
	    </div>
	  </div>
	</div>
	
    </aside>


    <section>
        <div class="container-fluid">
        
            <div class="col-md-8, floatleft">
                <h3>자원 관리</h3>
                
                <div class="alert alert-info">
					<span class="glyphicon glyphicon-bullhorn"></span>	
		
    					<div>
    					<p class="marginzero">
    					1. 관리자는 하단  <kbd class="kbdfont">추가</kbd>  <kbd class="kbdfont">수정</kbd>  
    					<kbd class="kbdfont">삭제</kbd>버튼으로 자원 정보를 관리할 수 있습니다.<br>
 			 			2. 사용자에게서 받은 예약 승인 건에 대해 승인을 할 때 중복된 시간은 없는지, 반려 대상인지  등을 고려 후 승인을 해주시기 바랍니다.<br>
 			 			3. 예약된 자원의 반납이 잘 이루어지는지 수시로 체크해주시길 바랍니다.
 			 			</p>
    			</div>		
  			 	</div>             
 			</div>
			 <!-- ================ 자원 관리 리스트 ================= -->
			 
 			<div class="col-sm-12 well rsclist">
 			
 			<!--=============== 검색 창=============== -->
 			<div class="con-sm-3">
				 	<form>
					 	<input type="text"  placeholder="검색"/>
					 	<button type="submit" class="btn btnsm btn-default">검색</button>	
				 	</form>
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
                        <% for(ResourceList rl : list) 
                    	{%>
                        <tr>
                            <td class="text-center"><%=rl.getRscCatename() %></td>
                            <td class="text-center"><%=rl.getRscCode() %></td>
                            <td class="text-center"><%=rl.getRscName() %></td>
                            <td class="text-center">
                            <% if(rl.getRscCondition().equals("Y")) //예약 가능 상태가 Y이면
                           	{%>
                           	 <button type="button" class="btn btn-success btn-sm disabled">예약 가능</button>
                          <%} 
                          	else //예약 가능 상태가 N이면
                          	{%>
                          	<button type="button" class="btn btn-danger btn-sm disabled">예약 불가</button>
                          	<%} %>
                          	</td>
                        </tr>
                        <%} %> 
                    </tbody>
                </table>
            	
            	 <!-- =============페이징 버튼=============== -->
                
            	   <nav id='pageBar' class="txtcenter"> 
                    <ul class="pagination pagination-sm pagingbtn">
            	     	<%= pageBar %>   
				    </ul>
                      <!-- =============페이징 버튼 끝=============== -->
            	
                    
		
 					 <button type="button" class="btn btn-default btn-sm floatright" data-toggle="modal" 
	 				 data-target="#myModaldel" >삭제</button>
	 				 <button type="button" class="btn btn-default btn-sm floatright" data-toggle="modal" 
	 				 data-target="#myModaledit" >수정</button>
	 				  <button type="button" class="btn btn-default btn-sm floatright" data-toggle="modal" 
	 				 data-target="#myModaladd" >추가</button>
	 				 
	 				</nav> 
	 				
	 				 
	 				 <!-- ========== 추가 버튼 ============= -->
	 				 
	 				<!-- 모달 부분 -->
	 				<div class="modal fade" id="myModaladd" role="dialog">
				    <div class="modal-dialog">
				    
				      <!-- Modal 내용-->
				      <div class="modal-content">
				      
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				         <h3 class="txtcenter">자원 추가</h3>
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
				        </div>
				        
				        <div class="modal-footer">
				         <button id="addconfirmbtn" type="button" class="btn btn-default" >추가 하기</button>
						 </div>        
						   
				         </div>
				    </div>
				  </div> 

 		 <!--끝 모달 부분 끝-->
 		  <!-- ========== 추가 버튼 끝 ============= -->
 		 
 		  <!-- ========== 수정 버튼 ============= -->
 		 <!-- 모달 부분 -->
	 				<div class="modal fade" id="myModaledit" role="dialog">
				    <div class="modal-dialog">
				    
				      <!-- Modal 내용-->
				      <div class="modal-content">
				      
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				         <h3 class="txtcenter">자원 수정</h3>
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
				         <button id="editconfirmbtn" type="button" class="btn btn-default" >수정 하기</button>
				         </div>   
					  </div>
				      
				    </div>
				  </div> 
			 
 			</div>		 
 		
 		 <!--끝 모달 부분 끝-->
 		  <!-- ========== 수정 버튼 끝============= -->
 		 
 		  <!-- ========== 삭제 버튼 ============= -->
 		 <!-- 모달 부분 -->
	 				<div class="modal fade" id="myModaldel" role="dialog">
				    <div class="modal-dialog">
				    
				      <!-- Modal 내용-->
				      <div class="modal-content">
				      
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				         <h3 class="txtcenter">삭제 하기</h3>
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
						 </div>
						    
				        <div class="modal-footer">
				         <button id="delconfirmbtn"type="button" class="btn btn-default" >삭제 하기</button>
				         </div>   
					    </div>
				      
				    </div>
				  </div> 
 			</div>		 
 		
 		 <!--끝 모달 부분 끝-->
 		  <!-- ========== 삭제 버튼 끝 ============= -->
 			

 			</div>		 
   <!-- 끝 ================ 자원 리스트  ================= 끝-->
 	
    </section>

  <%@include file="/views/common/footer.jsp" %>