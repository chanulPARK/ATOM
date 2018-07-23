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

.search_btn{
  padding: 4% 0%;
}


.search-wrap th{
  padding-right: 1em;
  text-align: right;
}

.search-wrap{
  background-color: #f1f1f1;
}

#listTable th{
  text-align: center;
}
	
	</style>
</head>


	<aside>
      <div class="sidenav">
        <div class="sidemenu">
          <button class="dropdown-btn">기안
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-container">
            <a href="<%=request.getContextPath()%>/electronic/electronicApprovalForm">기안문작성</a>
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
              <h4>결재대기함</h4>
              <hr>
          </div>
          <div class="row" >


            <!-- search start-->
			<div class="search-wrap">
				<div class="form-group">
          <form class="form-inline">

					<table class="col-sm-10">
						<caption></caption>
						<colgroup>
              <col style="width: 7%;"/>
							<col style="width: 25%;"/>
							<col style="width: 7%;"/>
							<col style="width: 41%;"/>

						</colgroup>
						<tbody>
							<tr>
								<th><label for="searchUserName">기안자</label></th>
								<td><input id="searchUserName" name="searchUserName" value="" type="text" title="기안자" class="form-control"></td>
								<th><label for="searchFormName">양식명</label></th>
								<td><input id="searchFormName" name="searchFormName" value="" type="text" title="양식명" class="form-control"></td>
							</tr>
							<tr>
								<th>
									<select id="toggleSearchType" class="form-control">
										<option value="searchApprTitle" >
											문서제목
										</option>
										<option value="searchApprContent" >
											문서내용
										</option>
									</select>
								</th>
								<td>
									<input  id="inputSearchType" type="text" class="form-control" title="문서제목"	name="searchApprTitle" value="" style="width:100%">
								</td>
								<th>
									<label>배정일</label>
								</th>
								<td>
									<input type="text" title="시작일" id="searchStartDate" name="searchStartDate" value="" class="form-control" placeholder="시작일">
									<button type="button" class="btn btn-color7 br tbl-inner"><i class="fa fa-calendar"></i></button>
								  <span>~</span>
									<input type="text" title="종료일" id="searchEndDate" name="searchEndDate" value="" class="form-control" placeholder="종료일">
									<button type="button" class="btn btn-color7"><i class="fa fa-calendar"></i></button>
								</td>
							</tr>
							<tr>
									<th scope="row"><label for="searchApprDocNo">문서번호</label></th>
										<td><input id="searchApprDocNo" type="text" title="문서번호" name="searchApprDocNo" value="" class="form-control" />
									</td>
							</tr>
						</tbody>
					</table>

					<div class="search_btn">
						<button type="button" id="searchApListButton"  class="btn btn-color5"><i class="fa fa-search fa-fw"></i> 검색</button>
					</div>
        </form>

				</div>
			</div>
			<!-- search end-->





          </div>
          <div class="row">
            <div class="table-header">
              <div class="totalnum">전체<span> 0</span>
            </div>
            <div class="content-list approval">

            </div>
            <!--  listable-->
            <table class="table table-striped" id="listTable">
              <caption></caption>
              <colgroup>
                      <col width="3%"/>
                      <col width="4%"/>
                      <col width="8%"/>
                      <col width="10%"/>
                      <col width="7%"/>
                      <col width="*"/>
                      <col width="10%"/>
                      <col width="13%"/>
                      <col width="13%"/>
                      <col width="13%"/>
              </colgroup>
              <thead>
                <tr>
                  <th scope="col"><input name="allCheck" id="allCheck" title="checkbox" type="checkbox" value="" /></th>
                  <th scope="col">NO</th>
                  <th scope="col">서식함</th>
                  <th scope="col">문서번호</th>
                  <th scope="col">유형</th>
                  <th scope="col">
                    <a onclick="" href="#" style="">
                      문서제목<i class="fa fa-caret-down"></i>
                    </a>
                  </th>
                  <th scope="col">기안자</th>
                  <th scope="col">기안부서</th>
                  <th scope="col">
                    <a onclick=""  href="#a">
                    기안일<i class="fa fa-caret-down"><span class="blind"></span></i>
                    </a>
                  </th>
                  <th scope="col">
                        <a onclick=""  href="#a">
                          배정일<i class="fa fa-caret-down active"><span class="blind"></span></i>
                        </a>

                  </th>
                </tr>
              </thead>
              <tbody>
                    <tr>
                      <td colspan="10" class="emptyRecord">검색 결과가 존재하지 않습니다.</td>
                    </tr>
              </tbody>
            </table>
            <div class="btn-wrap">
            <button type="button" class="btn btn-color5 pull-right" id="allApproval">일괄결재 </button>
            </div>
          </div>
        </div>

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
    </script>

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<!--     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
 -->    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="<%=request.getContextPath()%>/dist/js/bootstrap.min.js"></script>
  	
<%-- <%@ include file="/views/common/footer.jsp"%> --%>