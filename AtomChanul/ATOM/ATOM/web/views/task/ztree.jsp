<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<HTML>
<HEAD>
<TITLE> ZTREE DEMO </TITLE>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="demoStyle/demo.css" type="text/css">
<link rel="stylesheet" href="zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="jquery-1.4.2.js"></script>
<script type="text/javascript" src="jquery.ztree.core-3.x.js"></script>
<SCRIPT LANGUAGE="JavaScript">
	var zTreeObj;
	// zTree configuration information, refer to API documentation (setting details)
	var setting = {};
	// zTree data attributes, refer to the API documentation (treeNode data details)
	var zNodes = [
	{name:"test1", open:true, children:[
			{name:"test1_1"}, {name:"test1_2"}]},
	{name:"test2", open:true, children:[
		{name:"test2_1"}, {name:"test2_2"}]}
	];
	
	$(document).ready(function(){
		zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
	});
</SCRIPT>
</HEAD>
<BODY>
<div>
	<ul id="treeDemo" class="ztree"></ul>
</div>
</BODY>
</HTML>