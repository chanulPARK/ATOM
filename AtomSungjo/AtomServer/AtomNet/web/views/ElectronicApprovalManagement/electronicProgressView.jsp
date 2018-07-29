<%@page import="atom.electronic.model.vo.AuthoriaztionComment"%>
<%@page import="atom.electronic.model.vo.MaterialLine"%>
<%@page import="java.util.ArrayList"%>
<%@page import="atom.electronic.model.vo.ElectronicApproval"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/approvalAside.jsp"%>
<%
	ElectronicApproval ea = (ElectronicApproval)request.getAttribute("ea");
	ArrayList<MaterialLine> materialList = (ArrayList)request.getAttribute("materialline");
	ArrayList<AuthoriaztionComment> commentList = (ArrayList)request.getAttribute("commentList");
	SimpleDateFormat sd = new SimpleDateFormat("YYYY-MM-dd");
	SimpleDateFormat sd2 = new SimpleDateFormat("HH:mm:ss");
	System.out.println("결재선 : ?" + materialList);
	System.out.println("커맨트 : ?" + commentList.size());
	
%>
<head>
<style>

/* Style the sidenav links and the dropdown button */
.sidenav a, .dropdown-btn {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 20px;
  color: #818181;
  display: block;
  border: none;
  background: none;
  width:100%;
  text-align: left;
  cursor: pointer;
  outline: none;
}

/* On mouse-over */
.sidenav a:hover{
  background: rgb(222, 226, 230);
}

/* Main content */
.main {
  margin-left: 200px; /* Same as the width of the sidenav */
  font-size: 20px; /* Increased text to enable scrolling */
  padding: 0px 10px;
}

/* Add an active class to the active dropdown button */
.active {
  /* background-color: green; */
  color: #818181;
}

/* Dropdown container (hidden by default). Optional: add a lighter background color and some left padding to change the design of the dropdown content */
.dropdown-container {
  /* display: none; */
  background-color:  #f1f1f1;
  padding-left: 8px;
}

.sidemenu{
  border-top: 1px solid #fafafa;

}

/* Optional: Style the caret down icon */
aside .fa-caret-down {
  float: right;
  padding-right: 8px;
}

h4{
  margin: 0px;
}

.content{
  margin: 0px 20px;
}

.row-header{
  margin : 0;
}


.appline-wrap table{
   border=1;
   text-align:center;
}

.appline-wrap .tdrow1{
  width:1.3em;
  padding:0.7em 0em;
}



#first-td{
  width:1.3em;padding:0.7em 0em;
}

#first-td~td {
  height:1px;width:5.5em;
}




/* Style the tab */
.tab {
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
}

/* Style the buttons that are used to open the tab content */
.tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
}

/* Change background color of buttons on hover */
.tab button:hover {
    background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
    background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;
    height:60%;
}
.tabcontentsecond{
	display:none;
}

ul{
	list-style:none;
	 text-align:center;
	 padding : 0px;
}

.apprline li{
	font-size:2em;

}


.appr-info{
    padding: 6px 12px;
	border: 1px solid #ccc;
	height:67%;

}


.userApprSave{
	 display: inline-block;
	 background-color :#f1f1f1;
	 width: 100%;
}

.apprlinelist table{
	text-align:center;
}

.table-col-striped{
	border: 3px solid #e5e5e5;
}



.table-col-striped > tbody > tr > th {
   background-color: #f9f9f9;
}

    </style>

   </head>
    <section>
        <div class="content">
          <div class="row">
              <h4>결재 진행함</h4>
              <hr>
          </div>
          <div class="row" >
          	          <form action="<%=request.getContextPath()%>/electronic/approvalBack">
          
	          <div id="formButtonDiv" class="btn-wrap pull-right">
	          	<input type='hidden' name = "draftNo" value="<%=ea.getDraftNo()%>">
	      	    <button id="" class="btn btn-primary" type="submit" ">결재회수</button>
	      	    <button id="addApprLineButton" type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">결재선</button>
	      		<button id="" type="reset"  onclick="history.go(-1)" class="btn btn-default">목록</button>
	      			      	  </form>
	      		
	      	  </div>

            <!-- Modal -->
             <div id="myModal" class="modal fade" role="dialog">
              <div class="modal-dialog modal-lg">

                <!-- Modal content-->
                <div class="modal-content">
                  <div class="modal-header" style = "background-color:white;">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">결재선 지정</h4>
                  </div>

                  <div class="modal-body">
                  	<div class="row">
	                  <div class="col-md-5">
	                  	<!-- Tab links -->
						<div class="tab">
						  <button class="tablinks" onclick="openCity(event, 'organization')">조직도</button>
						  <button class="tablinks" onclick="openCity(event, 'search')">검색</button>
						</div>

						<!-- Tab content -->
						<div id="organization" class="tabcontent">
						  <h3>조직도</h3>
						  <p>London is the capital city of England.</p>
						</div>
						<div id="search" class="tabcontent tabcontentsecond">
						  <h3>검색</h3>
						  <p>Paris is the capital of France.</p>
						</div>
	                  </div> <!-- col-lg-5 -->
	                  <div class="col-md-1" style="margin-top:20%;">
	                  	<div class="apprline" >
							<ul>
								<li><a href="#" id="btnItemAdd" style="color:red"><i class="fa fa-plus-square"></i></a></li>
								<li><a href="#" id="btnItemRemove"><i class="fa fa-minus-square"></i></a></li>
								<li><a id="btnItemRemoveAll" href="#a"><i class="fa fa-rotate-left"></i></a></li>
							</ul>
						</div>
	                  </div> <!-- col-lg-1 -->
	                  <div class="col-md-6">
						<div class="appr-info">
							<h5>결재선 정보</h5>
							<div class="userApprSave Load">
								<strong>사용자 결재선</strong>
								<select title="사용자 결재선" id="userLineId" class="" style="width:55%; margin:2% 5%;">
									<option value="">-- 선택  --</option>
									<option value="21263699">결재선저장</option>
								</select>
								<button class="btn btn-xs" type="button" id="btnRemove">삭제</button>
							</div>
							<div class="apprlinelist" style="height:77%; overflow-y:scroll;">
								<div class="fleft" style="width:100% !important; overflow-y:auto;">
								<ul id="ulResult" class="list-selectable ui-sortable" style="width:98%; font-size:1em;">
									<li class="ui-state-default important nomove" title="박메카 기안 인사팀">
										<div class="liDiv">
											<table cellspacing="1" cellpadding="1" border="0" style="width: 100%; table-layout:fixed; border:1px solid #eee">
												<tbody>
													<tr>
														<td style="padding:10px 5px; width: 3em; text-align: center;"></td>
														<td id="apprTypeTd" style="padding:10px 5px; text-align: center; border-left:1px solid #F0F3F7; width: 70px;">결재</td>
														<td class="textLeft ellipsis" style="border-left:1px solid #F0F3F7; padding-left: 3px;">박메카 기안 인사팀</td>
													</tr>
												</tbody>
											</table>
										</div>
									</li>
									<li class="ui-state-default important move" title="김이지 회장 인사팀">
										<div class="liDiv">
											<table cellspacing="1" cellpadding="1" border="0" style="width: 100%; table-layout:fixed; border:1px solid #eee">
												<tbody>
													<tr>
														<td style="padding:10px 5px; width: 3em; text-align: center;"><i class="fa fa-arrows-v fa-lg text-point-b"></i></td>
														<td id="apprTypeTd" style="padding:10px 5px; text-align: center; border-left:1px solid #F0F3F7; width: 70px;">결재</td>
														<td class="textLeft ellipsis" style="border-left:1px solid #F0F3F7; padding-left: 3px;text-align:center">김이지 회장 인사팀</td>
													</tr>
												</tbody>
											</table>
										</div>
									</li>
									<li class="ui-state-default important move" title="송한국 이사 회계팀">
										<div class="liDiv">
											<table cellspacing="1" cellpadding="1" border="0" style="width: 100%; table-layout:fixed; border:1px solid #eee">
												<tbody>
													<tr>
														<td style="padding:10px 5px; width: 3em; text-align: center;"><i class="fa fa-arrows-v fa-lg"></i></td>
														<td id="apprTypeTd" style="padding:10px 5px; text-align: center; border-left:1px solid #F0F3F7; width: 70px;">결재</td>
														<td class="textLeft ellipsis" style="border-left:1px solid #F0F3F7; padding-left: 3px;">송한국 이사 회계팀</td>
													</tr>
												</tbody>
										</table>
										</div>
									</li>
									<li class="ui-state-default important move ui-selected" title="최나라 사원 회계팀">
										<div class="liDiv">
											<table cellspacing="1" cellpadding="1" border="0" style="width: 100%; table-layout:fixed; border:1px solid #eee">
												<tbody>
													<tr>
														<td style="padding:10px 5px; width: 3em; text-align: center;">최종</td>
														<td id="apprTypeTd" style="padding:10px 5px; text-align: center; border-left:1px solid #F0F3F7; width: 70px;">결재</td>
														<td class="textLeft ellipsis" style="border-left:1px solid #F0F3F7; padding-left: 3px;">최나라 사원 회계팀</td>
													</tr>
												</tbody>
											</table>
										</div>
									</li>
								</ul>
							</div>
							</div>
							<div class="userApprSave" style = "display:inline-block;">
								<div class="col-xs-4" >
									<strong style="font-size:1em;">사용자 결재선명</strong>
								</div>
								<div class="col-xs-6">
									<input type="text" class="form-control input-sm">
								</div>
								<div class="col-xs-2">
									<button class="btn btn-xs" type="button" id="btnRemove">저장</button>
								</div>
							</div>
						</div>

	                  </div> <!-- col-lg-6 -->

                  	</div> <!-- row -->
                  </div> <!-- modal-body -->

                  <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">적용</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                  </div>
                </div>

              </div> <%-- modal-dialog --%>
            </div>



	      	  <div class="content-wrap approval responsive">
	      		<div class="content-write">
	      				<h3 style="margin: 2% 45%">기안용지</h3>
	      				<div class="appline-wrap pull-right">
	                		<table border="1" style="text-align:center">
	                  			<tbody>
				                    <tr>
				                      <td id="first-td" rowspan="<%=materialList.size()%>">결<br><br>재</td>
				                      <td>기안자</td>
				                      <%for(int i=1;i<materialList.size();i++){ %>
				                      <td>결재자</td>
				                      <%}%>
				                </tr>
				                    <tr>
				                    <%for(MaterialLine m : materialList){%>
				                      <td>
					                      <span style="font-size:0.9em"><%=m.getEmpName()%><br></span>
					                      <span style="font-size:1em"><%=m.getMaterialState() %><br></span>
					                      <span style="font-size:0.8em"><%if(m.getMaterialDate()!=null){%><%=sd.format(m.getMaterialDate())%><br><%=sd2.format(m.getMaterialDate())%><%}%></span>
				                      </td>
				                    <%}%>
				                    </tr>
				                </tbody>
	                		</table>
	      				</div> <%-- appline-wrap --%>
	      				<div class="form-block">
	      					<table class="table table-col-striped" >
	      						<caption></caption>
	      						<colgroup>
	      							<col style="width: 15%;"/>
	      							<col style="width: 35%;"/>
	      							<col style="width: 15%;"/>
	      							<col style="width: 35%;"/>
	      						</colgroup>
	      						<tbody>
	      							<tr>
	      								<th>문서번호</th>
	      								<td><%=ea.getDraftNo() %></td>
	      								<th>기안일자</th>
	      								<td><%=ea.getDraftDate() %></td>
	      							</tr>
	      							<tr>
	      								<th>기안자</th>
	      								<td><%=ea.getEmpName() %></td>
	      								<th>기안부서</th>
	      								<td><%=ea.getDraftDept() %></td>
	      							</tr>
	      							<tr>
	      								<th>참조자</th>
	      								<td colspan='3'>
	      								</td>
	      							</tr>
	      							<tr>
	      								<th></span>문서제목</th>
	      								<td colspan="3"><%=ea.getDraftName() %></td>
	      							</tr>
	      						</tbody>
	      						<tfoot>
	      							<tr>
	      								<td colspan="4">
	      									<div class="">
	              			<p><%=ea.getDraftContent() %></p>
	              		</div>
	      								</td>
	      							</tr>
	      						</tfoot>
	      					</table>
	      				</div>


	      		</div>
	      	</div> <!-- content-wrap approval responsive -->

	      	<!-- <div id="formButtonDiv" class="btn-wrap pull-right">
	      	   <button id="" class="btn btn-primary" type="button" onclick="fn_apprBack();">결재회수</button>
	      	    <button id="addApprLineButton" type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">결재선</button>
	      		<button id="createApprDocTemporayButton" type="button" class="btn btn-default">임시저장</button>
	      		<button id="" type="reset"  onclick="history.go(-1)" class="btn btn-default">목록</button>
	      	</div> -->
      </div> <%--row--%>
      <%if(commentList.size()!=0){ %>
      <div class="row">
      	<h5>결재의견</h5>
		<div class="content-view border-top">
		<table class="table full-border" summary="진행현황">
			<caption></caption>
			<colgroup>
				<col style="width: 10%;">
				<col style="width: 13%;">
				<col style="width: 10%;">
				<col style="width: 20%;">
				<col style="width:*;">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">결재</th>
					<th scope="col">결재자</th>
					<th scope="col">부서</th>
					<th scope="col">결재일시</th>
					<th scope="col">의견</th>
				</tr>
			</thead>					
			<tbody>
			<%for(AuthoriaztionComment ac : commentList){ %>
				<tr> <!-- 결재의견 로직 구현하즈아 -->
					<td><%=ac.getApprState() %></td> 
					<td>									
						<div class="ellipsis" title="박메카 회장" style="cursor:default;"> <span class="name"><%=ac.getEmpName() %></span></div>
					</td>
					<td>
						<div class="ellipsis" title="인사팀" style="cursor:default;"> <span class="name"><%=ac.getDeptName() %></span></div>
					</td>
					<td><%=ac.getCommentDate() %></td>
					<td class="text-left">
						<%=ac.getComment() %>
					</td>
				</tr>
			<%}%>
			</tbody>					
	</table>
	</div>
      </div>
      <%} %>
     </div> <%--content--%>

    </section>

    <script>
    var dropdown = document.getElementsByClassName("dropdown-btn");
    var i;

    for (i = 0; i < dropdown.length; i++) {
      dropdown[i].addEventListener("click", function() {
      this.classList.toggle("active");
      var dropdownContent = this.nextElementSibling;
      if (dropdownContent.style.display === "block") {
        dropdownContent.style.display = "none";
      } else {
        dropdownContent.style.display = "block";
      }
    });
    }
    
    function fn_apprBack(){
    	location.href="<%=request.getContextPath()%>/electronic/approvalBack";
    }

    //TAB javascript
    function openCity(evt, cityName) {
        // Declare all variables
        var i, tabcontent, tablinks;

        // Get all elements with class="tabcontent" and hide them
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }

        // Get all elements with class="tablinks" and remove the class "active"
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }

        // Show the current tab, and add an "active" class to the button that opened the tab
        document.getElementById(cityName).style.display = "block";
        evt.currentTarget.className += " active";
    }
    </script>



<%@ include file="/views/common/footer.jsp"%>
