<%@ taglib prefix="s" uri="/struts-tags"%>

<script type="text/javascript">


$(document).ready(function(){
	setTimeout("courseStatusPaiChart()", 6000);
	setTimeout("assignmentStatusPaiChart()", 6000);
});


var courseComplete = 20;
var courseNotStart = 50;
var courseInProgress = 30;

var assignmentComplete = 40;
var assignmentNotStart = 20;
var assignmentInProgress = 40;

function courseCompleteStatus(){
	return courseComplete;
}
function courseNotStartStatus(){
	return courseNotStart;
}
function courseInProgressStatus(){
	return courseInProgress;
}

function assignmentCompleteStatus(){
	return assignmentComplete;
}
function assignmentNotStartStatus(){
	return assignmentNotStart;
}
function assignmentInProgressStatus(){
	return assignmentInProgress;
}

function assignmentStatusPaiChart(){
	var chart = new CanvasJS.Chart("assignmentStatus",
	{
		title:{
			text: "Assignments",
			fontSize: 12,
			fontColor: "#9197a3",
			backgroundColor: "white",
			borderColor: "#e2e9e6",
			padding: 5,
        	borderThickness: 2,
        	cornerRadius: 4,
			fontFamily: "RobotoDraft, 'Helvetica Neue', Helvetica, Arial"
		},
                animationEnabled: true,
		legend: {
			verticalAlign: "bottom",
			horizontalAlign: "center",
			fontSize: 12,
			maxWidth: 300,
			fontFamily: "RobotoDraft, 'Helvetica Neue', Helvetica, Arial"
		},
		
		toolTip: {
			//fontColor: "white",
			backgroundColor: "rgba(255,255,0,.2)"
		},
		
		theme: "theme2",
		data: [
		{        
			type: "pie",
			indexLabelFontFamily: "Garamond",       
			indexLabelFontSize: 20,
			indexLabelFontWeight: "bold",
			startAngle:0,
			indexLabelFontColor: "MistyRose",       
			indexLabelLineColor: "darkgrey", 
			indexLabelPlacement: "inside", 
			toolTipContent: "{name}: {y}%",
			showInLegend: true,
			indexLabel: "#percent%", 
			dataPoints: [
				{  y: assignmentCompleteStatus(), name: "Submitted", legendMarkerType: "square"},
				{  y: assignmentNotStartStatus(), name: "Not Submitted", legendMarkerType: "square"},
				{  y: assignmentInProgressStatus(), name: "Reviewed", legendMarkerType: "square"}
			]
		}
		]
	});
	$(".loadImg").hide();
	chart.render();
}

function courseStatusPaiChart(){

	var chart = new CanvasJS.Chart("courseStatus",
	{
		title:{
			text: "Courses",
			fontSize: 12,
			fontColor: "#9197a3",
			backgroundColor: "white",
			borderColor: "#e2e9e6",
			padding: 5,
        	borderThickness: 2,
        	cornerRadius: 4,
			fontFamily: "RobotoDraft, 'Helvetica Neue', Helvetica, Arial"
		},
                animationEnabled: true,
		legend: {
			verticalAlign: "bottom",
			horizontalAlign: "center",
			fontSize: 12,
			maxWidth: 300,
			fontFamily: "RobotoDraft, 'Helvetica Neue', Helvetica, Arial"
		},
		
		toolTip: {
			//fontColor: "white",
			backgroundColor: "rgba(255,255,0,.2)"
		},
		
		
		theme: "theme2",
		data: [
		{        
			type: "pie",
			indexLabelFontFamily: "Garamond",       
			indexLabelFontSize: 20,
			indexLabelFontWeight: "bold",
			startAngle:0,
			indexLabelFontColor: "MistyRose",       
			indexLabelLineColor: "darkgrey", 
			indexLabelPlacement: "inside", 
			toolTipContent: "{name}: {y}%",
			showInLegend: true,
			indexLabel: "#percent%", 
			 lineThickness: 1,
			dataPoints: [
			
			
				{  y: courseCompleteStatus(), name: "Completed", legendMarkerType: "square"},
				{  y: courseNotStartStatus(), name: "Not Started", legendMarkerType: "square"},
				{  y: courseInProgressStatus(), name: "In Progress", legendMarkerType: "square"}
			]
		}
		]
		
	});
	$(".loadImg").hide();
	chart.render();
}
</script>

<script type="text/javascript">


	function loadClassMethodShow(){
		var schoolId=$("#schoolIds").val();
		var url="loadDashboardClassMethod.action";
		$.ajax({
			type		:	"POST",
			url			:	url,
			data		:	{"schoolId":schoolId},
			dataType	:	"json",
			beforeSend		:	function(){
			startwindowDisable();
			
			},
			success			:	function(result){
			var container = $("#loadClassDetail");
			var HTMLAppand = "<select name='classId' id='classIds' class='form-control panel-default bgsize' onchange='return loadRoomType();'><option value='0'>DEPARTMENT (ALL)</option>";
				for(var i=0; i<result.length; i++){
					HTMLAppand=HTMLAppand+"<option value='"+result[i].id+"'>"+result[i].cName+"</option >";
				}
				container.html(HTMLAppand);
				$("#classIds").val(0);
				$("#homeRoomIds").val(0);
		},
		complete		:	function(){
		endwindowDisable();
		}
		});
	return false;
	}

	function loadRoomType(){
		var schoolId	=	$("#schoolIds").val();
		var classId		=	$("#classIds").val();
		var url			=	"dashboardHomeRoom.action";
		$.ajax({
			type		:	"POST",
			data		:	{"schoolId":schoolId , "classId":classId},
			url			:	url,
			dataType	:	"json",
			beforeSend		:	function(){
			startwindowDisable();
			},
			success		:	function(result){
			var container = $("#loadHomeRoomDetail");
			var HTMLAppand = "<select name='homeRoomId' id='homeRoomIds' class='form-control panel-default bgsize' onchange='return courseDetail();'><option value='0'>GROUP (ALL)</option>";
				for(var i=0; i<result.length; i++){
					HTMLAppand=HTMLAppand+"<option value='"+result[i].id+"'>"+result[i].hrName+"</option >";
				}
				container.html(HTMLAppand);
				$("#homeRoomIds").val(0);
				$("#courseIds").val(0);
			
			},
			complete		:	function(){
		endwindowDisable();
		}
		});
	return false;
	}
	
	
	
function filterData(){
	 var courseId	= $("#courseIds").val();
	var schoolId	=	$("#schoolIds").val();
	var classId		=	$("#classIds").val();
	var homeRoomId	=	$("#homeRoomIds").val();
	
	var url = "courseFilterList.action";
		$.ajax({
		type		:	"POST",
		url			:	url,
		data		:	{"courseId " :courseId, "schoolId":schoolId, "classId":classId,"homeRoomId":homeRoomId},
		/* data		:	datas, */
		beforeSend		:	function(){
			startwindowDisable();
		},
		success		:	function(result){
		$("#courseDetailDiv").html(result);
		
		},
		complete		:	function(){
		endwindowDisable();
		
		}
		});
	return false;
	}

</script>

<script type="text/javascript" src="view/helper/js/canvasjs.min.js"></script>

<style>
.loadImg{
	position: absolute; margin-top: 15%; height: 100px; z-index: 1; margin-left: -57%;
}
</style>
<div class="container">

<div class="row panel-default" >
	<div class="col-md-7">
	
		<div class="col-md-3">
		<s:select list="schoolNameList" listValue="schoolName"
			listKey="schoolId" headerKey="0" headerValue="ORGANIZATION (ALL)" cssClass="form-control panel-default bgsize"
			name="schoolId" id="schoolIds"
			onchange="return loadClassMethodShow();"></s:select>
	</div>
	
	<div class="col-md-3">
		<div id="loadClassDetail">
		<select class="form-control panel-default bgsize " name="classId" >
			 <option value="0">DEPARTMENT (ALL)</option>
		</select>
		</div>
	</div>

	<div class="col-md-3">
		<div id="loadHomeRoomDetail">
			<select class="form-control panel-default bgsize " name="homeRoomId"  >
				 <option value="0">GROUP (ALL)</option>
			</select>
		</div>
	</div>
	<div class="col-md-3 paper-shadow">
		 <a class="pad4 normalbutton btn-height btn_mar_left" href="javaScript:;" onclick="" >Filter</a>
		</div>
		
		<div class="col-md-12" style="background-color: white;height: 320px;padding: 0px;margin-top: 13px;">
		<img  class="loadImg" src='view/helper/images/ajax-loader-large.gif'/>
		<s:include value="PieChartReport.jsp"/>
		</div>
		
	</div>
	
		<div id="recentAssignmentDetailId">
		<s:include value="teacherRecentUpdates.jsp"/>
	
	</div>
</div>
</div>