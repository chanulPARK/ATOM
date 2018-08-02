<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='java.util.*,atom.resource.emp.reservation.model.vo.ResourceList'%>
    
<%@ include file="/views/common/header.jsp" %>
<%@ include file="/views/common/resourceAside.jsp" %>
<%
	/* Employee empLoggedIn = (Employee)session.getAttribute("empLoggedIn"); */

	int rscCode = (int)request.getAttribute("rscCode");

	List<ResourceList> list = (List<ResourceList>)request.getAttribute("list");
	List<ResourceList> timelist = (List<ResourceList>)request.getAttribute("timelist");

	String pageBar = (String)request.getAttribute("pageBar");
	
	//int cPage = (int)request.getAttribute("cPage");
//	int numPerPage = (int)request.getAttribute("numPerPage");
%>
<!-- datetimepicker css -->
<link rel = "stylesheet" href="<%=request.getContextPath()%>/dist/css/jquery.datetimepicker.min.css">
<!-- datetimepicker -->
<script src = "<%=request.getContextPath()%>/dist/js/jquery.datetimepicker.full.js"></script>

    <section>
        <div class="container-fluid">
        
            <div class="col-md-8,floatleft">
                <h3>예약하기 </h3>
                
              <!-- =======  예약 페이지 상단의 알림창 부분 ========= -->
                     
                <div class="alert alert-info">
  					<span class="glyphicon glyphicon-bullhorn"></span>	
    		
    				<div>
    					<p class="marginzero"> 접수가 완료 되면 관리자 검토 후 신청이 승인 또는 반려가 될 수 있으며,
    										    예약이 이미 접수된 시간대에 중복으로 예약할 수 없습니다</p>
    				</div>	
  			 	</div>
			</div> 
 			
 			<!-- =======  예약 관리 페이지 상단의 알림창 부분 끝 ========= -->
	
			 <!-- ================ 예약 페이지 ================= -->
		<div class="col-md-8 well rsclist">
			 <table class="table">
				 <thead>
				 	  <tr>
					     <th scope="col">자원 분류 코드</th>
					     <th scope="col">자원 분류</th>
					     <th scope="col">자원 코드</th>
					    <th scope="col">자원 명</th>
					  </tr>
			 	 </thead>
			 	 
			 <form action="<%=request.getContextPath()%>/user/reservationConfirm?empId=<%=empLoggedIn.getEmpId() %>" method="post" name="reservationConfirm" id="reservationConfirm"/>
			 
				<% for(ResourceList rl : list)
				{ %>	
				  <tbody>
					    <tr>
					      <td>
							 <input class="form-control input-sm" name="catecode" id= "catecode" type="text" value="<%=rl.getRscCatecode()%> " readonly required/>
	       					 <%-- <input type= "hidden" name= "hiddenCatecode" id="hiddenCatecode" type="text" value="<%=rl.getRscCatecode()%> " /> --%>
	       					</td> 
							
							 <td>
								<input class="form-control input-sm" type="text"  name="category" value="<%=rl.getRscCatename() %>" readonly required />	
								<%-- <input type= "hidden" name= "hiddenCategory" id="hiddenCategory" type="text" value="<%=rl.getRscCatename() %>" /> --%>
							 </td>
							   
							<td>
							  <input class="form-control input-sm" type="number"  name="code" value="<%=rl.getRscCode()%>" type="text" readonly required/>
						  <%--   	<input type= "hidden" name= "hiddenCode" id="hiddenCode" type="text" value="<%=rl.getRscCode()%>"  /> --%>
							
							</td>
							
							<td>
							  <input class="form-control input-sm" name="name" type="text" value="<%=rl.getRscName()%>" readonly required/>	 		 
						<%-- 	  <input type= "hidden" name= "hiddenName" id="hiddenName" type="text" value=<%=rl.getRscName()%>"  /> --%>
							</td>
						</tr>
		    	<% } %>		
					  	</tbody>
				</table>
				
				<div class="row">
                     <div class="col-md-4">
                          <div class="form-inline">
				           	 <label class="control-label">예약 시작 시간 : </label>
					           	 <input id="datetime_s" class=" form-control input-medium" name="start_time" placeholder="시작 시간" required />
					           	 
					           	 <script>
					          	 	$.datetimepicker.setLocale('kr');

					           	 	$("#datetime_s").datetimepicker
					           	 	({
					           			startDate : '+1971/05/01'
					           	 	});
					           	 </script>
					           	 
					          </div> 	 
					        </div>  
				
					  <div class="col-md-4">
                    	 <div class="form-inline">
					       	 <label class="control-label">예약 완료 시간 : </label>
				        	 <input id="datetime_f" class="form-control input-medium" name="end_time" placeholder="만료 시간" required />
				
					           	 <script>
					           	 	$("#datetime_f").datetimepicker();
					           	 	
					           		 $("#datetime_f").datetimepicker
					           	 	({
					           			startDate : '+1971/05/01'
					           	 	});
					           	 </script>	
								</div>	
					       </div>			
				        <button type="submit"  class="btn btn-success btn-sm">예약하기</button>
			         	<button type="button" class="btn btn-default btn-sm" onclick="location.href='<%=request.getContextPath()%>/user/resourseHome'">메인 홈페이지로 돌아가기</button>            	     	                                 
                  </div>
			</form>		
						
 	<br>
		<div id='resourceList'>
 			<table id ="rsc-userboard" class="table table-hover">
                    <thead>
                        <tr>
                            <th class="text-center">예약 완료 된 시작 시간 (예약 불가)</th>  
                             <th class="text-center"> </th>  
                            <th class="text-center">예약 완료 된 완료 시간(예약 불가)</th>  
                        </tr>
                    </thead>
                    <tbody class="table-condensed">
                        <tr>     
	                  <%
	                    for(ResourceList rl2 : timelist)
	                    {%>    
	                    
	                       	<td class="text-center">
	                            <%=rl2.getStartTime() %> 
	                        </td>
	                        <td> ~ </td>
	                       
	                        <td class="text-center">
	                            <%=rl2.getEndTime() %>
	                        </td>
	                    </tr>
                       <%}//for문 닫기%>  
                    </tbody>
                </table>
                </div>
                
                
                <!-- =============페이징 버튼=============== -->
                
            	    <nav id='pageBar' class="txtcenter"> 
                    <ul class="pagination pagination-sm pagingbtn">
            	     	<%= pageBar %>   
				    </ul>
                      <!-- =============페이징 버튼 끝=============== --> 			 
	 			  </nav>
				</div>		 
 			</div>

 		    <!-- 끝 ================ 자원 리스트  ================= 끝-->
    </section>

<%@include file="/views/common/footer.jsp" %>