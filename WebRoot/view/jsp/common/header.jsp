<%@ taglib prefix="s" uri="/struts-tags"%>

<link href="view/helper/css/responsive-style.css" rel="stylesheet">  <!-- added on 4 aug 2015-->
<link rel="shortcut icon" href="view/helper/images/favicon.ico" type="image/x-icon">
<script src="view/helper/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">

function clickableResource(id,type){
		if(type=='course'){
			window.location="getCourseFromFeed?feedId="+id;
		}if(type=='module'){
			window.location="getModuleFromFeed?feedId="+id;
		}
	
	}
	
function personalProfile(userId){
	window.location="personalProfile?userId="+userId;
}

$(document).ready(function(){
var tabId ='${selectedTab}';
$("#"+tabId).parent().addClass("active");
});

function logout(){
 	FB.logout(function () { document.location.reload(); });
	window.location="logout";
	return false;
}




function showErrorMessage(message){
	$("#errorMessageDivId").html("<p>"+message+"</p>");
	document.getElementById('errorMessageDivId').style.display == 'block';
	$("#errorMessageDivId").show();
	$("#errorMessageDivId").append("<input type='button' class='loginbutton' style='width: 50px;' onclick='toggle_visibility()' value='ok'/>");
	//setTimeout(function() {$("#errorMessageDivId").hide();},2250);
}

function showSuccessMessage(message){
	$("#successMessageId").html("<p>"+message+"</p>");
	document.getElementById('successMessageId').style.display == 'block';
	$("#successMessageId").show();
	$("#successMessageId").append("<input type='button' class='loginbutton' style='width: 50px;' onclick='toggle_visibility()' value='OK'/>");
}

function loadingImg(){
	$("#loadingImgId").show();
}
function loadingComp(){
	$("#loadingImgId").hide();
}

function toggle_visibility(id) {
		$("#errorMessageDivId").hide();
		$("#successMessageId").hide();
      
    }


function courses(){
	window.location="courses";
	/* $.ajax({
			url : "courses",
			type :"post",
			data :{},
			beforeSend :function(){
				showErrorMessage("looading");
			},
			success : function(data){
			$("#BodyId").html(data);
			},
        }); */
        
}

function updates(){
	window.location="updates";
	
}

function assignments(){
	window.location="assignments";
	
}

function showDashboard(){
	window.location="showDashboard";
}

function overlay() {
	el = document.getElementById("overlay");
	el.style.visibility = (el.style.visibility == "visible") ? "hidden" : "visible";
}

</script>

 <style>
	.home_bg{
	background-image: url(view/helper/images/bg_3.png);
    height: 100%;
    width: 100%;
	    background-size: 100% 100%;
    background-repeat: no-repeat;
   background-attachment:fixed;
   /* -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;*/
}

.home_bg1{
	background-color: white;
    height: 100%;
    width: 100%;
	    background-size: 100% 100%;
    background-repeat: no-repeat;
   background-attachment:fixed;
   /* -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;*/
}
.vinDivClass {
    border: 4px solid #7e0000;
    padding: 15px;
    position: absolute;
    right:0;
    left:0;
   	top:5%;
    width: 260px;
    z-index: 99999;
    margin:0px auto;
    text-align:center;
    }
</style>

<div id="successMessageId" class="vinDivClass signpop" style=" display: none; background-color:#CBCBBE;  border: 3px solid rgba(186, 0, 50, 0.7); padding:20px;position: fixed;"></div>
   <div id="errorMessageDivId" class="vinDivClass signpop" style=" display: none; background-color:gray; padding:20px;position: fixed;">
	</div>
<s:if test="#session.loginDetail ==null">
<body class="home_bg">

<div class="navbar navbar-default navbar-fixed-top navbar-size-large navbar-size-xlarge paper-shadow" data-z="0" data-animated role="navigation">
        <div class="container">
            <div class="navbar-header">
                
                <div class="navbar-brand navbar-brand-logo">
                    <a class="svg" href="welcome">
                        <img src="view/helper/images/logo3.png" />
                    </a>
                </div>
			
                        
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            
            <!-- /.navbar-collapse -->
        </div>
</div>
</body>
</s:if>

<s:elseif test="#session.loginDetail !=null">

  
  <!-- style -->
  <link href="view/helper/css/vendor.min.css" rel="stylesheet">
  <link href="view/helper/css/theme-core.min.css" rel="stylesheet">
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
  
  
  <body class="home_bg1">
  
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
                        <img src="view/helper/images/logo3.png" id="image_logo1" />
                    </a>
                </div>
				<div class="col-sm-9 navtop-barn s_bar">
                                        <div class="input-group search-bar-width">
                                            <input type="text" class="form-control search_bar form-bar-control">
                                            <span class="input-group-btn"> 
                                                <button class="btn btn-inverse search_button search_btn" type="button"><i class="fa fa-fw fa-search"></i></button>
                                            </span>
                                        </div>
                 </div>
                        
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="main-nav">
                <ul class="nav navbar-nav navbar-nav-margin-left toggle-nav-margin">
					
                    <li class="dropdown dropdown_hover">
                        <a href="javaScript:;" id="updatesTabId" onclick="return updates();" class="dropdown-toggle dropdown_hover" data-toggle="dropdown">Updates</a>
                    </li>
                  
                    <li class="dropdown  dropdown_hover">
                        <a href="javaScript:;" id="coursesTabId" onclick="return courses();" class="dropdown-toggle dropdown_hover" data-toggle="dropdown">Courses</a>
                        
                    </li>
                    <li class="dropdown dropdown_hover">
                        <a href="#" id="assignmentsTabId" onclick="return assignments();"  class="dropdown-toggle dropdown_hover" data-toggle="dropdown">Assignments</a>
                        
                    </li>
                 
                    
                </ul>
                <div class="navbar-right navbar-right-margin">
                    <ul class="nav navbar-nav navbar-nav-bordered navbar-nav-margin-right ul-navbar-right-margin">
                        <!-- user --><li class="dropdown notifications updates">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-bell-o"></i>
                                <span class="badge badge-primary">4</span>
                            </a>
                            <ul class="dropdown-menu" role="notification">
                                <li class="dropdown-header">Notifications</li>
                                <li class="media">
                                    <div class="pull-right">
                                        <span class="label label-success">New</span>
                                    </div>
                                    <div class="media-left">
                                        <img src="view/helper/images/people/50/guy-2.jpg" alt="people" class="img-circle" width="30">
                                    </div>
                                    <div class="media-body">
                                        <a href="#">Adrian D.</a> posted <a href="#">a photo</a> on his timeline.
                                        <br>
                                        <span class="text-caption text-muted">5 mins ago</span>
                                    </div>
                                </li>
                                <li class="media">
                                    <div class="pull-right">
                                        <span class="label label-success">New</span>
                                    </div>
                                    <div class="media-left">
                                        <img src="view/helper/images/people/50/guy-6.jpg" alt="people" class="img-circle" width="30">
                                    </div>
                                    <div class="media-body">
                                        <a href="#">Bill</a> posted <a href="#">a comment</a> on Adrian's recent <a href="#">post</a>.
                                        <br>
                                        <span class="text-caption text-muted">3 hrs ago</span>
                                    </div>
                                </li>
                                <li class="media">
                                    <div class="media-left">
                                        <span class="icon-block s30 bg-grey-200"><i class="fa fa-plus"></i></span>
                                    </div>
                                    <div class="media-body">
                                        <a href="#">Mary D.</a> and <a href="#">Michelle</a> are now friends.
                                        <p>
                                            <span class="text-caption text-muted">1 day ago</span>
                                        </p>
                                        <a href="">
                                            <img class="width-30 img-circle" src="view/helper/images/people/50/woman-6.jpg" alt="people">
                                        </a>
                                        <a href="">
                                            <img class="width-30 img-circle" src="view/helper/images/people/50/woman-3.jpg" alt="people">
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown user">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <img src="${loginDetail.profilePhotoFileName}" alt="" class="img-circle" /> ${loginDetail.firstName}<span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-box" role="menu">
                                <li><a href="userProfile"><i class="fa fa-user"></i> Profile</a></li>
                                <li><a href="logout"><i class="fa fa-sign-out"></i> Logout</a></li>
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
  </s:elseif>