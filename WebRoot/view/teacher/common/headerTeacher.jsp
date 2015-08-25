<%@ taglib prefix="s" uri="/struts-tags"%>

<link href="view/helper/css/responsive-style.css" rel="stylesheet">  <!-- added on 4 aug 2015-->
<link rel="icon" href="view/helper/images/favicon.png"/>
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
  
  
  <div class="navbar navbar-min-height navbar-default navbar-fixed-top navbar-size-large navbar-size-xlarge paper-shadow" data-z="0" data-animated role="navigation">
        <div class="container header-box">
            <div class="navbar-header navbar-header-box">
                <button type="button" class="navbar-toggle collapsed course_toggle" data-toggle="collapse" data-target="#main-nav">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <div class="navbar-brand navbar-brand-logo  navbar-logo-height">
                    <a class="svg svg_logo" href="updates">
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
                        <a href="javaScript:;" id="schoolTabId" onclick="return showSchool();" class="dropdown-toggle dropdown_hover" data-toggle="dropdown">School</a>
                        
                    </li>
                    <li class="dropdown dropdown_hover">
                        <a href="javaScript:;" id="coursesTabId" onclick="return showCourse();" class="dropdown-toggle dropdown_hover" data-toggle="dropdown">Course</a>
                        
                    </li>
                    <li class="dropdown dropdown_hover">
                        <a href="javaScript:;" id="assignmentTabId" onclick="return assignments();" class="dropdown-toggle dropdown_hover" data-toggle="dropdown">Assignments</a>
                    </li>
                     <li class="dropdown dropdown_hover">
                        <a href="javaScript:;" id="leaderboardTabId" onclick="return showLeaderboard();" class="dropdown-toggle dropdown_hover" data-toggle="dropdown">Leaderboard</a>
                    </li>
                    
                </ul>
                
                <div class="navbar-right navbar-right-margin">
                    <ul class="nav navbar-nav navbar-nav-margin-right ul-navbar-right-margin">
                        <li class="dropdown user">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <img src="view/helper/images/people/110/guy-6.jpg" alt="" class="img-circle" /> ${teacherloginDetail.firstName}<span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-box" role="menu">
                                <li><a href="javaScript:;" onclick="return showDashboard();"><i class="fa fa-bar-chart-o"></i> Dashboard</a></li>
                                <li><a href="javaScript:;"><i class="fa fa-user"></i> Profile</a></li>
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
  
  
  
  <script type="text/javascript">
  $(document).ready(function(){
var tabId ='${selectedTab}';
$("#"+tabId).parent().addClass("active");
});

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
function logoutTeacher(){
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
  
  
  
  
  
  
  
  