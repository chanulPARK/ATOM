<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='java.util.*,atom.resource.emp.reservation.model.vo.ResourceList'%>
    
<%@ include file="/views/common/header.jsp" %>
<%@ include file="/views/common/aside.jsp" %>
<%
	List<ResourceList> list = (List<ResourceList>)request.getAttribute("list");
	String pageBar = (String)request.getAttribute("pageBar");
	
	//검색 창
	String searchResource = "";
	
	if(request.getAttribute("searchResource")!=null)	
		searchResource = (String)request.getAttribute("searchResource");
	else
		System.out.println("입력 값이 null로 들어와");
	
	/* //아이디 값 받아오기 
	String empId = (String)session.getAttribute("empId");
	
	if(empId==null)
	{
		System.out.println("아이디 값 왜 안나오는거지>");
	}
	else
	{
		System.out.println("아이디 값 출력됩니다아아//");
	} */
	int cPage = (int)request.getAttribute("cPage");
	int numPerPage = (int)request.getAttribute("numPerPage");
%>

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

	

    <section>
        <div class="container-fluid">
        
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
		<div class="col-md-8 well rsclist">
		
 				<!--=============== 검색 창=============== -->
			 	
			 	<div id='search-resource'>
				 	<form action="<%=request.getContextPath() %>/user/resourceFinder" method="get"> 
					 	<input type="text" name='searchResource' placeholder="검색"/>	 
					 		
					 	<button type="submit" class="btn btnsm btn-default">검색</button>	
				 	</form>
			 	</div>
			 	<br>
			 	
  				<!--=============== 검색 창 끝=============== -->

		<div id='resourceList'>
 			<table id ="rsc-userboard"class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col"  class="text-center">자원 분류</th>
                            <th scope="col"  class="text-center">자원 코드</th>
                            <th scope="col"  class="text-center">자원 명</th>
                            <th scope="col"  class="text-center">예약 상태</th>  
                        </tr>
                    </thead>
                    <tbody class="table-condensed">
                    <%if(list==null) 
                    {%>
                    <tr>
						<td colspan=9>검색결과가 없습니다.</td>	
					</tr>
					<%}
                    else
                    {	for(ResourceList rl : list) 
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
                       <%}//for문 닫기
					}  //else문 닫기%> 
                    </tbody>
                </table>
                </div>
                
                
                <!-- =============페이징 버튼=============== -->
                
            	    <nav id='pageBar' class="txtcenter"> 
                    <ul class="pagination pagination-sm pagingbtn">
            	     	<%= pageBar %>   
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
								<div class="form-group">
									    <label for="labelrscCode">자원 코드</label>
									   <input type="text" name="rsc_code" class="form-control input-sm" id="rsc_code" placeholder="코드 입력란">
								</div>
							    </div>
					
					           	 <div class="col-xs-4 col-md-4">
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
				         <button id="resconfirmbtn" type="button" class="btn  btn-default" >예약하기</button>  
				         </div>   
				         
					 </div>
				    </div>
				  </div>
 			<!--끝 모달 부분 끝-->
				</div>		 
 			</div>

 		    <!-- 끝 ================ 자원 리스트  ================= 끝-->
    </section>

<%@include file="/views/common/footer.jsp" %>