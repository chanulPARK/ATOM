<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='java.util.*,atom.resource.emp.reservation.model.vo.ResourceList'%>

<%
	List<ResourceList> list = (List<ResourceList>)request.getAttribute("list");
	String pageBar = (String)request.getAttribute("pageBar");
	
 	//검색 창
	String adminSearchResource = "";
	
	if(request.getAttribute("adminSearchResource")!=null)	
		adminSearchResource = (String)request.getAttribute("adminSearchResource");

	//자원 추가 창 카테고리
	String searchType = "";

	/* //아이디 값 받아오기 
 	String empId = (String)session.getAttribute("empId");
	
	if(empId==null)
	{
		System.out.println("아이디 값 왜 안나오는거지>");
	}
	else
	{
		System.out.println("아이디 값 출력됩니다아아//");
	} 
 */
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
	 
	//추가 부분 기능

	//자원 이름 넣는 박스 글자수 체크 	
	function fn_checkName() 
	{
		var rscName = $("[name=rsc_name]").val();
		/* var addOption = document.getElementById('sel1');
     	var addValue = addOption.options[addOption.selectedIndex].value;
	 */	
		if(rscName.trim().length==0)
		{
			alert("자원 명을 적어주세요.");
			
			return false;
		}
		
		else if(rscName.trim().length>18)
		{
			alert("자원 명은 18글자 이하로 작성해주세요.");

			return false;
		}
		
	 	if(confirm("추가 하시겠습니까?")==true)
	 	{	
			document.addFrm.submit();
	 	}
	 	else
	 	{
	 		return;	
	 	}
	 }

	//===============================================

	 
	 //=============================================//
	 
	 //수정 버튼 confirm 창
	 
	 $(function () 
   	{
		 $('.reEditBtn').click("on",function() 
		{ 
	
			 var editCatecode = $(this).attr('name');
	         var editRscCode = $(this).attr('id');
	         		
			//모달 input 태그에 위에 값 집어넣기			
		   $('[name=editCatecode]').val(editCatecode);
       	   $('[name=editRscCode]').val(editRscCode);
           $(this).attr("data-toggle","modal");
           $(this).attr("data-target","#myModaledit");

		});
	});		
	 
	  function fn_reEdit()
	  {
			 var editRscName = $("[name=editRscName]").val();
			 
			 if(editRscName.trim().length==0)
				{
					alert("자원 명을 적어주세요.");
					
					return false;
				}
				
				else if(editRscName.trim().length>18)
				{
					alert("자원 명은 18글자 이하로 작성해주세요.");

					return false;
				}
				
			 	if(confirm("수정 하시겠습니까?")==true)
			 	{	
					document.reEditFrm.submit();
			 	}
			 	else
			 	{
			 		return;	
			 	}
	  }

	 //==============================================//
	 
	 //삭제 기능 
	 
	 $(function () 
	{
		 $('.delbtn').click("on",function() 
		{ 
	         var delRscCode = $(this).attr('name');
	         var delRscName = $(this).attr('id');
				         
/* 			 alert(delRscCode);
			 alert(delRscName); */
				         		
		 	//모달 input 태그에 위에 값 집어넣기			
		   $('[name=delRscCode]').val(delRscCode);
		   $('[name=delRscName]').val(delRscName);
           $(this).attr("data-toggle","modal");
           $(this).attr("data-target","#myModaldel");

		});
	});		
	 
	 
	 //삭제 버튼 confirm 창
	  function fn_del()
	  {				
			if(confirm("삭제 하시겠습니까?")==true)
			{	
				document.delFrm.submit();
		 	}
		 	else
		 	{
		 		return;	
		 	}
	  };
	 
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

				<div id='search-resource'>
				 	<form action="<%=request.getContextPath() %>/admin/resourceFinder" method="get"> 
					 	<input type="text" name='adminSearchResource' placeholder="검색"/>	 
					 		
					 	<button type="submit" class="btn btnsm btn-default">검색</button>	
				 	</form>
			 	</div>
			 	<br>
			 	 	
  				<!--=============== 검색 창 끝=============== -->
  			
 			
 			<table class="table table-hover">
                    <thead>
                        <tr>
                        	<th scope="col"  class="text-center">자원 분류 코드</th>
                            <th scope="col"  class="text-center">자원 분류</th>
                            <th scope="col"  class="text-center">자원 코드</th>
                            <th scope="col"  class="text-center">자원 명</th>
                            <th scope="col"  class="text-center">예약 상태</th>
                            <th scope="col"  class="text-center"> </th>
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
                        
                        	<!-- *수정 modal창에 띄울 정보 꺼내오기 *  -->
                        	<input type="hidden" id="modalRscCatecode" name="<%=rl.getRscCatecode()%>" value ="<%=rl.getRscCatecode()%>" /> 
                        	<input type="hidden" id="modalRscCode" name="<%=rl.getRscCode()%>" value ="<%=rl.getRscCode()%>" /> 
                        	<input type="hidden" id="modalRscName" name="<%=rl.getRscName()%>" value ="<%=rl.getRscName()%>" /> 
                        
                        	<td class="text-center"><%=rl.getRscCatecode() %></td>
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
                          	
                          	<td>
                          	<button type="button" name="<%=rl.getRscCatecode()%>" id="<%=rl.getRscCode()%>" class="btn btn-default btn-sm reEditBtn" data-toggle="" 
	 						 data-target="" >수정</button>
	 							 						 
	 						 <button type="button" class="btn btn-default btn-sm delbtn" data-toggle="" 
	 						 data-target="" name="<%=rl.getRscCode()%>" id="<%=rl.getRscName() %>">삭제</button>
	 						
                          	</td>
                        </tr>
                      <%}//for문 닫기
					}  //else문 닫기%> 
                    </tbody>
                </table>
            	
            	 <!-- =============페이징 버튼=============== -->
                
            	   <nav id='pageBar' class="txtcenter"> 
                    <ul class="pagination pagination-sm pagingbtn">
            	     	<%= pageBar %>   
				    </ul>
                      <!-- =============페이징 버튼 끝=============== -->
            	

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
				         
				         <div class="alert alert-info">
							  <h4 class="txtcenter"> <안내 사항> </h4> 
							  <p>
							  	법인카드의 경우, 자원명에 이름과 카드 번호 앞 4자리를 함께 입력해주시기 바랍니다. <br>
							  	ex) 국민카드, 카드 앞 4자리 번호 2345 > 자원 명 : 국민카드 2345
							  </p>
							</div>
				         </div>
				          
				          <div class="modal-body">
				          
				          <form action="<%=request.getContextPath()%>/admin/addRsc" method="post" name="addFrm">
				          
				         <table class="table">
							  <thead>
							    <tr>
							      <th scope="col">자원 분류</th>
							      <th scope="col">자원 명</th>
							      <th scope="col">예약 상태</th>
							    </tr>
							  </thead>
							  
							  <tbody>
							    <tr>
							      <td>
							<select class="form-control" size="4" id="sel1" name="sel1"/> <!-- onchange="SetSelectBox();" -->
								
								 <option value='A' selected >공간</option>
								 <option value='B'>물품</option>
								 <option value='C'>법인 차량</option>
								 <option value='D'>법인 카드</option>
						
							</select>
							</td> 
							
							 <td>
							 <input type="text" name="rsc_name" class="form-control input-sm" placeholder="자원 명 입력" required />	
							 </td>
							   
							<td>
							 <label>예약 가능 </label><input type="radio" name="rsc_condition" id="rsc_yes" value="Y"  checked>		      
							<label>예약 불가 </label><input type="radio" name="rsc_condition" id="rsc_no" value="N" >
							</td>
						</tr>
						</tbody>
					</table>
				         
						  </form>
						  </div>	    
						 						 
				        <div class="modal-footer">
				         <button id="addbtn" type="submit" onclick="fn_checkName();"class="btn btn-default" >추가 하기</button>
						 </div>        
						 </div>   
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
				         
				          <form action="<%=request.getContextPath()%>/admin/ReEdit" method="post" name="reEditFrm">
				          		         
				          <table class="table">
							  <thead>
							    <tr>
							      <th scope="col">자원 분류</th>
							       <th scope="col">자원 코드</th>
							      <th scope="col">자원 명</th>
							      <th scope="col">예약 상태</th>
							    </tr>
							  </thead>
							  
							  <tbody>
							    <tr>
							      	<td>
										<input class="form-control input-sm "type = "text" name= "editCatecode" id="editCatecode" readonly />
									</td> 
									
									<td>
									 <input type="text" name="editRscCode" id="editRscCode" class="form-control input-sm" readonly />	
								 	</td>
							
								 <td>
								 <input type="text" name="editRscName" id="editRscName" class="form-control input-sm" placeholder="자원 명 입력" required />	
								 </td>
							   
								<td>
								 <label>예약 가능 </label><input type="radio" name="edit_condition" id="edit_yes" value="Y" checked >		      
								<label>예약 불가 </label><input type="radio" name="edit_condition" id="edit_no" value="N" >
								</td>
							</tr>
						</tbody>
						</table>
						
					</form>
						          
				        </div> 
				         
				        <div class="modal-footer">
				         <button id="editconfirmbtn" type="submit" onclick="fn_reEdit()" class="btn btn-default" >수정 하기</button>
				       
				       
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
				           <form action="<%=request.getContextPath()%>/admin/del" method="post" name="delFrm">
				        <table class="table">
							  <thead>
							    <tr>
							       <th scope="col">자원 코드</th>
							       <th scope="col">자원 이름</th>
							       
							    </tr>
							  </thead>
							  
							  <tbody>
							    <tr>			      	
									<td>
									 <input type="text" name="delRscCode" id="delRscCode" class="form-control input-sm" readonly />	
								 	</td>
							
									 <td>
									 <input type="text" name="delRscName" id="delRscName" class="form-control input-sm" readonly />	
									 </td>
								</tr>
							</tbody>
						</table>
	    				</form>
				        <div class="modal-footer">
				         <button id="delconfirmbtn" type="button" class="btn btn-default" onclick = "fn_del();" >삭제 하기</button>
				         </div>   
					    </div>
				      
				    </div>
				  </div> 
 			</div>		 
 		
 		 <!--끝 모달 부분 끝-->
 		  <!-- ========== 삭제 버튼 끝 ============= -->
 		
   <!-- 끝 ================ 자원 리스트  ================= 끝-->
 	
    </section>

  <%@include file="/views/common/footer.jsp" %>