<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='java.util.*, atom.resource.emp.reservation.model.vo.ResourceList,
    					atom.employee.model.vo.Employee'%>
<%@ include file="/views/common/header.jsp" %>
<%@ include file="/views/common/resourceAside.jsp" %>

<%

	List<ResourceList> list = (List<ResourceList>)request.getAttribute("list");
	String pageBar = (String)request.getAttribute("pageBar");

	//회원 아이디 값 가져오기 
	Employee e = (Employee)request.getSession().getAttribute("empLoggedIn");
	String empId = (String)session.getAttribute("empId");
	
	//반납하고자하는 자원 코드가 본인이 대여한 자원 코드인지 확인
//	boolean istrue = (boolean)request.getAttribute("istrue");
//	int userInputCode = (int)request.getAttribute("userInputCode");

	//페이지 처리 변수들
//	int cPage = (int)request.getAttribute("cPage");
//	int numPerPage = (int)request.getAttribute("numPerPage");

%>
  <script>
	  
	  //반납 버튼 confirm 창
		 $(function () 
	   	{
			 $('#returnconfirmbtn').click(function() 
			{
				 var userInputCode = $('#userInputCode').val().trim();
					
				if(userInputCode==null||userInputCode.length==0)
				{
					alert("자원 코드를 입력해주세요.");
				}		
				return;
				/* if(confirm("반납 하시겠습니까?")==true)
				{
					alert("반납이 되었습니다.")
				}
				else
				{
					return;
				}	 */
			});
		});	 
	  
		/*  
		 $(function () 
		{
			 $('#returnCheckbtn').click(function() 
			{
				alert("하이루");
			});
		});	 
		  */
		 function fn_codeRecheck() 
		 {
			 
			<%-- var recheckCode = $('#userInputCode').val().trim();
			
			var  url = '<%request.getContextPath()%>/checkRscCodeDuplicateFrm';
			var title = "checkRscCodeDuplicateFrm";
			var status="left=500px, top=100px, width=300px,height=200px, menubar=no, status=no,scrollbars=yes";
			var popup=window.open('',title,status);
			checkRscCodeDuplicateFrm.recheckCode.value=recheckCode;
			checkRscCodeDuplicateFrm.method="post";
			checkRscCodeDuplicateFrm.submit(); --%>
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
    					<p class="marginzero">1. 예약하고자 하는 자원은 하단  <kbd class="kbdfont">예약</kbd>버튼으로 예약 접수 할 수 있습니다.		
 			 								  2. 접수가 완료 되면 관리자 검토 후 자원 승인 또는 반려가 될 수 있습니다.</p>
    					</div>	
 			 			
 			 			<div>					  
 			 			<p class="marginzero">3. 사용 완료된 자원은 <kbd class="kbdfont">나의 예약리스트</kbd>를 통해 필히 반납해주시길 바랍니다.
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
	                            <td class="text-center"><%=rl.getRscCatename() %></td>
	                            <td class="text-center"><%=rl.getRscCode() %></td>
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
	                            <button type="button" class="btn btn-sm" data-toggle="modal" data-target="#myModal0">반려</button>
	                          <%} %>
	                            </td>
	                            
	                          	<td class="text-center"><%=rl.getStartTime() %> ~ <br> <%=rl.getEndTime() %></td>
	                            <td class="text-center"><%=rl.getRequestDate() %></td>
	                          	  
								<td class="text-center">
	                            <% if(rl.getRscCondition().equals("Y")) //반납 상태가 Y이면
	                           	{%>
	                           	 <span class="label label-primary">반납 완료</span>
	                          <%} 
	                          	else //반납 상태가 N이면
	                          	{%>
	                          	<span class="label label-danger text-center">미납</span>
	                          	<%} %>
	                          	</td>
							
	                        </tr>
	                        <%} %> 
	                    </tbody>
                </table>
            
            <!-- ===============예약 리스트 끝======================================= -->
            
            <!-- =========================페이징 버튼========================== -->
            
            <nav id='pageBar' class="txtcenter"> 
                    <ul class="pagination pagination-sm pagingbtn">
            	     	<%= pageBar %>   
				    </ul>
            				    
	 			  <button type="button" class="btn btn-default btn-sm floatright" data-toggle="modal" 
	 				 data-target="#myModalusre" >반납</button>
	 				 
	 			 </nav>
	 			  </div>
                
  
  				<!-- =========================페이징 버튼 끝========================= -->
	 				 
	 				<!-- 모달 부분 -->
	 				<div class="modal fade" id="myModalusre" role="dialog">
				    <div class="modal-dialog ">
				    
				      <!-- Modal 내용-->
				      <div class="modal-content">
				      
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				         <h3 class="txtcenter">반납 하기</h3>
				         </div> 
				         
				          <div class="modal-body">
				          
				           <div class="row">
							<div class="col-md-12">
							
							  <form action="<%=request.getContextPath() %>/user/return" method = "post" class="form-inline" name="userInputCodeFrm">
							  	<label for="inputEmail3" >자원 코드 : </label> 
							  	  <input type="text" class="form-control" name="userInputCode" id="userInputCode" placeholder="자원 코드를 입력해주세요"> 
								   <button id="returnCheckbtn" onclick="fn_codeRecheck();"class="btn btn-default" > 반납가능 자원 확인</button>	
							  </form>
							  
							  <form name="checkRscCodeDuplicateFrm">
								<input type="hidden" name="recheckCode"/>
							</form>
							
							</div> 
					      </div>	    
						  </div>
   
				        <div class="modal-footer">
				         <button id="returnconfirmbtn" type="submit" class="btn btn-default" >반납하기</button>
				         </div>   
				        </div>
				      
				   
				  </div> 
				  </div>
	 			 
	 			 <!--끝 모달 부분 끝-->

 		    <!-- 끝 ================ 예약 리스트  ================= 끝-->
 		</div>

    </section>

  <%@include file="/views/common/footer.jsp" %>