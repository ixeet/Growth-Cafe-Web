<%@ taglib prefix="s" uri="/struts-tags"%>

<script type="text/javascript">
function completeMsg(){
$(".panel-heading panel-collapse-trigger pad-0").removeClass("collapsed");
alert("Please Complete All Module of this Course");
return false;
}

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
$.ajax({
	type	:	"",
	url		:	"",
	data	:	"",
beforeSend	:	function(){
},
success		:	function(result){
	//$("#courseDetailDiv").html(result);
	
	},
	complete		:	function(){
	 window.location="viewListDetail?courseId="+courseId+"&moduleId="+moduleId+"&schoolId="+schoolId+"&classId="+classId+"&homeRoomId="+homeRoomId;
	}
});
return false;
 }




function changeStatusDetail(event){
var sessionId=$(event.currentTarget).val();
var testValue = $(event.currentTarget).text();
if(testValue == "Start"){
	var status=0;
	/* window.location="changeCourseDetail?courseSessionId="+sessionId+"&statusCode="+status; */
	 var url = "changeDetailTeach.action";
	$.ajax({
	type		:	"POST",
	url			:	url,
	data		:	{"moduleSessionId":sessionId, "statusCode":status},
	beforeSend		:	function(){
			startwindowDisable();
	},
	success		:	function(result){
	//$("#courseDetailDiv").html(result);
	},
	complete		:	function(){
		window.location="courseDetail";
	}
	});
}

else if(testValue == "Complete"){
	var status=1;
	/* window.location="changeCourseDetail?courseSessionId="+sessionId+"&statusCode="+status; */

  var url = "changeDetailTeach.action";
	$.ajax({
	type		:	"POST",
	url			:	url,
	data		:	{"moduleSessionId":sessionId, "statusCode":status},
	beforeSend		:	function(){
			startwindowDisable();
	},
	success		:	function(result){
	//$("#courseDetailDiv").html(result);
	},
	complete		:	function(){
		window.location="courseDetail";
	}
	});
}
return false; 
}

function changeStatusCourseDetail(event){
 
	var sessionId=$(event.currentTarget).val();
	var testValue = $(event.currentTarget).text();
	if(testValue == "Start"){
	event.stopPropagation();
		var status=0;
	  var url = "changeCourseDetail.action";
		$.ajax({
		type		:	"POST",
		url			:	url,
		data		:	{"courseSessionId":sessionId, "statusCode":status},
		beforeSend		:	function(){
				startwindowDisable();
		},
		success		:	function(result){
		/* $("#courseDetailDiv").html(result); */
		},
		complete		:	function(){
			/* endwindowDisable(); */
			window.location="courseDetail";
		}
		});
		
	/* 	window.location="changeCourseDetail?courseSessionId="+sessionId+"&statusCode="+status; */
	}
	else if(testValue == "Complete"){
	event.stopPropagation();
	
	$("#myModalAlert").modal("show");
	/* alert("Please Complete All Module"); */
		/* var status=0;
		 var url = "changeCourseDetail.action";
		$.ajax({
		type		:	"POST",
		url			:	url,
		data		:	{"courseSessionId":sessionId, "statusCode":status},
		beforeSend		:	function(){
				startwindowDisable();
		},
		success		:	function(result){
		$("#courseDetailDiv").html(result);
		},
		complete		:	function(){
			endwindowDisable();
		}
		}); */
		}
	
return false; 
}
 </script>

 <div class="container">
<div class="row panel-default" >
	<!-- <div class="col-md-12 ">
		<div class="list-group-item active">Course Console</div>
	</div> -->
			<div class="col-md-2 ">
				<s:select list="schoolNameList" listValue="schoolName"
			listKey="schoolId" headerKey="0" headerValue="ORGANIZATION (ALL)" cssClass="bgsize form-control panel-default bgsize"
			name="schoolId" id="schoolIds"></s:select>
	<%-- 	<s:select list="schoolNameList" listValue="schoolName"
			listKey="schoolId" headerKey="0" headerValue="ORGANIZATION (ALL)" cssClass="bgsize form-control panel-default bgsize"
			name="schoolId" id="schoolIds"
			onchange="return loadClassMethodShow();"></s:select> --%>
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


    <style type="text/css">
        .web_dialog_overlay
        {
            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            height: 100%;
            width: 100%;
            margin: 0;
            padding: 0;
            background: #000000;
            opacity: .15;
            filter: alpha(opacity=15);
            -moz-opacity: .15;
            z-index: 101;
            display: none;
        }
        .web_dialog
        {
            display: none;
            position: fixed;
            width: 380px;
            height: 200px;
            top: 50%;
            left: 50%;
            margin-left: -190px;
            margin-top: -100px;
            background-color: #c6c6c6;
            border: 2px solid #BA0032;
            padding: 0px;
            z-index: 102;
            font-family: Verdana;
            font-size: 12pt;
            color:white;
            font-weight: 800;
        }
        .web_dialog_title
        {
            border-bottom: solid 2px #BA0032;
            background-color: #BA0032;
            padding: 4px;
            color: White;
            font-weight:bold;
        }
        .web_dialog_title a
        {
            color: White;
            text-decoration: none;
        }
        .align_right
        {
            text-align: right;
        }
         
    </style>
    <script type="text/javascript">

        $(document).ready(function ()
        {
            $("#btnShowSimple").click(function (e)
            {
            e.stopPropagation();
                ShowDialog(false);
                e.preventDefault();
            });

            $("#btnClose").click(function (e)
            {
                HideDialog();
                e.preventDefault();
            });

            
        });

        function ShowDialog(modal)
        {
            $("#overlay").show();
            $("#dialog").fadeIn(300);

                $("#overlay").click(function (e)
                {
                    HideDialog();
                });
        }

        function HideDialog()
        {
            $("#overlay").hide();
            $("#dialog").fadeOut(300);
        } 
        
    </script>

 
<div id="overlay" class="web_dialog_overlay"></div>
<div id="dialog" class="web_dialog">
        <table style="width: 100%;" >
            <tr>
                <td class="web_dialog_title">Alert Message</td>
                <td class="web_dialog_title align_right">
                    <a href="javascript:;" id="btnClose">Close</a>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" style="padding: 4px 0px 0px 8px;">
                    <span>Hey, <br>There are some modules so you Can't mark the Course as Completed 
        GO TO modules to Complete Them.</span>
                </td>
            </tr>
            
        </table>
    </div>