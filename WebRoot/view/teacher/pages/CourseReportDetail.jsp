<%@ taglib prefix="s" uri="/struts-tags"%>

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
				$("#courseIds").val(0);
				$("#moduleIds").val(0);
				
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
			var HTMLAppand = "<select name='homeRoomId' id='homeRoomIds' onchange='return courseDetail();' class='form-control panel-default bgsize'><option value='0'>GROUP (ALL)</option>";
				for(var i=0; i<result.length; i++){
					HTMLAppand=HTMLAppand+"<option value='"+result[i].id+"'>"+result[i].hrName+"</option >";
				}
				container.html(HTMLAppand);
				$("#homeRoomIds").val(0);
				$("#courseIds").val(0);
				$("#moduleIds").val(0);
				$("#statusId").val(0);
			},
			complete		:	function(){
		endwindowDisable();
		}
		});
	return false;
	}
	
	
	function courseDetail(){
		var schoolId	=	$("#schoolIds").val();
		var classId		=	$("#classIds").val();
		var homeRoomId	=	$("#homeRoomIds").val();
		var url			=	"courseDetailMethod.action";
		$.ajax({
			type		:	"POST",
			data		:	{"schoolId":schoolId , "classId":classId,"homeRoomId":homeRoomId},
			url			:	url,
			dataType	:	"json",
			beforeSend		:	function(){
			startwindowDisable();
			},
			success		:	function(result){
			var container = $("#loadCourseDetail");
			var HTMLAppand = "<select name='courseId' id='courseIds' class='form-control panel-default bgsize' onchange='return loadModule();'><option value='0'>COURSE (ALL)</option>";
				for(var i=0; i<result.length; i++){
					HTMLAppand=HTMLAppand+"<option value='"+result[i].id+"'>"+result[i].coName+"</option >";
				}
				container.html(HTMLAppand);
				$("#courseIds").val(0);
				$("#moduleIds").val(0);
				$("#statusId").val(0);
			
			},
		complete		:	function(){
		endwindowDisable();
		}
		});
	return false;
	}



function loadModule(){
		var schoolId	=	$("#schoolIds").val();
		var classId		=	$("#classIds").val();
		var homeRoomId	=	$("#homeRoomIds").val();
		var courseId	=	$("#courseIds").val();
		var url			=	"moduleDetailMethod.action";
		$.ajax({
			type		:	"POST",
			data		:	{"schoolId":schoolId , "classId":classId,"homeRoomId":homeRoomId,"courseId":courseId},
			url			:	url,
			dataType	:	"json",
			beforeSend		:	function(){
			startwindowDisable();
			},
			success		:	function(result){
			var container = $("#loadModuleDetail");
			var HTMLAppand = "<select name='moduleId' id='moduleIds' class='form-control panel-default bgsize'  onchange='return loadStatus();'><option value='0'>MODULE (ALL)</option>";
				for(var i=0; i<result.length; i++){
					HTMLAppand=HTMLAppand+"<option value='"+result[i].id+"'>"+result[i].moName+"</option >";
				}
				container.html(HTMLAppand);
			$("#moduleIds").val(0);
				$("#statusId").val(0);
			
			},
			complete		:	function(){
		endwindowDisable();
		}
		});
	return false;
	}
	
	function loadStatus(){
		var container = $("#loadStatusDetail");
		var HTMLAppand = "<select name='statusId' id='statusId'  class='form-control panel-default bgsize'><option value='0'>STATUS (ALL)</option>";
			HTMLAppand=HTMLAppand+"<option value='1'>Schedule</option ><option value='2'>In Progress</option ><option value='3'>Completed</option >";
			container.html(HTMLAppand);
			
	return false;
	}
	
 
 
function filterData(){
//var datas=$("#courseDetailIds").serialize();
	 var courseId	= $("#courseIds").val();
	var schoolId	=	$("#schoolIds").val();
	var classId		=	$("#classIds").val();
	var homeRoomId	=	$("#homeRoomIds").val();
	
	var url = "courseFilterList.action";
		$.ajax({
		type		:	"POST",
		url			:	url,
		data		:	{"courseId " :0, "schoolId":schoolId, "classId":0,"homeRoomId":0},
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
	
	function showCourse(){
		window.location="courseDetail";
	}


function viewDetail(courseId,moduleId,schoolId,classId,homeRoomId){

window.location="viewListDetail?courseId="+courseId+"&moduleId="+moduleId+"&schoolId="+schoolId+"&classId="+classId+"&homeRoomId="+homeRoomId;
}

function changeStatusDetail(event){
var sessionId=$(event.currentTarget).val();
var testValue = $(event.currentTarget).text();
if(testValue == "Complete"){
	var status=0;
}

  var url = "changeDetailTeach.action";
	$.ajax({
	type		:	"POST",
	url			:	url,
	data		:	{"moduleSessionId":sessionId, "statusCode":status},
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
 /* $("#courseDetailDiv").html(result); */
 </script>


 <div class="container">
<div class="row panel-default" >
	<!-- <div class="col-md-12 ">
		<div class="list-group-item active">Course Console</div>
	</div> -->
			<div class="col-md-2 ">
		<s:select list="schoolNameList" listValue="schoolName"
			listKey="schoolId" headerKey="0" headerValue="ORGANIZATION (ALL)" cssClass="bgsize form-control panel-default bgsize"
			name="schoolId" id="schoolIds"
			onchange="return loadClassMethodShow();"></s:select>
	</div>
	<%-- <div class="col-md-2 ">
		<div id="loadClassDetail">
		<select class="form-control panel-default bgsize " name="classId" >
			 <option value="0">DEPARTMENT (ALL)</option>
		</select>
		</div>
	</div>

	<div class="col-md-2 ">
		<div id="loadHomeRoomDetail">
			<select class="form-control panel-default bgsize" name="homeRoomId"  >
				 <option value="0">GROUP (ALL)</option>
			</select>
		</div>
	</div>
	<div class="col-md-2 ">
		<div id="loadCourseDetail">
		<select class="form-control panel-default bgsize" name="courseId" >
			 <option value="0">COURSE (ALL)</option>
		</select>
		</div>
	</div> --%>
 
		<div class="col-md-10 paper-shadow">
		 <div class="media v-middle">
		 <a class="pad4 normalbutton btn-height btn_mar_left" href="javaScript:;" onclick="return filterData();" >Filter</a>
		<!-- <input type="button" onclick="return filterData();"
				class="btn-pad normalbutton btn-height" value="Filter" style="height:35px;"> -->
		</div>
		</div>
	<div>&nbsp;</div>
	<div class="col-md-12 col-sm-12 marg10" id="courseDetailDiv">
		<s:include value="CoursesDisplayTable.jsp" />
	</div>
</div>

</div>
