<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>








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

.appline-wrap td{

}

#first-td{
  width:1.3em;padding:0.7em 0em;
}

#first-td~td {
  height:1px;width:5.5em;
}



        /* border-bottom: solid 1px rgb(153, 153, 153); */
        /* border-bottom: solid 1px rgb(222, 226, 230); */
    </style>
  </head>


<aside>
      <div class="sidenav">
        <div class="sidemenu">
          <button class="dropdown-btn">기안
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-container">
            <a href="#">기안문작성</a>
            <a href="#">결재요청함</a>
          </div>
        </div>
        <div class="sidemenu">
          <button class="dropdown-btn">결재
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-container">
            <a href="#">결재대기함</a>
            <a href="#">결재진행함</a>
            <a href="#">완료분서함</a>
            <a href="#">반려문서함</a>
          </div>
        </div>
      </div>
    </aside>

    <section>
        <div class="content">
          <div class="row">
              <h4>기안문 작성</h4>
              <hr>
          </div>
          <div class="row" >


          <div id="formButtonDiv" class="btn-wrap pt10 pull-right">
      	    <button id="addApprLineButton" type="button" class="btn btn-">결재선</button>
      	    <button id="createApprDocButton" type="button" class="btn btn-color5 br">결재요청</button>
      	    <!-- <button id="addApprRefInfoButton" type="button" class="btn btn-default">기결재첨부</button> -->
      			<!-- <button id="createApprDocTemporayButton" type="button" class="btn btn-default">임시저장</button> -->
      			<button id="listApprDocButton" type="button" class="btn btn-default">취소</button>
      	  </div>


      	<div class="content-wrap approval responsive">
      		<div class="content-write">
      			<form id="apprDocForm" name="apprDocForm" method="post" action="/groupware/approval/work/apprWorkDoc/createApprDoc.do">
      				<input name="msie" type="hidden" value="0" />
      		        <input type="hidden" name="systemId" value="GW"/>
      		        <input type="hidden" name="formId" value="389922"/>
      		        <input type="hidden" name="formVersion" value="1"/>
      		        <input type="hidden" name="apprDocType" value="0"/>
      		        <textarea title="formLayoutData" name="formLayoutData" style="display:none;"></textarea>
      		        <input type="hidden" name="isLinkUrl" value="0"/>
      		        <input type="hidden" name="linkDataType" value="0"/>
      		        <textarea title="formData" name="formData" style="display:none;"></textarea>
      		        <input type="hidden" name="defLineId" value="" />
      		        <input type="hidden" name="defLineUse" value="0" />
      		        <input type="hidden" name="isDefLineUpdate" value="0" />
      		        <input type="hidden" name="isRequestForm" value="0"/>
      		        <input type="hidden" name="apprId" value=""/>
      		        <input type="hidden" name="registerJobTitle" value="회장"/>
      		        <textarea title="formLinkedData" name="formLinkedData" style="display:none;"></textarea>
      		        <input type="hidden" name="apprLineType" value="0"/>
      		        <input type="hidden" name="apprLine"/>
      		        <input type="hidden" name="referenceId"/>
      		        <input type="hidden" name="readId"/>
      		        <input type="hidden" name="apprReceiveLine"/>
      		        <input type="hidden" name="apprDocStatus" value="1"/>
      		        <input type="hidden" name="isApprReceive" value="0" />
      		        <input type="hidden" name="listType" value="listApprForm"/>
      		        <input type="hidden" name="registerMessage" />
      		        <input type="hidden" name="apprRefId" />
      		        <input type="hidden" name="mode" value="new"/>
      		        <input type="hidden" name="linkType" value=""/>
      		        <input type="hidden" name="popupYn" value="false"/>
      		        <input type="hidden" name="modalYn" value="Y"/>
      		        <input type="hidden" name="isEmergency"/>
      		        <input type="hidden" name="appKey01" value=""/>
      		        <input type="hidden" name="appKey02" value=""/>
      		        <input type="hidden" name="appKey03" value=""/>
      		        <input type="hidden" name="appKey04" value=""/>
      		        <input type="hidden" name="appKey05" value=""/>
      		        <input type="hidden" name="isOfficial" value="0" />
      		        <input type="hidden" name="systemType" value="0" />
      		        <textarea title="formHtmlData" name="formHtmlData" style="display:none;"></textarea>


      				<h3 style="margin: 2% 45%">기안용지</h3>

      				<div class="appline-wrap pull-right">
                <table border="1" style="text-align:center">
                  <tbody>
                    <tr>
                      <td id="first-td" rowspan="2">결<br><br>재</td>
                      <td>기안</td>
                      <td>기안</td>
                    </tr>
                    <tr>
                      <td id="second-td">김올레</td>
                      <td>김올레</td>
                    </tr>
                  </tbody>
                </table>
      				</div>



      				<div class="form-block bdr-t">

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
      								<td>2018.07.12</td>
      							</tr>
      							<tr>
      								<th>기안자</th>
      								<td>김올레</td>
      								<th>기안부서</th>
      								<td>해외영업팀</td>
      							</tr>

      							<tr>
      								<th>참조자</th>
      								<td>
      									<div id="selectReferenceId" class="input-group organization"></div>
      								</td>
      								<th>빈칸?</th>
      								<td>
      							        <span id="apprRefInfoUl"></span>
      								</td>
      							</tr>

      							<tr>
      								<th><span class="text-point-b">*</span>문서제목</th>
      								<td colspan="3">
                       					 <input type="text" title="문서제목"  name="apprTitle" value="" class="form-control inputbox w100p" maxlength="100" placeholder="문서제목을 입력하세요. " />
      								</td>
      							</tr>
      						</tbody>
      					</table>
      				</div>

              <div class="">
                <textarea id="reqcontent" name="name" rows="8" cols="80" style="width:100%"></textarea>
              </div>
      		        <!--  template의 jsp 호출 시작-->

      				<!--  template의 jsp 호출 끝-->

      				<div id="formLinkedHtmlDataDiv" style="border: 1px solid #e0e0e0;" class="mt10 padding10 none"></div>
      					<div class="border_t1" style="border-top:none !important;">
      				        <div id="editorDiv">
      				        	<textarea id="formEditorData" title="formEditorData" name="formEditorData" style="display:none;"></textarea>
      				        </div>
      				    </div>
      			</form>

      			<form id="listForm" name="listForm" method="get" action="/groupware/approval/work/apprWorkForm/listApprForm.do">
      			    <input type="hidden" name="topFormParentId" value="389919" />
      			    <input type="hidden" name="formParentId" value="389919" />
      			    <input type="hidden" name="formId" value="389922" />
      			    <input type="hidden" name="actionType" value="" />
      			    <input type="hidden" name="sortColumn" value="" />
      			    <input type="hidden" name="sortType" value="" />
      			    <input type="hidden" name="usage" value="0"/>
      			    <input type="hidden" name="searchWord" value=""/>
      			    <input type="hidden" name="pageIndex" value="1"/>
      			    <input type="hidden" name="pagePerRecord" value="10"/>
      			    <input type="hidden" name="linkType" value=""/>
      			</form>
      		</div>
      	</div>

      	<div id="formButtonDiv" class="btn-wrap pull-right">
      	    <button id="addApprLineButton" type="button" class="btn btn-color5 br">결재선</button>

      	    <button id="createApprDocButton" type="button" class="btn btn-color5 br">결재요청</button>
      			<button id="listApprDocButton" type="button" class="btn btn-color7 br">취소</button>

      	</div>

      <div class="blockBlank_10px"></div>
      <div class="blockBlank_20px"></div>
      		</div>
      	</div>


    </section>

    <footer>
        <p>COPYRIGHT @ ATOM ALL RIGHTS RESERVED</p>
    </footer>


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
    </script>

    <!-- nicedit 호출 -->
    <script type="text/javascript">
      bkLib.onDomLoaded(function() {
        myNicEditor = new nicEditor({
          fullPanel : true
        }).panelInstance('reqcontent');
      });
    </script>

<%@ include file="/views/common/footer.jsp"%>