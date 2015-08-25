<%@ taglib prefix="s" uri="/struts-tags"%>

<script type="text/javascript">

function loadClass(){
	var schoolId = $("#schoolIds").val();
	var url = "classDetail.action";
	$.ajax({
	type		:	"POST",
	url			:	url,
	data		:	{"schoolId " :schoolId},
	dataType	:	'json',
	beforeSend	: 	function() {
	},
	success		:	function(result){
	var container=$("#classShowId");
	
		var HTMLAppend = "<select name='classId' id='classNameId' class='form-control outLine' onchange='return showHomeRoom();'><option value='-1'>SELECT CLASS</option>";
						for(var i=0; i<result.length; i++){
							HTMLAppend=HTMLAppend+"<option value='"+result[i].id+"' >"+result[i].className+"</option>";
						}
						+"</select>";
						$("#classNameId").val(-1); 
						container.html(HTMLAppend);
	},
	complete	:	function(){
	}
	});
	
return false;
}


function showHomeRoom(){
	var classId = $("#classNameId").val();
	var schoolId = $("#schoolIds").val();
	var url = "homeRoomDetail.action";
	$.ajax({
	type		:	"POST",
	url			:	url,
	data		:	{"classId " :classId, "schoolId" : schoolId},
	dataType	:	'json',
	beforeSend	: 	function() {
	},
	success		:	function(result){
	var container=$("#homeRoomNameId");
	
		var HTMLAppend = "<select id='homeRoomIds' class='form-control outLine' name='homeRoomId'><option value='-1'>SELECT HOME ROOM</option>";
						for(var i=0; i<result.length; i++){
							HTMLAppend=HTMLAppend+"<option value='"+result[i].id+"' >"+result[i].homeRoomName+"</option>";
						}
						+"</select>";
						$("#homeRoomIds").val(-1); 
						container.html(HTMLAppend);
	},
	complete	:	function(){
	}
	});
	
	return false;
	}
	
	 
	function filterData(){
		var classId = $("#classNameId").val();
		var schoolId = $("#schoolIds").val();
		var homeRoomId = $("#homeRoomIds").val();
		
		if(schoolId == -1){
			$("#schoolIds").addClass("fieldFill");
		}
		
		else if(schoolId != -1){
			$("#schoolIds").removeClass("fieldFill");
		}
		
		if(classId == -1){
			$("#classNameId").addClass("fieldFill");
		}
		
		else if(classId != -1){
			$("#classNameId").removeClass("fieldFill");
		}
		
		if(homeRoomId == -1){
			$("#homeRoomIds").addClass("fieldFill");
		}
		
		else if(homeRoomId != -1){
			$("#homeRoomIds").removeClass("fieldFill");
		}
		
	 if(schoolId != -1 && classId != -1 && homeRoomId != -1){
			
		
		var url = "filterSchoolDetails.action";
	$.ajax({
	type		:	"POST",
	url			:	url,
	data		:	{"classId ":classId, "schoolId": schoolId, "homeRoomId":homeRoomId},
	beforeSend	: 	function() {
	},
	success		:	function(result){
	$("#showDetailContainerId").html(result);
	},
	complete	:	function(){
	}
	});
	return false;
	}
}
</script>

<div class="row outLine">
	<div class="col-md-12  ">
		<div class="list-group-item active">School Console</div>
		<div>&nbsp;</div>
</div>

		<div class="col-md-4  ">
			<s:select listValue="schoolName" headerKey="-1"
				headerValue="Select School" listKey="schoolId" list="schoolNameList"
				id="schoolIds" cssClass="form-control outLine" name="schoolId"
				onchange="return loadClass();" />
		</div>
		<div class="col-md-4  ">
			<div id="classShowId">
				<select class="form-control outLine">
					<option value="-1">SELECT CLASS</option>
				</select>


			</div>
		</div>
		<div class="col-md-4  ">
			<div id="homeRoomNameId">
				<select class="form-control outLine">
					<option value="-1">SELECT HOME ROOM</option>
				</select>
			</div>
		</div>
		<div>&nbsp;</div>
		<div class="col-md-4  ">
			<input type="button" class="loginbutton"
				onclick="return filterData();" value="Filter">
		</div>

	<div id="showDetailContainerId" class="col-md-12 col-sm-12  ">
		<s:include value="schoolReportDiaplayTable.jsp"></s:include>
	</div>
</div>
