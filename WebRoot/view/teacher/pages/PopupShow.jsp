<%@ taglib prefix="s" uri="/struts-tags"%>
     
<script type="text/javascript">

function showDp(){
 $( "#datepicker-3" ).datepicker({
               dateFormat:"'dd-mm-yy'",
            });

}

function showCurrentDetail(tcsMainId,status,courseId,moduleId,resourceId){
var url = "changeWorkStatus";
	$.ajax({
	type		:	"POST",
	url			:	url,
	data		:	{"tcsMainId":tcsMainId, "completedStatus":status,"courseId":courseId,"moduleId":moduleId,"resourceId":resourceId},
	beforeSend	: 	function() {
		startwindowDisable();
	},
	success		:	function(result){
	$("#StatusChangeByTeacherId").html(result);
	},
	complete	:	function(){
	 $( "#datepicker-3" ).datepicker({
               dateFormat:"'dd-mm-yy'",
            });
	endwindowDisable();
	}
	});

return false;
}

function submitDate(schoolId,classId,homeRoomId,courseId,moduleId,statusId){
	var dateId=$("#datepicker-3").val();
	if(dateId==""){
		$(".dateTemp").addClass("errclass").attr("placeholder", "Please Select Date");
		;
	}
	else if(dateId!=""){
	 $(".dateTemp").removeClass("errclass");
	 	$.ajax({
	 		type	:	"POST",
	 		url		:	"assignmentStatusDate.action",
	 		data	:	{"schoolId":schoolId,"classId":classId,"homeRoomId":homeRoomId,"courseId":courseId,"moduleId":moduleId,"statusId":statusId,"asignmentEnableStatus":dateId},
	 		beforeSend	: 	function() {
			},
			success		:	function(result){
			$("#StatusChangeByTeacherId").html(result);
			
			},
			complete	:	function(){
			 $( "#datepicker-3" ).datepicker({
               dateFormat:"'dd-mm-yy'",
            });
			endwindowDisable();
			}
	 	});
	}
	endwindowDisable();
}
         
</script>
<style>
.errclass{
	border: 2px solid red;
    color: red;
}
</style>

<div>
<div id="StatusChangeByTeacherId">
<s:include value="StatusChangeByTeacher.jsp"/>
</div>
</div>

				


