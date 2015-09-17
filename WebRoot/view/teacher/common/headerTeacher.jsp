<%@ taglib prefix="s" uri="/struts-tags"%>



<script type="text/javascript">
function clickableResource(id,type,key){
		if(type=='course'){
			window.location="courseDetail";
		}else if(type=='module'){
			//window.location="getModuleFromFeed?feedId="+id;
		}else if(type=='user'){
			personalProfile(key);
		}
		else if(type=='assignment'){
			window.location="assignmentDetail";
		}
	
	}
	
	
	function personalProfile(userId){
	window.location="personalProfile?userId="+userId;
}

 /*  
function startwindowDisable(){
$(".breakpoint-1024").addClass("modal fade in");
$(".breakpoint-1024").prop('disabled','disabled');
$("#loadingImgId").show();
return false;
}

function endwindowDisable(){
//$(".breakpoint-1024").removeClass("startBlock");
//$(".breakpoint-1024").attr('disabled',false);
//$("#loadingImgId").hide();
return false;
} */
</script>
<style>

.startBlock{
	background-color: gray; opacity: 0.4;
}
</style>


<%-- <style>

.startBlock{
	background-color: gray; opacity: 0.4;
}
</style> --%>

<link href="view/helper/css/responsive-style.css" rel="stylesheet">  <!-- added on 4 aug 2015-->
<script src="view/helper/js/jquery-1.11.3.min.js"></script>
  

   	<link href="view/helper/css/vendor.min.css" rel="stylesheet">
    <link href="view/helper/css/theme-core.min.css" rel="stylesheet">
	<link href="view/helper/css/theme-style.css" rel="stylesheet">
    <link href="view/helper/css/module-essentials.min.css" rel="stylesheet" />
    <link href="view/helper/css/module-material.min.css" rel="stylesheet" />
    <link href="view/helper/css/module-layout.min.css" rel="stylesheet" />
    <link href="view/helper/css/module-sidebar.min.css" rel="stylesheet" />
    <link href="view/helper/css/module-sidebar-skins.min.css" rel="stylesheet" />
    <link href="view/helper/css/module-navbar.min.css" rel="stylesheet" />
    <link href="view/helper/css/module-messages.min.css" rel="stylesheet" />
    <link href="view/helper/css/module-carousel-slick.min.css" rel="stylesheet" />
    <link href="view/helper/css/module-charts.min.css" rel="stylesheet" />
    <link href="view/helper/css/module-maps.min.css" rel="stylesheet" />
    <link href="view/helper/css/module-colors-alerts.min.css" rel="stylesheet" />
    <link href="view/helper/css/module-colors-background.min.css" rel="stylesheet" />
    <link href="view/helper/css/module-colors-buttons.min.css" rel="stylesheet" />
    <link href="view/helper/css/module-colors-text.min.css" rel="stylesheet" />
  <body class="home_bg">
  <div id="teacherheaderId" class="navbar navbar-min-height navbar-default navbar-fixed-top navbar-size-large navbar-size-xlarge paper-shadow" data-z="0" data-animated role="navigation">
        <div id="loadingImgId" class="loadingCenter" style="position: fixed; margin-left: 50%; margin-top: 21%; display:none;">
  		<img src="view/helper/images/animatedLoading.gif" alt="loading please wait">
  </div>
       
        <div class="container header-box">
            <div class="navbar-header navbar-header-box">
                <button type="button" class="navbar-toggle collapsed course_toggle" data-toggle="collapse" data-target="#main-nav">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <div class="navbar-brand navbar-brand-logo  navbar-logo-height">
                    <a class="svg svg_logo" href="dashboard">
                        <img src="view/helper/images/logo5.png" id="image_logo1" />
                    </a>
                </div>
				<%-- <div class="col-sm-9 navtop-barn s_bar">
                                        <div class="input-group search-bar-width">
                                            <input type="text" class="form-control search_bar form-bar-control">
                                            <span class="input-group-btn"> 
                                                <button class="btn btn-inverse search_button search_btn" type="button"><i class="fa fa-fw fa-search"></i></button>
                                            </span>
                                        </div>
                 </div> --%>
                        
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="main-nav">
            
            <ul class="nav navbar-nav navbar-nav-margin-left toggle-nav-margin">
					
                    <li class="dropdown  dropdown_hover">
                        <a href="javaScript:;" id="dashboardTabId" onclick="return showDashboard();" class="dropdown-toggle dropdown_hover" data-toggle="dropdown">Dashboard</a>
                        
                    </li>
                  
                    <li class="dropdown  dropdown_hover">
                        <a href="javaScript:;" id="schoolTabId" onclick="return showSchool();" class="dropdown-toggle dropdown_hover" data-toggle="dropdown">Organizations</a>
                        
                    </li>
                    <li class="dropdown dropdown_hover">
                        <a href="javaScript:;" id="coursesTabId" onclick="return showCourse();" class="dropdown-toggle dropdown_hover" data-toggle="dropdown">Courses</a>
                        
                    </li>
                    <li class="dropdown dropdown_hover">
                        <a href="javaScript:;" id="assignmentTabId" onclick="return assignments();" class="dropdown-toggle dropdown_hover" data-toggle="dropdown">Assignments</a>
                    </li>
                     <!-- <li class="dropdown dropdown_hover">
                        <a href="javaScript:;" id="leaderboardTabId" onclick="return showLeaderboard();" class="dropdown-toggle dropdown_hover" data-toggle="dropdown">Leaderboard</a>
                    </li> -->
                    
                </ul>
                
                <div class="navbar-right navbar-right-margin">
                     <ul class="nav navbar-nav navbar-nav-bordered navbar-nav-margin-right ul-navbar-right-margin">
                        <li class="dropdown user">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <img src="${teacherloginDetail.address}" alt="" class="img-circle width-30" /> ${teacherloginDetail.firstName}<span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-box" role="menu">
                                <li><a href="javaScript:;" onclick="return showDashboard();"><i class="fa fa-bar-chart-o"></i> Dashboard</a></li>
                                <li><a href="javaScript:;" onclick="return profile('${teacherloginDetail.userId}');"><i class="fa fa-user"></i> Profile</a></li>
                                <li><a href="javaScript:;" onclick="return logoutTeacher();"><i class="fa fa-sign-out"></i> Logout</a></li>
                            </ul>
                        </li>
                        <!-- // END user -->
                    </ul>
                    
                </div>
            </div>
            <!-- /.navbar-collapse -->
        </div>
    </div>
  </body>
  
  
  <script type="text/javascript">
  $(document).ready(function(){
var tabId ='${selectedTab}';
$("#"+tabId).parent().addClass("active");
});


function profile(userId){
window.location="personalProfile?userId="+userId;
}


function showDashboard(){
	window.location="dashboard";
}

function assignments(){
	window.location="assignmentDetail";
}



function showSchool(){
	window.location="schoolDetail";
}

function showCourse(){
	window.location="courseDetail";
}

function showLeaderboard(){
	window.location="leaderBoard";
}

function setCookie(name,value,days) {
    if (days) {
        var date = new Date();
        date.setTime(date.getTime()+(days*24*60*60*1000));
        var expires = "; expires="+date.toGMTString();
    }
    else var expires = "Thu, 01 Jan 1970 00:00:00 UTC";
    document.cookie = name+"="+value+expires+";";
}

function eraseCookie(name) {
    setCookie(name,"",-1);
}


function logoutTeacher(){
	eraseCookie("userName");
	eraseCookie("userPassword");

		$.ajax({
					url : "log_out",
					beforeSend :function(){
						//showErrorMessage("looading");
					},
					success : function(data){
					if(data=="success"){
						window.location="/SLMSWebApp/welcome";
					}
					},
		        });
 	/* FB.logout(function () { document.location.reload(); }); */
	/* window.location="log_out"; */
	return false;
}
</script>
  
  
  
  
  
  
  
  