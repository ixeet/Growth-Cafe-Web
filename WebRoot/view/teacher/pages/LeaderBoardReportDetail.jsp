<%@ taglib prefix="s" uri="/struts-tags"%>

 <script type="text/javascript">

	function loadClassMethodShow(){
		var schoolId=$("#schoolIdDiv").val();
		var url="leaderClassMethod.action";
		$.ajax({
			type		:	"POST",
			url			:	url,
			data		:	{"schoolId":schoolId},
			dataType	:	"json",
		
			sendBefore		:	function(){},
			success			:	function(result){
			var container = $("#loadClassDetail");
			var HTMLAppand = "<select name='classId' id='classIdDiv' class='form-control outLine' onchange='loadRoomTypess();'><option value='-1'>DEPARTMENT (ALL)</option>";
				for(var i=0; i<result.length; i++){
					HTMLAppand=HTMLAppand+"<option value='"+result[i].id+"'>"+result[i].scName+"</option >";
				}
				container.html(HTMLAppand);
				$("#classIdDiv").val(-1);
		},
		complete		:	function(){
		}
		});
	return false;
	}

	function loadRoomTypess(){
		var schoolId	=	$("#schoolIdDiv").val();
		var classId		=	$("#classIdDiv").val();
		var url		=	"leaderhomeRoom.action";
		$.ajax({
			type		:	"POST",
			data		:	{"schoolId":schoolId , "classId":classId},
			url			:	url,
			dataType	:	"json",
			semdBefore	:	function(){},
			success		:	function(result){
			var container = $("#loadHomeRoomDetail");
			var HTMLAppand = "<select name='homeRoomId' id='homeRoomIds' class='form-control outLine' onchange='showbtnId();' onchange='courseDetail();'><option value='-1'>GROUP (ALL)</option>";
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
	 
	
	function filterAllValue(){
		var schoolId	=	$("#schoolIdDiv").val();
		var classId		=	$("#classIdDiv").val();
		var homeRoomId		=	$("#homeRoomIds").val();
		
		if(schoolId == -1){
			$("#schoolIdDiv").addClass("fieldFill");
		}
		else if(schoolId != -1){
			$("#schoolIdDiv").removeClass("fieldFill");
		}
		if(classId == -1){
			$("#classIdDiv").addClass("fieldFill");
		}
		else if(classId != -1){
			$("#classIdDiv").removeClass("fieldFill");
		}
		if(homeRoomId == -1){
			$("#homeRoomIds").addClass("fieldFill");
		}
		else if(homeRoomId != -1){
			$("#homeRoomIds").removeClass("fieldFill");
		}
		if(schoolId != -1 && classId != -1 && homeRoomId != -1){
		
		var url		=	"leaderShowDetails.action";
		$.ajax({
			type		:	"POST",
			data		:	{"schoolId":schoolId , "classId":classId, "homeRoomId":homeRoomId},
			url			:	url,
			semdBefore	:	function(){},
			success		:	function(result){
			
			},
			comlete		:	function(){}
			});
	return false;
	}
	}
	</script>

<div class="row outLine">
	<div class="col-md-12 ">
		<div class="list-group-item active">Leaderboard Console</div>
	</div>
<div>&nbsp;</div>
	<div class="col-md-4 ">
		<s:select list="schoolNameList" listValue="schoolName" cssClass="form-control outLine"
			listKey="schoolId" headerKey="-1" headerValue="ORGANIZATION (ALL)"
			name="schoolId" id="schoolIdDiv"
			onchange="return loadClassMethodShow();"></s:select>
	</div>
	<div class="col-md-4 " >
	<div id="loadClassDetail">
		<select class="form-control outLine">
			 <option value="-1">DEPARTMENT (ALL)</option>
		</select>
	</div>
	</div>
	
	<div class="col-md-4 " >
	<div id="loadHomeRoomDetail">
		<select class="form-control outLine">
			 <option value="-1">GROUP (ALL)</option>
		</select>
	</div>
	</div>
	<div>&nbsp;</div>
	<div class="col-md-4 ">
	<input type="button" class="loginbutton" value="Filter" onclick="return filterAllValue();">
	</div>

	<div id="LeaderBoardReportDiv" class="col-md-12 col-sm-12 ">
		<s:include value="LeaderBoardReportDisplayTable.jsp" />

	</div>
</div>

