<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='java.util.*,atom.resource.emp.reservation.model.vo.ResourceList'%>
<%@ include file="/views/common/header.jsp" %>
<%@ include file="/views/common/resourceAdminAside.jsp" %>
<%
	List<ResourceList> list = (List<ResourceList>)request.getAttribute("list");
	String pageBar = (String)request.getAttribute("pageBar");

	//rent_emp에 있는 내용을 다 가지고 와야해
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
	  
 	 <!-- 사이드바  -->
	<!--  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">   -->
	

	  <title>예약 관리</title>
	  
	  <script>
	  
	  //승인 버튼 confirm 창
		  $(function () 
	   	{
			 $('#okbtn').click("on",function() 
			{
			
				 /* var userId = $('#adminEmpId').val();
				 alert(userId); */
				 
				/*  var userId = $(this).attr('name');
				 var startTime = $(this).attr('value');
				 
				 alert(userId);
				 alert(startTime); */
				 				 
				if(confirm("승인 하시겠습니까?")==true)
				{
					document.adminAcceptFrm.submit();
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
					var userId = $('#adminEmpId').val();
					alert(userId);
					
					
					
					
					
					location.href=""
				}
				else
				{
					return;
				}	
			});
		});	
	   
	  </script>
</head>
    <section>
        <div class="container-fluid">
        
            <div class="col-md-8, floatleft">
                <h3>예약 요청 현황</h3>
                
                <div class="alert alert-info">
    
    					<span class="glyphicon glyphicon-bullhorn"></span>	
    					
    					<div>
    					<p class="marginzero">
    					1. 관리자는 하단  <kbd class="kbdfont">승인</kbd>  <kbd class="kbdfont">반려</kbd>버튼으로 예약 처리를 할 수 있습니다. <br>
						2. 사용자에게서 받은 예약 승인 건에 대해 승인 시 중복된 시간은 없는지, 반려 대상인지등을 고려 후 승인을 해주시기 바랍니다. <br></p>
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
                            <th scope="col"  class="text-center">예약자 명</th>
                            <th scope="col"  class="text-center">예약 요청 접수일</th>
                            <th scope="col"  class="text-center">예약 신청 기간</th>
                            <th scope="col"  class="text-center">예약 상태</th>
                            <th scope="col"  class="text-center"></th>
                        </tr>
                    </thead>
                    <tbody class="table-condensed">
                     <% for(ResourceList rl : list) 
                    	{%>
                        <tr>
                        
                        	<!-- 승인 모달 창에다가 넘겨줄 값 hidden으로 넣음	 -->
                        	<form action="<%=request.getContextPath() %>/admin/accept" method = "post" class="form-inline" name="adminAcceptFrm">
                        	 <input type="hidden" id="adminEmpId" name="adminEmpId" value ="<%=rl.getEmpId()%>" /> 
                        	 <input type="hidden" id="adminStartTime" name="adminStartTime" value ="<%=rl.getStartTime()%>"/> 
                        	
                        
                            <td class="text-center"><%=rl.getRscCatename() %></td>
                            <td class="text-center"><%=rl.getRscCode() %></td>
                            <td class="text-center"><%=rl.getRscName() %></td>
                            <td class="text-center"><%=rl.getEmpName() %></td>
                            <td class="text-center"><%=rl.getRequestDate() %></td>
                            <td class="text-center"><%=rl.getStartTime() %> <br> <%=rl.getEndTime() %></td>
                            
                          	<td class="text-center">	                            
	                            <% if(rl.getRscRent().equals("O")) //예약 진행 상황이 O이면
	                           	{%>
	                           	    <span class="label label-success"> 예약 승인 </span>
	                          <%} 
	                          	else if(rl.getRscRent().equals("W")) //예약 진행 상황이 w이면
	                          	{%>
	                          		<span class="label label-warning"> 승인 대기 </span>
	                        	<%} 
	                          	else //예약 진행 상황이 x이면
	                          	{%>
	                           		<span class="label label-default"> 반려 </span>
	                          <%} %>
	                            </td>
	                            
	                      	<td class="text-center">
	                      	
	                      	 <% if(rl.getRscRent().equals("O")) //예약 진행 상황이 O이면
	                           	{%>
	                           	   
	                          <%} 
	                          	else if(rl.getRscRent().equals("W")) //예약 진행 상황이 w이면
	                          	{%>
	                          			 								 
	 								 <button type="button" class="btn btn-default btn-sm floatright" data-toggle="modal" 
	 								 data-target="#myModalx" >반려</button>
	 								 
	 								 <button type="submit" id="okbtn" class="btn btn-default btn-sm floatright"  onclick="fn_admin_accept(<%=rl.getStartTime()%>)">승인</button>                       
	                        </form>
	                       <%--  <button type="submit" id="okbtn" class="btn btn-default btn-sm floatright"  onclick="fn_admin_accept()"
	 								 name="<%=rl.getEmpId()%>" value="<%=rl.getStartTime() %>">승인</button>  --%>
	                        	<%} 
	                          	else //예약 진행 상황이 x이면
	                          	{%>
	                           		-
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
            	
	 				 </nav>
	 				 
	 				<!-- 모달 부분 -->
	 				<div class="modal fade" id="myModalo" role="dialog">
				    <div class="modal-dialog modal-sm">
				    
				      <!-- Modal 내용-->
				      <div class="modal-content">
				      
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				         <h3 class="txtcenter">승인 처리</h3>
				         </div> 
				         
				          <div class="modal-body">
				          
				           <div class="row">
							   
							   <form action="<%=request.getContextPath() %>/admin/accept" method = "post" class="form-inline" name="adminAcceptFrm">
							   
							   <label class='txtcenter'> 해당 건을 승인하시겠습니까? </label>
							   <p name="test"></p>
							   
							   </form>
							  
						    </div>
						 </div>	        
				        <div class="modal-footer">
				         <button id="okconfirmbtn" type="button" class="btn btn-default" onclick="fn_admin_accept();">승인하기</button>
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

  <%@include file="/views/common/footer.jsp" %>