<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
 

function showCurrentDetail(tcsMainId,status,courseId,moduleId,resourceId){
var url = "changeWorkStatus";
	$.ajax({
	type		:	"POST",
	url			:	url,
	data		:	{"tcsMainId":tcsMainId, "CompletedStatus":status,"courseId":courseId,"moduleId":moduleId,"resourceId":resourceId},
	beforeSend	: 	function() {
		startwindowDisable();
	
	},
	success		:	function(result){
	$("#StatusChangeByTeacherId").html(result);
	},
	complete	:	function(){
	endwindowDisable();
	}
	});

return false;
}
</script>

<div>
<div id="StatusChangeByTeacherId">
<s:include value="StatusChangeByTeacher.jsp"/>
</div>
</div>

				


