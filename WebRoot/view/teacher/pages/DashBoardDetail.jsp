<%@ taglib prefix="s" uri="/struts-tags"%>

<script type="text/javascript">


$(document).ready(function(){
	setTimeout("courseStatusPaiChart()", 5000);
	setTimeout("assignmentStatusPaiChart()", 5000);
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
			text: "Teacher Assignment Status",
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
				{  y: assignmentCompleteStatus(), name: "Completed", legendMarkerType: "triangle"},
				{  y: assignmentNotStartStatus(), name: "Not Started", legendMarkerType: "square"},
				{  y: assignmentInProgressStatus(), name: "In Progress", legendMarkerType: "circle"}
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
			text: "Teacher Course Status",
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
			fontFamily: "RobotoDraft, 'Helvetica Neue', Helvetica, Arial",
			maxWidth: 300
		},
		
		toolTip: {
			//fontColor: "white",
			backgroundColor: "rgba(255,255,0,.2)"
		},
		
		
		theme: "theme1",
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
			
			
				{  y: courseCompleteStatus(), name: "Completed", legendMarkerType: "triangle"},
				{  y: courseNotStartStatus(), name: "Not Started", legendMarkerType: "square"},
				{  y: courseInProgressStatus(), name: "In Progress", legendMarkerType: "circle"}
			]
		}
		]
		
	});
	$(".loadImg").hide();
	chart.render();
}
</script>
<script type="text/javascript" src="view/helper/js/canvasjs.min.js"></script>

<style>
.loadImg{
	margin-left: 44%; position: absolute; margin-top: 15%; height:100px;
}
</style>
<div class="container">
<div class="row panel-default" >
	<div class="col-md-7" style="padding: 0px;">
		<img  class="loadImg" src='view/helper/images/ajax-loader-large.gif'/>
		
		<%-- <div class="col-md-2 ">
		<s:select list="schoolList" listValue="schoolName"
			listKey="schoolId" headerKey="0" headerValue="ORGANIZATION (ALL)" cssClass="form-control panel-default bgsize"
			name="schoolId" id="schoolIds"
			onchange="return loadClassMethodShow();"></s:select>
	</div> --%>
	<div class="col-md-3">
		<div id="loadClassDetail">
		<select class="form-control panel-default bgsize " name="classId" >
			 <option value="0">DEPARTMENT (ALL)</option>
		</select>
		</div>
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
		
		
	<div class="col-md-6" style="padding-top: 10px;background-color: white;margin-top: 13px;">
		<div id="courseStatus" style="height: 300px; width: 100%;"></div>
	</div>
	
	<div class="col-md-6" style="padding-top: 10px;background-color: white;margin-top: 13px;">
		<div id="assignmentStatus" style="height: 300px; width: 100%;"></div>
	</div>
	</div>
	
		<%-- <div class="panel panel-default paper-shadow" data-z="0.5" data-hover-z="1" data-animated="">
                        <div class="panel-heading">
                            <h5 class="h5_color">Recent Progress Status</h5>
                        </div>
                        <s:if test="courseReportList!=null"> 
                        <s:iterator value="courseReportList">
                        <div class="panel-body">
                          <div class="media v-middle">
                                            <div class="media-left">
                                                <span class="icon-block half bg-green-300 img-circle text-white"><s:property value="completedPerStatus"/>% </span>
												<span class="center">Start Date </br> 09-2-2015</span>
                                            </div>
                                            <div class="media-body">
                                          <p>  <span class="btn default_bg btn-xs">Organization </span> 
                                              <span>  <s:property value="schoolName"/></span></p>
                                              <p>  <span class="btn default_bg btn-xs">Department </span>
											 <span>	<s:property value="className"/></span></p>
												 <p>  <span class="btn default_bg btn-xs">Group </span> <span>  <s:property value="homeRoomName"/></span> </p>
												<p>  <span class="btn default_bg btn-xs">Course </span> <span>  <s:property value="courseName"/> </span></p>
												<!-- <p class="text-subhead link-text-color">Module B is in Progress</p> -->
                                            </div>
                                            
                                        </div>  
                        </div>
                        <hr class="margin-none">
                        </s:iterator>
                        </s:if>
                        
                    </div> --%>
	
	
	
		<div id="recentAssignmentDetailId">
		<%-- <s:include value="RecentAssignmentDetail.jsp"/> --%>
		<s:include value="teacherRecentUpdates.jsp"/>
	
	</div>
</div>
</div>