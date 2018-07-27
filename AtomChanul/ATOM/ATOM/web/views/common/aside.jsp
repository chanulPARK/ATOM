<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	.leftmenu_area .panel .panel-heading {
	border-bottom: 1px solid rgb(221, 221, 221);
	}
	.leftmenu_area .panel .panel-heading a {
	text-decoration: none;
	color: #333;
	}
	.leftmenu_area .panel .panel-heading a:hover {
	text-decoration: none;
	color: #333;
	}
	.leftmenu_area .panel .panel-heading a:active {
	text-decoration: none;
	color: #333;
	}
	.leftmenu_area .panel .panel-heading a:visited {
	text-decoration: none;
	color: #333;
	}
	.leftmenu_area .panel .panel-heading a:link {
	text-decoration: none;
	color: #333;
	}
	.leftmenu_area .panel .panel-collapse .panel-footer a {
	text-decoration: none;
	color: #333;
	}
	.leftmenu_area .panel .panel-collapse .panel-footer a:hover {
	text-decoration: none;
	color: #333;
	}
	.leftmenu_area .panel .panel-collapse .panel-footer a:active {
	text-decoration: none;
	color: #333;
	}
	.leftmenu_area .panel .panel-collapse .panel-footer a:visited {
	text-decoration: none;
	color: #333;
	}
	.leftmenu_area .panel .panel-collapse .panel-footer a:link {
	text-decoration: none;
	color: #333;
	}
	.leftmenu_area .panel .panel-collapse .list:hover {
	background: rgb(221, 221, 221);
	}
</style>
<script>
    $(function () {
        $('#jstree').jstree();
        $('#jstree').on("changed.jstree", function (e, data) {
        console.log(data.selected);
        });
        $('button[id=create]').on('click', function () {
        $('#jstree').jstree(true).select_node('child_node_1');
        $('#jstree').jstree('select_node', 'child_node_1');
        $.jstree.reference('#jstree').select_node('child_node_1');
        });
    });
</script>

<aside>
    <div class="leftmenu_top">
        <h3>
            <a href="<%=request.getContextPath()%>/task/taskList">업무관리</a>
        </h3>
    </div>
    <!-- ./leftmenu_top -->
    <div class="leftmenu-btn">
        <a class="btn btn-default btn-block" href="<%=request.getContextPath()%>/task/taskWrite" role="button">업무 등록</a>
    </div>
    <!-- ./leftmenu-btn -->
    <div class="leftmenu_area">
	    <div class="list-group">
	        <a class="list-group-item" data-toggle="collapse" href="#collapse1" aria-expanded="true">업무 요청</a>
            <div id="collapse1" class="panel-collapse collapse in list-group">
                <a href="<%=request.getContextPath()%>/task/taskList?taskType=1" class="list-group-item">- 발신 업무 요청
                    <span class="badge">2</span>
                </a>
                <a href="<%=request.getContextPath()%>/task/taskList?taskType=1-1" class="list-group-item">- 수신 업무 요청
                    <span class="badge">1</span>
                </a>
            </div>
            <!-- ./list-item_1 -->
            <a class="list-group-item" data-toggle="collapse" href="#collapse2" aria-expanded="true">업무 보고</a>
            <div id="collapse2" class="panel-collapse collapse in list-group">
                <a href="<%=request.getContextPath()%>/task/taskList?taskType=2" class="list-group-item">- 발신 업무 보고
                    <span class="badge">2</span>
                </a>
                <a href="<%=request.getContextPath()%>/task/taskList?taskType=2-1" class="list-group-item">- 수신 업무 보고
                    <span class="badge">1</span>
                </a>
            </div>
            <!-- ./list-item_2 -->
            <a class="list-group-item" href="<%=request.getContextPath()%>/task/taskList?taskType=3" aria-expanded="true">업무 일지</a>
            <!-- ./list-item_3 -->
            <a class="list-group-item" data-toggle="collapse" href="#collapse3" aria-expanded="true">업무 보관함</a>
            <div id="collapse3" class="panel-collapse collapse in">
	            <div class="panel-footer">
	                <div id="jstree">
	                    <ul>
	                        <li>영업부
	                        <ul>
	                            <li id="child_node_1">영업 1팀</li>
	                            <li>영업 2팀</li>
	                        </ul>
	                        </li>
	                        <li>생산부</li>
	                        <li>관리부</li>
	                        <ul>
	                            <li id="child_node_1">인사팀</li>
	                            <li>총무팀</li>
	                        </ul>
	                    </ul>
	                </div>
	            </div>
	        </div>
	        <!-- ./js-tree -->
        </div>
    </div>
    <!-- /.leftmenu_area -->
</aside>