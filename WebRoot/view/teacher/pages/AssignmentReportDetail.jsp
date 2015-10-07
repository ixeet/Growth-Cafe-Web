<%@ taglib prefix="s" uri="/struts-tags"%>

<script type="text/javascript">

$(document).ready(function(){
	$("#schoolIds").val(0);
	$("#classIds").val(0);
	$("#homeRoomIds").val(0);
	$("#courseIds").val(0);
	$("#moduleIds").val(0);
	$("#statusId").val(0);
});

</script>
<script type="text/javascript">

	/* function loadClassMethodShow(){
		var schoolId=$("#schoolIds").val();
		var url="loadAssignmentClassMethod.action";
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
			var HTMLAppand = "<select name='classId' id='classIds'  class='form-control panel-default bgsize' onchange='return loadRoomType();'><option  value='0'>DEPARTMENT(ALL)</option>";
				for(var i=0; i<result.length; i++){
					HTMLAppand=HTMLAppand+"<option value='"+result[i].id+"'>"+result[i].cName+"</option >";
				}
				container.html(HTMLAppand);
				$("#classIds").val(0);
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
 */
	function loadRoomType(){
		var schoolId	=	$("#schoolIds").val();
		var classId		=	$("#classIds").val();
		var url			=	"dashboardHomeRoom.action";
		$.ajax({
			type		:	"POST",
			data		:	{"schoolId":schoolId , "classId":classId},
			url			:	url,
			dataType	:	"json",
			beforeSend	:	function(){
			startwindowDisable();
			
			},
			success		:	function(result){
			var container = $("#loadHomeRoomDetail");
			var HTMLAppand = "<select name='homeRoomId' id='homeRoomIds' class='form-control panel-default bgsize'  onchange='return courseDetail();'><option value='0'>GROUP(ALL)</option>";
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
	
	
	function loadClassMethodShow(){
		var schoolId	=	$("#schoolIds").val();
		var classId		=	$("#classIds").val();
		var homeRoomId	=	$("#homeRoomIds").val();
		var url			=	"courseDetailMethod.action";
		$.ajax({
			type		:	"POST",
			data		:	{"schoolId":schoolId , "classId":classId,"homeRoomId":homeRoomId},
			url			:	url,
			dataType	:	"json",
			beforeSend	:	function(){
			startwindowDisable();
			},
			success		:	function(result){
			var container = $("#loadCourseDetail");
			var HTMLAppand = "<select name='courseId' id='courseIds' class='form-control panel-default bgsize'  onchange='return loadModule();'><option value='0'>COURSE(ALL)</option>";
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
			beforeSend	:	function(){
			startwindowDisable();
			},
			success		:	function(result){
			var container = $("#loadModuleDetail");
			var HTMLAppand = "<select name='moduleId' id='moduleIds' class='form-control panel-default bgsize' ><option value='0'>MODULE(ALL)</option>";
				for(var i=0; i<result.length; i++){
					HTMLAppand=HTMLAppand+"<option value='"+result[i].id+"'>"+result[i].moName+"</option >";
				}
				container.html(HTMLAppand);
				$("#moduleIds").val(0);
			
			},
			complete		:	function(){
			endwindowDisable();
			}
		});
	return false;
	}

	function studentAssignmentViewDetail(schoolId,classId,homeRoomId,courseId,moduleId,assignmentSubmittedById){
	window.location="studentAssignmentViewDetail?assignmentSubmittedById="+assignmentSubmittedById+"&classId="+classId+"&homeRoomId="+homeRoomId+"&courseId="+courseId+"&moduleId="+moduleId+"&schoolId="+schoolId;
	
	}

	/* function loadSubmitDate(){
		var schoolId	=	$("#schoolIds").val();
		var classId		=	$("#classIds").val();
		var homeRoomId	=	$("#homeRoomIds").val();
		var courseId	=	$("#courseIds").val();
		var moduleId	=	$("#moduleIds").val();
		var url			=	"submitDate.action";
		$.ajax({
			type		:	"POST",
			data		:	{"schoolId":schoolId , "classId":classId,"homeRoomId":homeRoomId,"courseId":courseId,"moduleId":moduleId},
			url			:	url,
			dataType	:	"json",
			beforeSend	:	function(){},
			success		:	function(result){
			var container = $("#submitDateDetail");
			var HTMLAppand = "<select name='id' id='submitDateId' class='form-control panel-default bgsize'  onchange='return btnIdShow();'><option value='0'>SUBMISSION DATE</option>";
				for(var i=0; i<result.length; i++){
					HTMLAppand=HTMLAppand+"<option value='"+result[i].id+"'>"+result[i].subDate+"</option >";
				}
				container.html(HTMLAppand);
				$("#submitDateId").val(0);
			
			},
			complete		:	function(){}
		});
	return false;
	} */
	
	 
	 
	
	function filterAllValue(){
		var schoolId	=	$("#schoolIds").val();
		var classId		=	$("#classIds").val();
		var homeRoomId	=	$("#homeRoomIds").val();
		var courseId	=	$("#courseIds").val();
		var moduleId	=	$("#moduleIds").val();
		//var submitDateId=	$("#submitDateId").val();
		
		var url			=	"showDateDetail.action";
		$.ajax({
			type		:	"POST",
			data		:	{"schoolId":schoolId , "classId":classId,"homeRoomId":homeRoomId,"courseId":courseId,"moduleId":moduleId},
			url			:	url,
			beforeSend	:	function(){
			startwindowDisable();
			},
			success		:	function(result){
				$("#showDataDisplayId").html(result);
			},
			complete		:	function(){
			endwindowDisable();
			}
		});
	return false;
	}
</script>



 <div class="container">
<div class="row panel-default" >
	<div class="col-md-2">
		<s:select list="schoolNameList" listValue="schoolName" 
			listKey="schoolId" headerKey="0" headerValue="ORGANIZATION(ALL)" cssClass="form-control panel-default bgsize"
			name="schoolId" id="schoolIds"
			onchange="return loadClassMethodShow();"></s:select>
	</div>
	<%-- <div class="col-md-2">
		<div id="loadClassDetail">
		<select class="form-control panel-default bgsize" name="classId">
			 <option value="0">DEPARTMENT(ALL)</option>
		</select>
		</div>
	</div>

	<div class="col-md-2">
		<div id="loadHomeRoomDetail">
			<select class="form-control panel-default bgsize" name="homeRoomId">
				 <option value="0">GROUP(ALL)</option>
			</select>
		</div>
	</div> --%>

	<div class="col-md-2 ">
		<div id="loadCourseDetail">
		<select class="form-control panel-default bgsize" name="courseId">
			 <option value="0">COURSE(ALL)</option>
		</select>
		</div>
	</div>

	<div class="col-md-2 ">
		<div id="loadModuleDetail">
		<select class="form-control panel-default bgsize" name='moduleId'>
			 <option value="0">MODULE(ALL)</option>
		</select>
		</div>
	</div>

	<%-- <div class="col-md-4 ">
		<div id="submitDateDetail">
		<select class="form-control panel-default bgsize">
			 <option value="0">SUBMISSION DATE</option>
		</select>
		</div>
	</div> --%>

	<!-- <div class="col-md-4 ">
		<input type="button" class="btn-pad normalbutton btn-height" value="Filter" style="height:35px;" onclick="return filterAllValue();">
	</div> -->
	
	<div class="col-md-6 paper-shadow">
		 <div class="media v-middle">
		 <a class="pad4 normalbutton btn-height btn_mar_left" href="javaScript:;" onclick="return filterAllValue();" >Filter</a>
		<!-- <input type="button" onclick="return filterData();"
				class="btn-pad normalbutton btn-height" value="Filter" style="height:35px;"> -->
		</div>
		</div>
	<div>&nbsp;</div> 
<div id="showDataDisplayId" class="col-md-12 col-sm-12 marg10">
		<s:include value="AssignmentReportDisplayTable.jsp" />
	</div>
	
</div>

</div>


