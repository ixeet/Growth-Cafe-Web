<%@ taglib prefix="s" uri="/struts-tags"%>

<script type="text/javascript">

function loadModule(){
	var courseId = $("#courseIds").val();
	var url = "courseDetailList.action";
	$.ajax({
	type		:	"POST",
	url			:	url,
	data		:	{"courseId " :courseId},
	dataType	:	'json',
	beforeSend	: 	function() {
	},
	success		:	function(result){
	var container=$("#moduleShowId");
	
		var HTMLAppend = "<select name='moduleId' id='moduleNameId' class='form-control outLine' onchange='return showHomeRoom();'><option value='-1'>SELECT MODULE</option>";
						for(var i=0; i<result.length; i++){
							HTMLAppend=HTMLAppend+"<option value='"+result[i].id+"' >"+result[i].ModName+"</option>";
						}
						+"</select>";
						$("#moduleNameId").val(-1); 
						container.html(HTMLAppend);
	},
	complete	:	function(){
	}
	});
	
return false;
}

function showHomeRoom(){
$("#homeRoomNameId").show();
$("#homeRoomId").val(0);
return false;
}


function filterData(){
	var courseId = $("#courseIds").val();
	var moduleId = $("#moduleNameId").val();
	var detailView = $("#homeRoomId").val();
	
	
	if(courseId ==-1){
		$("#courseIds").addClass("fieldFill");
	}
	else if(courseId !=-1){
		$("#courseIds").removeClass("fieldFill");
	}
	
	if(moduleId ==-1){
		$("#moduleNameId").addClass("fieldFill");
	}
	else if(moduleId !=-1){
		$("#moduleNameId").removeClass("fieldFill");
	}
	
	if(courseId !=-1 && moduleId !=-1){
	var url = "courseFilterList.action";
	$.ajax({
	type		:	"POST",
	url			:	url,
	data		:	{"courseId " :courseId, "moduleId": moduleId, "detailView":detailView},
	beforeSend	: 	function() {
	},
	success		:	function(result){
	$("#courseDetailDiv").html(result);
	},
	complete	:	function(){
	}
	});
	return false;
	}
}
function viewDetail(id,status){
var url = "viewListDetail.action";
	$.ajax({
	type		:	"POST",
	url			:	url,
	data		:	{"view":id, "id":status},
	beforeSend	: 	function() {
	},
	success		:	function(result){
	$("#showPopDiv").html(result);
	$('#myModal').modal('show');
	},
	complete	:	function(){
	}
	});

	

return false;
}
 
 </script>
<div class="row outLine">
	<div class="col-md-12 ">
		<div class="list-group-item active">Course Console</div>
	</div>
		<div>&nbsp;</div>
		<div class="col-md-4 ">
			<s:select listValue="courseName" headerKey="-1"
				cssClass="form-control outLine" headerValue="Select Course"
				listKey="courseId" list="saleCourseList" id="courseIds"
				name="courseId" onchange="return loadModule();" />
		</div>
		
		<div class="col-md-4 ">
			<div id="moduleShowId">
				<select class="form-control outLine">
					<option value="-1">SELECT MODULE</option>
				</select>

			</div>
		</div>
		<div class="col-md-4 ">
			<select id="homeRoomId" name="detailView" class="form-control outLine">
				<!-- <option value="-1">ALL</option> -->
				<option value="0">In Progress</option>
				<option value="1">Completed</option>

			</select>

		</div>
		<div>&nbsp;</div>
		<div class="col-md-4 ">
			<input type="button" onclick="return filterData();"
				class="loginbutton" value="Filter">
		</div>


	<div class="col-md-12 col-sm-12 " id="courseDetailDiv">
		<s:include value="CoursesDisplayTable.jsp" />
	</div>
</div>


<div id="showPopDiv" class="col-md-12">
	<s:include value="PopupShow.jsp"></s:include>
</div>


