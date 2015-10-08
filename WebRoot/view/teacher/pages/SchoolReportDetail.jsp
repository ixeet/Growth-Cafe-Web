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
			var HTMLAppand = "<select name='homeRoomId' id='homeRoomIds' class='form-control panel-default bgsize'><option value='0'>GROUP (ALL)</option>";
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
	 
	function filterData(){
	var classId		=	$("#classIds").val();
		var schoolId = $("#schoolIds").val();
		var homeRoomId = $("#homeRoomIds").val();
		var url = "filterSchoolDetails.action";
	$.ajax({
	type		:	"POST",
	url			:	url,
	data		:	{"classId ":classId, "schoolId": schoolId, "homeRoomId":homeRoomId},
		beforeSend		:	function(){
			startwindowDisable();
	},
	success		:	function(result){
	$("#showDetailContainerId").html(result);
	},
	complete		:	function(){
		endwindowDisable();
	}
	});
	return false;
}
</script>

 
    <div class="container">

	<div class="row panel-default">
 
			<div class="col-md-2 ">
		<s:select list="schoolNameList" listValue="schoolName"
			listKey="schoolId" headerKey="0" headerValue="ORGANIZATION (ALL)" cssClass="bgsize form-control panel-default bgsize"
			name="schoolId" id="schoolIds"
			onchange="return loadClassMethodShow();"></s:select>
	</div>
	<div class="col-md-2 ">
		<div id="loadClassDetail">
		<select class="form-control panel-default bgsize" name="classId">
			 <option value="0">DEPARTMENT (ALL)</option>
		</select>
		</div>
	</div>

	<div class="col-md-2 ">
		<div id="loadHomeRoomDetail">
			<select class="form-control panel-default bgsize" name="homeRoomId">
				 <option value="0">GROUP (ALL)</option>
			</select>
		</div>
	</div>
		
		<div class="col-md-6 paper-shadow">
		 <div class="media v-middle">
		 <a class="pad4 normalbutton btn-height btn_mar_left" href="javaScript:;" onclick="return filterData();">Filter</a>
		</div>
		</div>
		
		
	<div id="showDetailContainerId" class="col-md-12 col-sm-12 marg10">
		<s:include value="schoolReportDiaplayTable.jsp"></s:include>
	</div>
</div>
</div>
