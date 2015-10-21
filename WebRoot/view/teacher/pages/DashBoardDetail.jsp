<%@ taglib prefix="s" uri="/struts-tags"%>
   



<script type="text/javascript">


$(document).ready(function(){
$("#highcharts-0").removeClass("highcharts-button");
	setTimeout("courseStatusPaiChart()", 3000);
	setTimeout("assignmentStatusPaiChart()", 3000);
	setTimeout("columnChart()", 3000);

	
});


	function columnChart(){
	
 $('#containerOne').highcharts({
        title: {
            text: 'Combination chart'
        },
        xAxis: {
            categories: ['A', 'A+', 'B', 'B+', 'C','C+','D']
        },
        series: [{
            type: 'column',
            name: 'Grades',
             data: [15, 22, 13, 10, 25,8,20]
                  
        }, {
            type: 'pie',
            name: 'Total consumption',
           
            center: [100, 80],
            size: 100,
            showInLegend: false,
            dataLabels: {
                enabled: false
            }
        }]
    });
 
	}

 
function courseCompleteStatus(){
var courseComplete = $("#courseCompleteId").val();
var temp = parseInt(courseComplete);
	return temp;
}
function courseNotStartStatus(){
var courseNotStart = $("#courseNotStartedId").val();
var temp1 = parseInt(courseNotStart);
	return temp1;
	//return courseNotStart;
}
function courseInProgressStatus(){
var courseInProgress =$("#courseProgressId").val();
var temp2 = parseInt(courseInProgress);
	return temp2;
	//return courseInProgress;
}

 

function assignmentCompleteStatus(){
var assignmentId = $("#assignmentCompleteId").val();
var assigStatus = parseInt(assignmentId);
	return assigStatus;
}
function assignmentNotStartStatus(){
	var assignmentStatusId = $("#assignmentNotEnabledId").val();
var assignStatus = parseInt(assignmentStatusId);
	return assignStatus;
}
function assignmentInProgressStatus(){
	var assignmentStatusId = $("#assignmentOpenId").val();
var assignmentssStatus = parseInt(assignmentStatusId);
	return assignmentssStatus;
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
			/* toolTipContent: "{name}: {y}%", */
			toolTipContent: "{y}%",
			showInLegend: true,
			indexLabel: "#percent%", 
			dataPoints: asignmnt()
			
				/* {  y: assignmentCompleteStatus(), name: "Open", legendMarkerType: "square"},
				{  y: assignmentNotStartStatus(), name: "Not Enabled", legendMarkerType: "square"},
				{  y: assignmentInProgressStatus(), name: "Closed", legendMarkerType: "square"} */
				
			
		}
		]
	});
	$(".loadImg").hide();
	chart.render();
}


function asignmnt(){
//alert(assignmentCompleteStatus()+" "+ assignmentNotStartStatus()+" "+assignmentInProgressStatus());
if(assignmentNotStartStatus() !=0){
	if(assignmentInProgressStatus() !=0){
		 if(assignmentCompleteStatus()!=0){
			var values =[{y :assignmentNotStartStatus(),color:"#4F81BC"},{y:assignmentInProgressStatus(),color:"#C0504E"},{y :assignmentCompleteStatus(),color:"#9BBB58"}]
	}
	else  if(assignmentCompleteStatus()==0){
			var values =[{y:assignmentInProgressStatus(),color:"#C0504E"},{y:assignmentNotStartStatus(),color:"#4F81BC"}]
	}
	}
	else if(assignmentInProgressStatus() ==0){
		 if(assignmentCompleteStatus()!=0){
			var values =[{y :assignmentCompleteStatus(),color:"#9BBB58"},{y :assignmentNotStartStatus(),color:"#4F81BC"}]
		}
		else if(assignmentCompleteStatus()==0){
			var values =[{y :assignmentNotStartStatus(),color:"#4F81BC"}]
		}
	}
}

else if(assignmentNotStartStatus() ==0){
	if(assignmentInProgressStatus() !=0){
		 if(assignmentCompleteStatus()!=0){
			var values =[{y:assignmentInProgressStatus(),color:"#C0504E"},{y :assignmentCompleteStatus(),color:"#9BBB58"}]
	}
	else  if(assignmentCompleteStatus()==0){
			var values =[{y:assignmentInProgressStatus(),color:"#C0504E"}]
	}
	}
	else if(assignmentInProgressStatus() ==0){
		 if(assignmentCompleteStatus()!=0){
			var values =[{y :assignmentCompleteStatus(),color:"#9BBB58"}]
		}
		/* else if(assignmentCompleteStatus()==0){
			var values =[{y :assignmentNotStartStatus()}]
		} */
	}
}

return values;
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
			toolTipContent: 	"{y}%",
			showInLegend: true,
			indexLabel: "#percent%", 
			 lineThickness: 1,
			dataPoints:  aa()
			
			}
		]
		
	});
	$(".loadImg").hide();
	chart.render();
}


function aa(){
if(courseNotStartStatus() !=0){
	if(courseInProgressStatus() !=0){
		 if(courseCompleteStatus()!=0){
			var val =[{y :courseNotStartStatus(),color:"#4F81BC"},{y:courseInProgressStatus(),color:"#C0504E"},{y :courseCompleteStatus(),color:"#9BBB58"}]
	}
	  if(courseCompleteStatus()==0){
			var val =[{y:courseInProgressStatus(),color:"#C0504E"},{y:courseNotStartStatus(),color:"#4F81BC"}]
	}
	}
	else if(courseInProgressStatus() ==0){
		 if(courseCompleteStatus()!=0){
			var val =[{y :courseCompleteStatus(),color:"#9BBB58"},{y :courseNotStartStatus(),color:"#4F81BC"}]
		}
		 if(courseCompleteStatus()==0){
			var val =[{y :courseNotStartStatus(),color:"#4F81BC"}]
		}
	}
}

else if(courseNotStartStatus() ==0){
	if(courseInProgressStatus() !=0){
		 if(courseCompleteStatus()!=0){
			var val =[{y:courseInProgressStatus(),color:"#C0504E"},{y :courseCompleteStatus(),color:"#9BBB58"}]
	}
	
	else if(courseCompleteStatus()!=0){
			var val =[{y:courseInProgressStatus(),color:"#C0504E"},{y :courseCompleteStatus(),color:"#9BBB58"}]
	  
	}
	else if(courseCompleteStatus()==0){
			var val =[{y:courseInProgressStatus(),color:"#C0504E"}]
	
	}
	}
	else if(courseInProgressStatus() ==0){
		 if(courseCompleteStatus()!=0){
			var val =[{y :courseCompleteStatus(),color:"#9BBB58"}]
		}
	}
}
return val;
}


function picode(){
 var chart = new CanvasJS.Chart("chartConta",
    {
     
      axisY: {
        title: "Number of Student"
      },
      legend: {
        verticalAlign: "bottom",
        horizontalAlign: "center"
      },
      
      data: [

      {        
        color: "#B0D0B0",
        type: "column",  
        showInLegend: true, 
        legendMarkerType: "none",
        legendText: "Grades",
        dataPoints: [      
        { x: 1, y: 15, label: "A+"},
        { x: 2, y: 10,  label: "A" },
        { x: 3, y: 15,  label: "B"},
        { x: 4, y: 20,  label: "B+"},
        { x: 5, y: 25,  label: "C"},
        { x: 6, y: 30, label: "C+"},
        { x: 7, y: 45,  label: "D"},        
        ]
      }
      ]
    });

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
	
	
	function filterData(){
		var schoolId	=	$("#schoolIds").val();
		var classId		=	$("#classIds").val();
		var homeRoomId	=	$("#homeRoomIds").val();
		var url="filterCourseData.action";
		$.ajax({
			type	:	"POST",
			url		:	url,
			data	:	{"schoolId":schoolId,"classId":classId, "homeRoomId":homeRoomId},
			beforeSend	:	function(){
			startwindowDisable();
			},
			success		:	function(result){
			$("#dashBoardPieChartId").html(result);
			courseStatusPaiChart();
			assignmentStatusPaiChart();
			
		
			
			},
			complete	:	function(){
				endwindowDisable();
			}
		});		
	return false;
	}



</script>



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
		 <a class="pad4 normalbutton btn-height btn_mar_left" href="javaScript:;" onclick="return filterData();" >Filter</a>
		</div>
		<img  class="loadImg" src='view/helper/images/ajax-loader-large.gif'/>
		<div class="col-md-12" style="background-color: white;height: 335px;padding: 0px;margin-top: 13px;">
		<s:include value="PieChartReport.jsp"/>
		</div>
		<!-- <div class="col-md-12"  style="background-color: white;height: 320px;padding: 0px;margin-top: 13px;">
		<div id="containerOne" style="height: 300px; width: 100%;"></div>
	</div> -->
	
	<div id="dashBoardPieChartId">
	<s:include value="DashBoardPieChartDetail.jsp"/>
	</div>
	</div>
	
		<div id="recentAssignmentDetailId">
		<s:include value="teacherRecentUpdates.jsp"/>
	
	</div>
	
	
</div>
</div>