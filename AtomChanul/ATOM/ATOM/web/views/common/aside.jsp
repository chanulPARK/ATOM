<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<aside>
    <div class="leftmenu_top">
        <h3>
            <a href="#">업무관리</a>
        </h3>
    </div>
    <div class="leftmenu-btn">
        <a class="btn btn-default btn-block" href="write.html" role="button">업무 등록</a>
    </div>
    <div class="leftmenu_area">
        <div class="list-group">
            <a href="#" class="list-group-item task_request">업무 요청
                <span class="glyphicon glyphicon-chevron-down float-right"></span>
            </a>
            <a class="list-group-item">- 발신 업무 요청
                <span class="badge">2</span>
            </a>
            <a class="list-group-item">- 수신 업무 요청
                <span class="badge">1</span>
            </a>

            <a href="#" class="list-group-item">업무 보고
                <span class="glyphicon glyphicon-chevron-down float-right"></span>
            </a>
            <a class="list-group-item">- 발신 업무 보고
            </a>
            <a class="list-group-item">- 수신 업무 보고
                <span class="badge">3</span>
            </a>

            <a href="#" class="list-group-item">업무 보관함
                <span class="glyphicon glyphicon-chevron-down float-right"></span>
            </a>
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
</aside>