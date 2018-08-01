<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='java.util.*,atom.resource.emp.reservation.model.vo.ResourceList,
    					atom.employee.model.vo.Employee'%>
<%@ include file="/views/common/header.jsp" %>
<%@ include file="/views/common/aside.jsp" %>

<%

	List<ResourceList> list = (List<ResourceList>)request.getAttribute("list");
	String pageBar = (String)request.getAttribute("pageBar");

	//회원 아이디 값 가져오기 
	/*  Employee e = (Employee)request.getSession().getAttribute("empLoggedIn");
	 String empId = e.getEmpId(); */
	

	//페이지 처리 변수들
//	int cPage = (int)request.getAttribute("cPage");
//	int numPerPage = (int)request.getAttribute("numPerPage");

%>
  <script>
	  $(function (){
	      $(".btn").click("on",function()
	      {
	         var returnCode = $(this).attr('name');
	         var returnStartTime = $(this).attr('value');
	         
	         $('[name=userInputCode]').val(returnCode);
	         $('[name=returnStartTime]').val(returnStartTime);
	         $(this).attr("data-toggle","modal");
	         $(this).attr("data-target","#myModalusre"); 
	      });
	});
	
	  function fn_rsc_return()   
	  {
		  if(confirm("반납 하시겠습니까?")==true)
			{	
				document.userReturnCodeFrm.submit();
		 	}
		 	else
		 	{
		 		return;	
		 	}
	  }

  </script>
  
  
  
    <section>
        <div class="container-fluid">
        
            <div class="col-md-8, floatleft">
                <h3>예약 리스트</h3>
              <!-- =======  예약리스트 상단의 알림창 부분 ========= -->
                
                <div class="alert alert-info">
    					<span class="glyphicon glyphicon-bullhorn"></span>	
    					
    					<div>
    					<p class="marginzero"> 1.접수가 완료 되면 관리자 검토 후 자원 승인 또는 반려가 될 수 있습니다.
    					2. 사용 완료된 자원은 하단 반납 여부란의 <kbd class="kbdfont">미반납</kbd>버튼을 통해 필히 반납해주시길 바랍니다.
    					</p>
    					</div>	
 			 			
 			 			<div>					  
 			 			<p class="marginzero">
 			 			3. 반납이 완료되면 <kbd class="kbdfont">반려 완료</kbd>로 변경됩니다.
 			 			4. 예약 시간 중복은 허용되지 않으며, 급한 용무가 있다면 미리 예약을 해두시길 바랍니다.</p>
 			 			</div>
  			 	</div>   
 			</div>
 			
 			  <!-- =======  예약리스트 상단의 알림창 부분 끝========= -->
	
			 <!-- ================ 예약 리스트 ================= -->
			 
 			<div class="col-sm-12 well rsclist">
 			
 			<div id='reservationList'></div>
 			<table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col"  class="text-center">자원 분류</th>
                            <th scope="col"  class="text-center">자원 코드</th>
                            <th scope="col"  class="text-center">자원 명</th>
                            <th scope="col"  class="text-center">진행 상황</th>
                            <th scope="col"  class="text-center">예약 신청 시간</th>
                            <th scope="col"  class="text-center">예약 요청일</th>
                            <th scope="col"  class="text-center">반납 여부</th>
                            
                        </tr>
                    </thead>
                    
                    <tbody class="table-condensed">
                   
	                     <% for(ResourceList rl : list) 
	                    	{%>
	                        <tr>
	          
	                        	<!-- 반납 창에다 보내줄 id값 -->
	                        	
	                             <input type="hidden" id="modalRscCode" name="<%=rl.getRscCode()%>" value ="<%=rl.getRscCode()%>" /> 
	                        	<input type="hidden" id = "modalStartTime" name="<%=rl.getStartTime()%>" value="<%=rl.getStartTime()%>" />
	                        	 
	                         
	                            <td class="text-center"><%=rl.getRscCatename() %></td>
	                            <td class="text-center">
	                            <%=rl.getRscCode() %></td>
	                            <td class="text-center"><%=rl.getRscName() %></td>
	                      
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
	                            <button type="button" class="btn btn-sm" data-toggle="modal" data-target="#myModal0" >반려</button>
	                          
	                          <%} %>
	                         
	                            </td>
	                                    
	                          	<td class="text-center"><%=rl.getStartTime() %> ~ <br> <%=rl.getEndTime() %></td>
	                            <td class="text-center"><%=rl.getRequestDate() %></td>
	                          	  
								 <td class="text-center">
		                            <% if(rl.getRscReturn().equals("Y")) //반납 상태가 Y이면
		                           	{%>
		                           	 <span class="label label-primary">반납 완료</span>
		                          <%} 
		                          	else if(rl.getRscRent().equals("O") && rl.getRscReturn().equals("N") )//반납 상태가 N이면  + 예약 진행 상황도 o이면으로 조건 수정 필요
		                          	{%>
		                          		<button type="button" class="btn btn-danger btn-sm floatright" data-toggle="" 
		 								 data-target="" class="btn" name="<%=rl.getRscCode()%>" value="<%=rl.getStartTime()%>">미반납</button>		 
		                          		
		                          	<%} %>
		                          	</td> 
	                        </tr>
	                        </tbody>
	                      <%} %> 
	                  
                </table>
            
            <!-- ===============예약 리스트 끝======================================= -->
            
            <!-- =========================페이징 버튼========================== -->
            
            <nav id='pageBar' class="txtcenter"> 
                    <ul class="pagination pagination-sm pagingbtn">
            	     	<%= pageBar %>   
				    </ul> 
	 			 </nav>
 			  </div>
  				<!-- =========================페이징 버튼 끝========================= -->
	 		 				 
	 				 
	 				<!-- 모달 부분 -->
	 				<div class="modal fade" id="myModalusre" role="dialog">
				    <div class="modal-dialog modal-sm ">
				    
				      <!-- Modal 내용-->
				      <div class="modal-content">
				      
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				         <h3 class="txtcenter">반납 하기</h3>
				         </div> 
				         
				          <div class="modal-body">
				          
				           <div class="row">
							<div class="col-md-12">
							
							  <form action="<%=request.getContextPath() %>/user/return" method = "post" class="form-inline" name="userReturnCodeFrm">
							  	<label>자원 코드 : </label> 
							  	  <input type="text" class="form-control" name="userInputCode" id="userInputCode" value="" readonly> 
							  	  <input type="hidden" name="returnStartTime" name="returnStartTime" value=""/>
							   </form>
							</div> 
					      </div>	    
						  </div>
   
				        <div class="modal-footer">
				         <button id="returnconfirmbtn" type="submit" class="btn btn-default" onclick="fn_rsc_return();" >반납하기</button>
					    </div>   
				     </div>
				   
				  </div> 
				  </div>
	 			 
	 			 <!--끝 모달 부분 끝-->

 		    <!-- 끝 ================ 예약 리스트  ================= 끝-->
 		</div>

    </section>

  <%@include file="/views/common/footer.jsp" %>