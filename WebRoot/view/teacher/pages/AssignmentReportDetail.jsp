<%@ taglib prefix="s" uri="/struts-tags"%>

<script type="text/javascript">

	function loadClassMethodShow(){
		var schoolId=$("#schoolIds").val();
		var url="loadClassMethod.action";
		$.ajax({
			type		:	"POST",
			url			:	url,
			data		:	{"schoolId":schoolId},
			dataType	:	"json",
		
			sendBefore		:	function(){},
			success			:	function(result){
			var container = $("#loadClassDetail");
			var HTMLAppand = "<select name='classId' id='classIds' class='form-control outLine' onchange='return loadRoomType();'><option value='-1'>SELECT ClASS</option>";
				for(var i=0; i<result.length; i++){
					HTMLAppand=HTMLAppand+"<option value='"+result[i].id+"'>"+result[i].scName+"</option >";
				}
				container.html(HTMLAppand);
				$("#classIds").val(-1);
		},
		complete		:	function(){
		}
		});
	return false;
	}

	function loadRoomType(){
		var schoolId	=	$("#schoolIds").val();
		var classId		=	$("#classIds").val();
		var url			=	"homeRoom.action";
		$.ajax({
			type		:	"POST",
			data		:	{"schoolId":schoolId , "classId":classId},
			url			:	url,
			dataType	:	"json",
			semdBefore	:	function(){},
			success		:	function(result){
			var container = $("#loadHomeRoomDetail");
			var HTMLAppand = "<select name='homeRoomId' id='homeRoomIds' class='form-control outLine'  onchange='return courseDetail();'><option value='-1'>SELECT HOOM ROOM</option>";
				for(var i=0; i<result.length; i++){
					HTMLAppand=HTMLAppand+"<option value='"+result[i].id+"'>"+result[i].hrName+"</option >";
				}
				container.html(HTMLAppand);
				$("#homeRoomIds").val(-1);
			
			},
			comlete		:	function(){}
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
			semdBefore	:	function(){},
			success		:	function(result){
			var container = $("#loadCourseDetail");
			var HTMLAppand = "<select name='courseId' id='courseIds' class='form-control outLine'  onchange='return loadModule();'><option value='-1'>SELECT COURSE</option>";
				for(var i=0; i<result.length; i++){
					HTMLAppand=HTMLAppand+"<option value='"+result[i].id+"'>"+result[i].coName+"</option >";
				}
				container.html(HTMLAppand);
				$("#courseIds").val(-1);
			
			},
			comlete		:	function(){}
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
			semdBefore	:	function(){},
			success		:	function(result){
			var container = $("#loadModuleDetail");
			var HTMLAppand = "<select name='moduleId' id='moduleIds' class='form-control outLine'  onchange='return loadSubmitDate();'><option value='-1'>SELECT MODULE</option>";
				for(var i=0; i<result.length; i++){
					HTMLAppand=HTMLAppand+"<option value='"+result[i].id+"'>"+result[i].moName+"</option >";
				}
				container.html(HTMLAppand);
				$("#moduleIds").val(-1);
			
			},
			comlete		:	function(){}
		});
	return false;
	}



	function loadSubmitDate(){
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
			semdBefore	:	function(){},
			success		:	function(result){
			var container = $("#submitDateDetail");
			var HTMLAppand = "<select name='id' id='submitDateId' class='form-control outLine'  onchange='return btnIdShow();'><option value='-1'>SELECT SUBMISSION DATE</option>";
				for(var i=0; i<result.length; i++){
					HTMLAppand=HTMLAppand+"<option value='"+result[i].id+"'>"+result[i].subDate+"</option >";
				}
				container.html(HTMLAppand);
				$("#submitDateId").val(-1);
			
			},
			comlete		:	function(){}
		});
	return false;
	}
	
	 
	 
	
	function filterAllValue(){
		var schoolId	=	$("#schoolIds").val();
		var classId		=	$("#classIds").val();
		var homeRoomId	=	$("#homeRoomIds").val();
		var courseId	=	$("#courseIds").val();
		var moduleId	=	$("#moduleIds").val();
		var submitDateId=	$("#submitDateId").val();
		
		if(schoolId == -1){
			$("#schoolIds").addClass("fieldFill");
		}
		else if(schoolId != -1){
			$("#schoolIds").removeClass("fieldFill");
		}
		if(classId == -1){
			$("#classIds").addClass("fieldFill");
		}
		else if(classId != -1){
			$("#classIds").removeClass("fieldFill");
		}
		if(homeRoomId == -1){
			$("#homeRoomIds").addClass("fieldFill");
		}
		else if(homeRoomId != -1){
			$("#homeRoomIds").removeClass("fieldFill");
		}
		if(courseId == -1){
			$("#courseIds").addClass("fieldFill");
		}
		else if(courseId != -1){
			$("#courseIds").removeClass("fieldFill");
		}
		if(moduleId == -1){
			$("#moduleIds").addClass("fieldFill");
		}
		else if(moduleId != -1){
			$("#moduleIds").removeClass("fieldFill");
		}
		if(submitDateId == -1){
			$("#submitDateId").addClass("fieldFill");
		}
		else if(submitDateId != -1){
			$("#submitDateId").removeClass("fieldFill");
		}
		
		if(schoolId != -1 && classId != -1 && homeRoomId != -1 && courseId != -1 && moduleId != -1 && submitDateId != -1){
		
		var url			=	"showDateDetail.action";
		$.ajax({
			type		:	"POST",
			data		:	{"schoolId":schoolId , "classId":classId,"homeRoomId":homeRoomId,"courseId":courseId,"moduleId":moduleId,"id":submitDateId},
			url			:	url,
			semdBefore	:	function(){},
			success		:	function(result){
				$("#showDataDisplayId").html(result);
			},
			comlete		:	function(){}
		});
	return false;
	}
	}
</script>


<div class="row outLine" >
	<div class="col-md-12 ">
		<div class="list-group-item active">Assignment Console</div>
	</div>
<div>&nbsp;</div>
	<div class="col-md-4 ">
		<s:select list="schoolNameList" listValue="schoolName"
			listKey="schoolId" headerKey="-1" headerValue="SELECT SCHOOL" cssClass="form-control outLine"
			name="schoolId" id="schoolIds"
			onchange="return loadClassMethodShow();"></s:select>
	</div>
	<div class="col-md-4 ">
		<div id="loadClassDetail">
		<select class="form-control outLine">
			 <option value="-1">SELECT ClASS</option>
		</select>
		</div>
	</div>

	<div class="col-md-4 ">
		<div id="loadHomeRoomDetail">
			<select class="form-control outLine">
				 <option value="-1">SELECT HOOM ROOM</option>
			</select>
		</div>
	</div>
<div>&nbsp;</div>
	<div class="col-md-4 ">
		<div id="loadCourseDetail">
		<select class="form-control outLine">
			 <option value="-1">SELECT COURSE</option>
		</select>
		</div>
	</div>

	<div class="col-md-4 ">
		<div id="loadModuleDetail">
		<select class="form-control outLine">
			 <option value="-1">SELECT MODULE</option>
		</select>
		</div>
	</div>

	<div class="col-md-4 ">
		<div id="submitDateDetail">
		<select class="form-control outLine">
			 <option value="-1">SELECT SUBMISSION DATE</option>
		</select>
		</div>
	</div>
<div>&nbsp;</div>
	<div class="col-md-4 ">
		<input type="button" value="Filter" class="loginbutton" onclick="filterAllValue();">
	</div>

	<h4 class="page-section-heading"></h4>

	<div id="showDataDisplayId" class="col-md-12 col-sm-12 ">
		<s:include value="AssignmentReportDisplayTable.jsp" />
	</div>
</div>

