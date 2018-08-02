<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/mainAside.jsp"%>
<%@ include file="/views/common/rightAside.jsp"%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
<style>
	.panel {
		border-radius: 0;
	}
</style>
<section class="dashboard" style="height: 100%; min-height: 900px; margin-right: 250px; padding-top:9px; border: 0; background: #eaeaea;">
	<div class="content">
		<div class="row">
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading"><i class="fas fa-bullhorn"></i> 공지사항</div>
					<div class="panel-body" style="height: 200px">
						<table class="table table-condensed" style="font-size: 13px; margin: 0;">
							<tr>
								<td><a>ATOM 프로젝트 발표</a></td>
								<td>관리자</td>
								<td>2018.08.03.</td>
							</tr>
							<tr>
								<td><a>8월 식당 메뉴</a></td>
								<td>관리자</td>
								<td>2018.08.01.</td>
							</tr>
							<tr>
								<td><a>사내 공지사항</a></td>
								<td>관리자</td>
								<td>2018.08.01.</td>
							</tr>
							<tr>
								<td><a>2018년 1분기, 승진 축하합니다.</a></td>
								<td>관리자</td>
								<td>2018.07.01.</td>
							</tr>
							<tr>
								<td><a>2017년 창립 기념 행사</a></td>
								<td>관리자</td>
								<td>2017.11.15.</td>
							</tr>
							<tr>
								<td><a>사내 공지사항</a></td>
								<td>관리자</td>
								<td>2017.11.01.</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading"><i class="fa fa-archive"></i> 자원 신청 현황</div>
					<div class="panel-body" style="height: 200px">
						신청하신 [2F 회의실] 대여가 지금 [대기]상태 입니다
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading"><i class="fas fa-tasks"></i> 수신 업무</div>
					<div class="panel-body" style="height: 200px">
						
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading"><i class="fas fa-tasks"></i> 발신 업무</div>
					<div class="panel-body" style="height: 200px">
						
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


<%@ include file="/views/common/footer.jsp"%>
