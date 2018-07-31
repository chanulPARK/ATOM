<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/approvalAside.jsp"%>
<%
	Date date = new Date();
	SimpleDateFormat sd = new SimpleDateFormat("YYYY.MM.dd");
	ArrayList<Employee> empList = (ArrayList<Employee>)request.getAttribute("empList");
	ArrayList<String> deptList = (ArrayList<String>)request.getAttribute("deptList");
	for(Employee s : empList){
		System.out.println(s.getEmpName());
	}
%>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/dist/css/jstree/style.min.css" />

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

.apprline ul{
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



    </style>
   </head>
    <section>
        <div class="content">
          <div class="row">
              <h4>기안문 작성</h4>
              <hr>
          </div>
          <div class="row" >
	          <div id="formButtonDiv" class="btn-wrap pull-right">
	      	    <button id="addApprLineButton" type="button" class="btn" data-toggle="modal" data-target="#myModal">결재선</button>
	      	    <button id="createApprDocButton" type="button" class="btn btn-color5" onclick="$('#submitbtn').click()">결재요청</button>
	      		<!-- <button id="createApprDocTemporayButton" type="button" class="btn btn-default">임시저장</button> -->
	      		<button id="listApprDocButton" type="button" class="btn btn-default">취소</button>
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
  						 <!-- 3 setup a container element -->
						  <div id="jstree">
 						 </div>
						</div>
						<div id="search" class="tabcontent tabcontentsecond">
						  <h3>검색</h3>
						  <p>Paris is the capital of France.</p> 
						</div>
	                  </div> <!-- col-lg-5 -->
	                  <div class="col-md-1" style="margin-top:20%;">
	                  	<div class="apprline" >
							<ul>
 								<li><a href="#" id="btnItemRemove"><i class="fa fa-minus-square"></i></a></li>
								<li><a id="btnItemRemoveAll" href="#a"><i class="fa fa-rotate-left"></i></a></li>
							</ul>						
						</div>
	                  </div> <!-- col-lg-1 -->
	                  <div class="col-md-6">
						<div class="appr-info">
							<h5>결재선 정보</h5>
							<div class="apprlinelist" style="height:77%; overflow-y:scroll;">
								<div class="fleft" style="width:100% !important; overflow-y:auto;">
								<ul id="ulResult" class="list-selectable ui-sortable" style="width:98%; font-size:1em; list-style:none; padding:0;">
									<li id="<%=empLoggedIn.getEmpId()%>chk" class="ui-state-default important nomove" title="">
										<div class="liDiv">
											<table cellspacing="1" cellpadding="1" border="0" style="width: 100%; table-layout:fixed; border:1px solid #eee">
												<tbody>
													<tr>
														<td id="apprTypeTd" style="padding:10px 5px; text-align: center; border-left:1px solid #F0F3F7; width: 70px;">결재</td>
														<td id="tdchange1"  class="tdchange textLeft ellipsis" style="border-left:1px solid #F0F3F7; padding-left: 3px;"><%=empLoggedIn.getEmpName() + " " + empLoggedIn.getJobName() + " " + empLoggedIn.getDeptName()%></td>
													</tr>
												</tbody>
											</table>
										</div>
									</li>
								</ul>
							</div>
							</div>
						</div>
						
	                  </div> <!-- col-lg-6 -->
	                  
                  	</div> <!-- row -->
                  </div> <!-- modal-body -->
                  
                  <div class="modal-footer">
                    <button id='aprrbutton' type="button" class="btn btn-primary" data-dismiss="modal">적용</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                  </div>
                </div>

              </div> <%-- modal-dialog --%>
            </div>
	      	  <div class="content-wrap approval responsive">
	      		<div class="content-write">
	      			<form id="apprDocForm" name="apprDocForm" method="post"  onsubmit="return check()" action="<%=request.getContextPath()%>/approval/createApprDoc.do">
	      				<h3 style="margin: 2% 45%">기안용지</h3>
	      				<div class="appline-wrap pull-right">
	                		<table border="1" style="text-align:center">
	                  			<tbody>
				                    <tr id="apprhead">
				                      <td id="first-td" rowspan="2">결<br><br>재</td>
				                      <td id="not">기안</td>
				                      <!-- <td>결재</td>
 				                      <td>결재</td> -->
 				                </tr>
				                    <tr id='apprbody'>
				                      <td id = 'not'>
					                      <span style="font-size:0.9em"><%=empLoggedIn.getEmpName()%><br></span>
					                      <input type="hidden" name="material_id" value="<%=empLoggedIn.getEmpId()%>">
					                      <input type="hidden" name="material_squence" value="1">
					                      <!-- <span style="font-size:1em">반려<br></span>
					                      <span style="font-size:0.8em">07.27 12:00</span> -->
				                      </td>
				                    </tr>
				                </tbody>
	                		</table>
	      				</div> <%-- appline-wrap --%>
	      				<div class="form-block">
	      					<table class="table separate">
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
	      								<td>자동채번</td>
	      								<th>기안일자</th>
	      								<td><%=sd.format(date) %></td>
	      							</tr>
	      							<tr>
	      								<th>기안자</th>
	      								<td><%=empLoggedIn.getEmpName() %></td>
	      								<th>기안부서</th>
	      								<td><%=empLoggedIn.getDeptName() %></td>
	      							</tr>
	      							<tr>
	      								<th><span style="color: red">* </span>문서제목</th>
	      								<td colspan="3">
	                       					 <input type="text" title="문서제목"  name="apprTitle" value="" class="form-control inputbox w100p" maxlength="100" placeholder="문서제목을 입력하세요. " required/>
	      								</td>
	      							</tr>
	      						</tbody>
	      					</table>
	      				</div>
	              		<div class="">
	              			<textarea rows="25" cols="80" style="width:100%;resize:none;overflow-y: scroll;" ></textarea>
	              		</div>

	      		</div>
	      	</div> <!-- content-wrap approval responsive -->

	      	<div id="formButtonDiv" class="btn-wrap pull-right">
	      	    <button id="" type="button" class="btn" onclick="$('#addApprLineButton').click()">결재선</button>
	      	    <button id="submitbtn" type="submit" class="btn">결재요청</button>
	      		<button id="" type="reset"  onclick="history.go(-1)" class="btn">취소</button>
	      	</div>
	      	</form>
      </div> <%--row--%>
     </div> <%--content--%>

    </section>

    <script>
    var squencechk= 2;
    
    $(function () {
    	$('#jstree').jstree({
    		"core" : {
    			'data' : [
    				<%for(String s : deptList){%>
    				{
    				
    				"id" : "<%=s%>",
    				"text" : "<%=s%>",
					'icon' : '<%=request.getContextPath()%>/dist/img/hierarchical-structure.png',
    				'children' : [    				
	    				<%for(Employee e : empList){
	    					if(e.getDeptName().equals(s)){
	    				%>
	    				{
	    					'id' : '<%=e.getEmpId()%>',
	    					'text' : '<%=e.getEmpName()+" "+ e.getJobName()%>',
	    					'dept' : '<%=e.getDeptName()%>',
	    					'icon' : '<%=request.getContextPath()%>/dist/img/user-shape.png',
	    				},
	    				<%}
	    				}%>
    				]},
    				<%}%>
    			]
    		}
    	}).bind('select_node.jstree', function(event, data){
    	    var id = data.instance.get_node(data.selected).id;        //id 가져오기
    	    var parent = data.instance.get_node(data.selected).parent;    //type 가져오기
			var chk = 0;
			if(parent != "#"){
				$('#ulResult').find('li').each(function(){
					if(this.id.slice(0,-3) == id){
						alert('이미 있음');
						chk=1;
						return false;
					}		
				});
				if(chk == 0){
					console.log(parent);
					$('#ulResult').append('<li id=litemp class="ui-state-default important nomove" title=""><div class="liDiv"><table cellspacing="1" cellpadding="1" border="0" style="width: 100%; table-layout:fixed; border:1px solid #eee"><tbody><tr><td id="apprTypeTd" style="padding:10px 5px; text-align: center; border-left:1px solid #F0F3F7; width: 70px;">결재</td><td id="tdchange'+squencechk+'" class="tdchange textLeft ellipsis" style="border-left:1px solid #F0F3F7; padding-left: 3px;"></td>	</tr></tbody></table></div></li>');
					$('#litemp').attr('id',id+'chk');
					$('#'+id+'chk #tdchange'+squencechk++).html($('#'+id).text() +" "+ parent);
				}
				
			}
    	});
    });
    $('button').on('click', function () {
        $('#jstree').jstree(true).select_node('child_node_1');
       $('#jstree').jstree('select_node', 'child_node_1');
       // $.jstree.reference('#jstree').select_node('child_node_1');
/*         $.jstree.reference('#jstree').select_node('child_node_2');
 */      });
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
    
    $('#btnItemRemove').click(function(){
    	if($('#ulResult li').length != 1){
    		$('#ulResult li:last').remove();
   		 }
    })
    
    $('#btnItemRemoveAll').click(function(){
    	$('#ulResult li').remove();
		$('#ulResult').append('<li id=<%=empLoggedIn.getEmpId()%>chk class="ui-state-default important nomove" title=""><div class="liDiv"><table cellspacing="1" cellpadding="1" border="0" style="width: 100%; table-layout:fixed; border:1px solid #eee"><tbody><tr><td id="apprTypeTd" style="padding:10px 5px; text-align: center; border-left:1px solid #F0F3F7; width: 70px;">결재</td><td class="textLeft ellipsis" style="border-left:1px solid #F0F3F7; padding-left: 3px;"><%=empLoggedIn.getEmpName() + " " + empLoggedIn.getJobName() + " " + empLoggedIn.getDeptName()%></td>	</tr></tbody></table></div></li>');
    })
    
    $('#aprrbutton').click(function(){
    	var squence = 1;
    	$('#apprhead td:not(#first-td)').remove();
    	$('#apprhead').append("<td>기안</td>");
    	
    	for(var i=1;i<$('#ulResult li').length;i++)
	    	$('#apprhead').append('<td>결재</td>');
    	
    	$('#apprbody td').remove();
    	
    	
    	$('#ulResult li').each(function(){
    		var a = $('#'+this.id + " td:last").text().split(" ");
        	$('#apprbody').append('<td><span style="font-size:0.9em">'+a[0]+'<br></span><input type="hidden" name="material_id" value='+this.id.slice(0,-3)+'><input type="hidden" name="material_squence" value='+squence++ +'></td>');
    	});
    })
    
    function check(){
    	if($('#ulResult li').length==1){
    		alert('결재선을 지정해주세요.');
    		return false;
    	}else{
    		return true;
    	}
    }
    </script>
    <!-- niceidt -->

  <script type="text/javascript">
  bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });

  </script> 


<%@ include file="/views/common/footer.jsp"%>
