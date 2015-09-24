<%@ taglib prefix="s" uri="/struts-tags"%>

<link href="view/helper/css/responsive-style.css" rel="stylesheet">  <!-- added on 4 aug 2015-->
<script src="view/helper/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">


function setCookie(name,value,days) {
    if (days) {
        var date = new Date();
        date.setTime(date.getTime()+(days*24*60*60*1000));
        var expires = "; expires="+date.toGMTString();
    }
    else var expires = "Thu, 01 Jan 1970 00:00:00 UTC";
    document.cookie = name+"="+value+expires+"; domain=http://191.239.57.54:8080/SLMSWebApp; path=/";
}

function eraseCookie(name){
    setCookie(name,"",-1);
}


function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1,c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
    }
    return null;
}


function clickableResource(id,type,key){
		if(type=='course'){
			window.location="getCourseFromFeed?feedId="+id;
		}else if(type=='module'){
			window.location="getModuleFromFeed?feedId="+id;
		}else if(type=='user'){
			personalProfile(key);
		}else if(type=='assignment'){
			window.location="assignments";
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
 	//FB.logout(function () { document.location.reload(); });
	eraseCookie("userName");
	eraseCookie("userPassword");
	window.location="logout";
	return false;
}




function showErrorMessage(message){
	$("#errorMessageDivId").html("<p>"+message+"</p>");
	document.getElementById('errorMessageDivId').style.display == 'block';
	$("#errorMessageDivId").show();
	$("#successMessageId").hide();
	$("#errorMessageDivId").append("<input type='button' class='loginbutton' style='width: 50px;' onclick='toggle_visibility()' value='ok'/>");
	//setTimeout(function() {$("#errorMessageDivId").hide();},2250);
}

function showSuccessMessage(message){
	$("#successMessageId").html("<p>"+message+"</p>");
	document.getElementById('successMessageId').style.display == 'block';
	$("#successMessageId").show();
	$("#successMessageId").append("<input type='button' class='loginbutton' style='width: 50px;' onclick='toggle_visibility()' value='OK'/>");
	$("#errorMessageDivId").hide();
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
	$("#loader").append("<div id='top'><img  style='margin:252px 0 0 259px;' width='160px' height='120px' src='view/helper/images/animatedLoading.gif'/></div>");
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


function getNotificationDetail(feedId){
	window.location="getNotificationDetail?feedId="+feedId;
}


function viewNotification(){
		$.ajax({
				url : "viewNotification",
				type :"post",
				dataType:"json",
				beforeSend :function(){
				},
				success : function(data){
					//var response = data.feedList;
					var contentElement = $("#notificatioDivId");
					var notificationContent=" <ul class='dropdown-menu' role='notification'> <li class='dropdown-header'>Notifications</li>";
						for(var i=0;i<data.length;i++){
							notificationContent = notificationContent +"<li class='media' style=' cursor: pointer; cursor: hand;'  onclick='getNotificationDetail("+data[i].feedId+");'>"+
                                    "<div class='media-left'>"+
                                        "<img src='"+data[i].profileImage+"' alt='people' class='img-circle' width='30'>"+
                                    "</div>"+
                                    "<div class='media-body'>"+data[i].feedText
                                        +"<br>"+
                                        "<span class='text-caption text-muted'>"+data[i].feedOn+"</span>"+
                                    "</div>"+
                                "</li>";	
                            }  
                            	notificationContent = notificationContent +"<li class='dropdown-header'>"+
                            	"<div class='pull-right'>"+
                                        "<a href='getNotifications' class='btn-pad normalbutton btn-height margin_bot1'>View All</a>"+
                                    "</div>"+
                            	"</li></ul>";
                            contentElement.html(notificationContent);	
                            $("#notificatioDivId .dropdown-menu").show();
                             $("#notificatioDivId").show();
				}
	        });
	        var tabId ='${selectedTab}';
			$("#"+tabId).parent().removeClass("active");
}


$(document).mouseup(function (e)
{
    var container = $("#notificatioDivId");

    if (!container.is(e.target) // if the target of the click isn't the container...
        && container.has(e.target).length === 0) // ... nor a descendant of the container
    {
        container.hide();
    }
});
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
	background-color: #f7f7f7;
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
   	top:10%;
    width: 260px;
    z-index: 99999;
    margin:0px auto;
    text-align:center;
    }
    
    
    .loadingCenter {
  		margin: 229px 0 0 674px;
   		position: fixed;
    	z-index: 999;
		}
</style>

<div id="successMessageId" class="vinDivClass signpop" style=" display:none; background-color: rgba(0, 102,0, .3); border: 3px solid rgb(0, 102, 0); padding: 20px; position: fixed;"></div>
   <div id="errorMessageDivId" class="vinDivClass signpop" style="display:none; background-color: rgba(255,0,0, .3); padding: 20px; position: fixed;"></div>
<s:if test="#session.loginDetail ==null">
<body class="home_bg">

<div class="navbar navbar-default navbar-fixed-top navbar-size-large navbar-size-xlarge paper-shadow" data-z="0" data-animated role="navigation">
        <div class="container">
            <div class="navbar-header">
                
                <div class="navbar-brand navbar-brand-logo">
                    <a class="svg" href="welcome">
                        <img src="view/helper/images/logo5.png" />
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
  <div id="loadingImgId" class="loadingCenter" style="display: none;">
  		<img src="view/helper/images/animatedLoading.gif" alt="loading please wait">
  </div>
  
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
				<div class="col-sm-12 navtop-barn s_bar">
                                        <div class="input-group search-bar-width">
                                            <input type="text" class="form-control search_bar form-bar-control height23 ">
                                            <span class="input-group-btn"> 
                                                <button class="btn btn-inverse search_button search_btn hw_23_47  pad_0 zindex_3" type="button"><i class="fa fa-fw fa-search "></i></button>
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
                            <a id="notificationTabId" href="javaScript:;" class="dropdown-toggle" data-toggle="dropdown" onclick="return viewNotification();">
                                <i class="fa fa-bell-o"></i>
                                <span class="badge badge-primary">4</span>
                            </a>
                           <div id="notificatioDivId"></div>
                        </li>
                        
                         <li class="dropdown user">
		                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
		                                <img src="${loginDetail.profilePhotoFileName}" alt="" class="img-circle width-30" /> ${loginDetail.firstName}<span class="caret"></span>
		                            </a>
		                            <ul class="dropdown-menu dropdown-menu-box" role="menu">
		                                <li><a href="userProfile"><i class="fa fa-user"></i> Profile</a></li>
                                <li><a href="javaScript:;" onclick="logout();"><i class="fa fa-sign-out"></i> Logout</a></li>
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