<%@ taglib prefix="s" uri="/struts-tags"%>

<script>

$(document).ready(function(){ 
     var userName=readCookie("userName");
     var userpassword =readCookie("userPassword");
		if(userName !="" && userName !=null && userpassword!="" && userpassword!=null){
		var data="userName="+userName+"&userPassword="+userpassword;
		$.post("login",data,
			function(data,status){
			var response = JSON.parse(data);
				 if(response.statusMessage=="success" && response.userType==2){
							teacherLogin();
						}
					else if(response.statusMessage=="success" && response.userType==3){
							studentLogin();
						}else{
							showErrorMessage("Email and password doesn't match with database");
							}
						});
	    }
});



function ValidateEmail(email) {
      var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
        return expr.test(email);
    };

function validPassword(password){
 var expr = /^(?=.*[0-9])(?=.*[a-zA-Z])([a-zA-Z0-9]+)|(?=.*[0-9])(?=.*[a-zA-Z])([a-zA-Z0-9-+_!@#$%^&*.,?]+)$/;
 return expr.test(password);
}

	function forgetPassword(){
		var userName = document.getElementById("forgetUserNameId").value;
		if(userName==""){
	$("#forgetUserNameId").addClass("fieldFill").attr("placeholder", "Please enter email");
	}
	else if(!ValidateEmail(userName)){
		$("#emailshowforget").show();
	}
	else if(ValidateEmail(userName)){
		$("#emailshowforget").hide();
			$("#forgetUserNameId").removeClass("fieldFill");
			var dataString = $("#forgetPasswordFormId").serialize();
			$.ajax({
			url : "sendforgetPassword",
			type :"post",
			data :dataString,
			beforeSend :function(){
				//loadingImg();
			},
			success : function(data){
				var response = JSON.parse(data);
            if(response.statusMessage=='success'){
						showSuccessMessage("Your password is sent to "+userName+", please check SPAM folder if not received in inbox");
						setTimeout(function() {homeClick();},2250);
					}else{
						showErrorMessage("Email doesn't match with database, please enter a registered email Id to get password");
					}
			},
			complete : function(){
			//loadingComp();
			}
        });
			
			
			
			
	}
	return false;
	}


function getHomeDetails(classid){
	
	var data ={"classId":classid};
	var classesSelect = "";
	var homeSelect = "";
	var schoolid = $("#schoolId").val();
	if(schoolid==0){
	showErrorMessage("Please select organization first");
	}else{
	$.post("getClassDetails",data,
			function(data,status){
	            var jsonResponse = JSON.parse(data);
	            var schoolsArray = jsonResponse.schoolList;
	            for(var i=0;i<schoolsArray.length;i++){
	            	if(schoolsArray[i].schoolId==schoolid){
	            		var classesArray = schoolsArray[i].classList;
	            		for(var j=0;j<classesArray.length;j++){
	            			if(classesArray[j].classId==classid){
		            		var homeArray = classesArray[0].homeRoomList;
		            		homeSelect=homeSelect+"<select name='homeRoomId' class='input width_100p' id='homeRoomId' onchange='checkOrgAndDepart();'><option value='0'>Select Group</option>";
		            		for(var j=0;j<homeArray.length;j++){
			            		homeSelect=homeSelect+"<option value='"+homeArray[j].homeRoomId+"'>"+homeArray[j].homeRoomName+"</option>";
		            		}
		            		homeSelect=homeSelect+"</select>";
		            		$("#homeDivId").html(homeSelect);
		            		
		            		
		            		}
	            		}
	            	}
	            }
	            homIdss();
	            
	        });
	      }
}

function getClassDetails(schoolid){
	var data ={"schoolId":schoolid};
	var classesSelect = "";
	var homeSelect = "";
	$.post("getClassDetails",data,
			function(data,status){
	            var jsonResponse = JSON.parse(data);
	            var schoolsArray = jsonResponse.schoolList;
	            for(var i=0;i<schoolsArray.length;i++){
	            	if(schoolsArray[i].schoolId==schoolid){
	            		var classesArray = schoolsArray[i].classList;
	            		classesSelect=classesSelect+"<select name='classId' onchange='getHomeDetails(this.value)' id='classId' class='input width_100p'><option value='0'>Select Department</option>";
	            		for(var j=0;j<classesArray.length;j++){
		            		classesSelect=classesSelect+"<option value='"+classesArray[j].classId+"'>"+classesArray[j].className+"</option>";
	            		}
	            		classesSelect=classesSelect+"</select>";
	            		$("#classDivId").html(classesSelect);
	            		
	            		
	            		var homeArray = classesArray[0].homeRoomList;
	            		homeSelect=homeSelect+"<select id='homeRoomId' name='homeRoomId' class='input width_100p' onchange='checkOrgAndDepart();'><option value='0'>Select Group</option>";
	            		for(var j=0;j<homeArray.length;j++){
		            		homeSelect=homeSelect+"<option value='"+homeArray[j].homeRoomId+"'>"+homeArray[j].homeRoomName+"</option>";
	            		}
	            		homeSelect=homeSelect+"</select>";
	            		$("#homeDivId").html(homeSelect);
	            		
	            		
	            	}
	            }
	           callss();
	        });
	        return false;
	         
}


function checkOrgAndDepart(){

	var schoolId = $("#schoolId").val();
	var classId = $("#classId").val();
	if(schoolId==0 || classId==0){
		showErrorMessage("Please select organization and department first");
	}

}

	function login(){
	var status=false;
    status= navigator.onLine;
	if(status== true)
    {
		var userName = document.getElementById("loginUserNameId").value;
		var userPassword = document.getElementById("loginUserPasswordId").value;
		if(userName==""){
		$("#loginUserNameId").addClass("fieldFill").attr("placeholder", "Please enter email");
		}
		else if(!ValidateEmail(userName)){
			$("#emailshow").show();
		}
		else if(ValidateEmail(userName)){
			$("#emailshow").hide();
				$("#loginUserNameId").removeClass("fieldFill");
		}
		
		if(userPassword==""){
			$("#loginUserPasswordId").addClass("fieldFill").attr("placeholder", "Please enter user password");
		}
		
		else if(!validPassword(userPassword)){
			$("#lengthDiv").show();
		}
		
	
		
		else if(userPassword.length<8){
			$("#lengthDiv").show();
		}
		else if(userPassword.length>=8){
			$("#lengthDiv").hide();
		$("#loginUserPasswordId").removeClass("fieldFill");
		}
	
		if(ValidateEmail(userName) && userPassword.length>=8 && validPassword(userPassword)){
			var data = $("#loginFormId").serialize();
			if($('#remeberMeId').is(':checked')){
				setCookie("userName",userName,30);
				setCookie("userPassword",userPassword,30);
			}
			$.post("login",data,
			function(data,status){
				var response = JSON.parse(data);
				 if(response.statusMessage=="success" && response.userType==2){
							teacherLogin();
						}
					else if(response.statusMessage=="success" && response.userType==3){
							studentLogin();
						}else{
							showErrorMessage("Email and password doesn't match with database");
						}
	        });
		}
	}else{
		showErrorMessage("Sorry, unable to login. Please check your internet connection or try again later");
	}
	return false;
}

function studentLogin(){
	window.location="updates";
	return false;
}

function teacherLogin(){
	window.location="teacher/dashboard";
	return false;
}


function registration(){
var title = $("#titleId").val();
	var userName = $("#userNameId").val();
	var firstName = $("#firstNameId").val();
	var lastName = $("#lastNameId").val(); 
	//var emailId = document.getElementById("emailId").value;
	var schoolId = $("#schoolId").val();
	//var schoolName = $("#schoolId").val();  
	/* var address = document.getElementById("addressId").value; */
	var classId = $("#classId").val();
	//var className = document.getElementById("classNameId").value;
	var homeRoomId = $("#homeRoomId").val();
	//var homeRoomName = document.getElementById("homeRoomNameId").value;
	var adminEmailId = $("#adminEmailId").val();
	var userPassword =  $("#userPasswordId").val();
	var conUserPassword =  $("#conUserPasswordId").val();  
	if(title==null){
		$("#titleId").addClass("fieldFill");
		$("#titleSelect").show();
		
	}
	else if(title!=null){
		$("#titleId").removeClass("fieldFill");
	}
	
	if(firstName==""){
		$("#firstNameId").addClass("fieldFill").attr("placeholder", "First name");
	}
	else if(firstName!=""){
		$("#firstNameId").removeClass("fieldFill");
	}
	
	
	if(lastName==""){
		$("#lastNameId").addClass("fieldFill").attr("placeholder", "Last name");
	}
	else if(lastName!=""){
		$("#lastNameId").removeClass("fieldFill");
	}
	
	if(userName==""){
	$("#userNameId").addClass("fieldFill").attr("placeholder", "Please enter email");
	}
	else if(!ValidateEmail(userName)){
		$("#emailshowshow").show();
	}
	else if(ValidateEmail(userName)){
		$("#emailshowshow").hide();
			$("#userNameId").removeClass("fieldFill");
	}
	
	 if(userPassword==""){
		$("#userPasswordId").addClass("fieldFill").attr("placeholder", "Enter your password");
		$("#conUserPasswordId").addClass("fieldFill").attr("placeholder", "Confirm password");
	}
	
	else if(!validPassword(userPassword)){
		$("#lengthDivshow").show();
	}
	
	else if(validPassword(userPassword)){
	
		$("#lengthDivshow").hide();
		
	}
	
	if(userPassword.length< 8 || userPassword.length>16){
		$("#lengthDivshow").show();
	
	}
	
	else if(userPassword.length>=8 && userPassword.length<=16){
		$("#lengthDivshow").hide();
	$("#userPasswordId").removeClass("fieldFill");
	}
	

	
	
	 if(conUserPassword !=userPassword && conUserPassword != null){
		$("#confPasswords").show();
	}
	
	
	  else if(conUserPassword == userPassword && conUserPassword != ""){
		$("#confPasswords").hide();
		$("#userPasswordId").removeClass("fieldFill");
		$("#conUserPasswordId").removeClass("fieldFill");
	}
	
	if(schoolId==0){
		$("#schoolId").addClass("fieldFill");
		$("#schoolSelect").show();
	
	}
	else if(schoolId!=0){
		$("#schoolId").removeClass("fieldFill");
		$("#schoolSelect").hide();
	}
	 if(adminEmailId==""){
	 $("#adminEmailId").addClass("fieldFill").attr("placeholder", "Please enter organization email");
	 
	}else if(!ValidateEmail(adminEmailId)){
	$("#schoolEmId").show();
	}
	
	else if(ValidateEmail(adminEmailId)){
	$("#schoolEmId").hide();
	$("#adminEmailId").removeClass("fieldFill");
	}
	 if(classId==0){
	$("#classId").addClass("fieldFill");
	$("#selectClassId").show();
	}
	else if(classId!=0){
	$("#classId").removeClass("fieldFill");
	$("#selectClassId").hide();
	}
	 if(homeRoomId==0){
		$("#homeRoomId").addClass("fieldFill");
	$("#homeDivIdMsg").show();
	
	}
	else if(homeRoomId!=0){
		$("#homeRoomId").removeClass("fieldFill");
		$("#homeDivIdMsg").hide();
	}
	
	if(homeRoomId!=0 && classId!=0 && ValidateEmail(adminEmailId) && schoolId!=0 && conUserPassword == userPassword && userPassword !="" && userPassword.length>=8 && userPassword.length<=16 && ValidateEmail(userName) && title!="Title" && firstName!="" && lastName!="")
	{
		
		var data = $("#registrationFormId").serialize();
		$.post("registration",data,
		function(data,status){
			var responseMessage =JSON.parse(data);
            if(responseMessage.statusMessage =='success'){
            	 showSuccessMessage("Thank you for registering with Growth Cafe, Your registration is pending for approval from organization admin.");
            	 document.getElementById('registrationFormId').reset();
            }else{
            	showErrorMessage(responseMessage.statusMessage);
            }
            
        });
	}

        return false;
}





</script>




<script>
  // This is called with the results from from FB.getLoginStatus().
  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    // The response object is returned with a status field that lets the
    // app know the current login status of the person.
    // Full docs on the response object can be found in the documentation
    // for FB.getLoginStatus().
    if (response.status === 'connected') {
      // Logged into your app and Facebook.
      testAPI();
    } else if (response.status === 'not_authorized') {
      // The person is logged into Facebook, but not your app.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this app.';
    } else {
      // The person is not logged into Facebook, so we're not sure if
      // they are logged into this app or not.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into Facebook.';
    }
  }

  // This function is called when someone finishes with the Login
  // Button.  See the onlogin handler attached to it in the sample
  // code below.
  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
  FB.init({
    appId      : '1658101907755550',
    cookie     : true,  // enable cookies to allow the server to access 
                        // the session
    xfbml      : true,  // parse social plugins on this page
    version    : 'v2.2' // use version 2.2
  });

   };

  // Load the SDK asynchronously
  
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.4";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));



  // Here we run a very simple test of the Graph API after login is
  // successful.  See statusChangeCallback() for when this call is made.
  function testAPI() {
  console.log('Welcome!  Fetching your information.... ');
  var url = '/me?fields=name,email';
                    FB.api(url, function (response) {
                        window.location="getByFBId?userFbId="+response.email;
                    });
                    
  }
</script>


<html class="transition-navbar-scroll top-navbar-xlarge bottom-footer" lang="en">
<head>
   
    <title>Home Page</title>
   
    <link href="view/helper/css/theme-core.min.css" rel="stylesheet">
	<link href="view/helper/css/theme-style.css" rel="stylesheet">
    <link href="view/helper/css/module-essentials.min.css" rel="stylesheet" />
    <link href="view/helper/css/module-navbar.min.css" rel="stylesheet" />
    
    <style>
	
::-webkit-input-placeholder {
   font-style: italic;
   color:black !important;
}
:-moz-placeholder {
   font-style: italic;  
   color:black !important;
}
::-moz-placeholder {
   font-style: italic;  
   color:black !important;
}
:-ms-input-placeholder {  
   font-style: italic; 
   color:black !important;
}


body{font-family: helvetica; color:#666; font-size:14px; color:white !important;}
li,ul,body,input{margin:0; padding:0; list-style:none}
#login-form{width:350px;margin:0 auto; background:rgba(179,100,121,0.5); overflow:hidden; border-radius:7px}
.form-header{display:table;border-bottom: 1px solid white; clear:both}
label{font-weight:500 !important;cursor: pointer;}
.labeln{font-weight:500 !important;    cursor: auto !important;position:relative; top:-5px; 
}
.cursor{cursor: pointer !important;}
.form-header {display:block; cursor:pointer; z-index:999;}
.form-header li{margin:0; line-height:40px; width:174.5px; text-align:center; height:40px; background:#ba0032; color:white;font-size:16px; float:left; transition:all 600ms ease}

.buttons{position: relative; top: -8px;background:white; width:225px; border-radius:3px 3px 3px 3px; font-family: 'Ropa Sans', sans-serif; border:solid 1px black;outline:none; color:#c4425c; height:30px; line-height:31px; display:inline-block; padding-left:10px; font-size:13px; margin:-9px 0px 4px 0px;}
.buttons1{position: relative;top: -6px;background:white; width:225px; border-radius:3px 3px 3px 3px; font-family: 'Ropa Sans', sans-serif; border:solid 1px black;outline:none; color:#c4425c; height:30px; line-height:31px; display:inline-block; padding-left:10px; font-size:13px; margin-bottom:-4px;}
/*sectiop*/
.section-out{height:500px; width:700px; float:left; transition:all 600ms ease}
.section-out:after{content:''; clear:both; display:table}
.section-out section{width:350px; float:left}
.login{padding:20px}
.ul-list{clear:both; display:table; width:100%}
.ul-list:after{content:''; clear:both; display:table}
.ul-list li{ margin:0 auto; margin-bottom:10px;padding-right: 20px;}
.input{background:#dba6b5; width:305px; margin-top:-8px;border-radius:3px 3px 3px 3px; font-family: 'Ropa Sans', sans-serif; border:solid 1px white;outline:none; color:black; height:30px; line-height:31px; display:inline-block; padding-left:10px; font-size:13px}
.input,.login span.icon{vertical-align:top}
.login span.icon{width:50px; text-align:center; color:#999; height:40px; border-radius:0 3px 3px 0; background:#e8e8e8; height:40px; line-height:40px; display:inline-block; border:solid 1px #ccc; border-left:none; font-size:16px}
.input:focus:invalid{border-color:red}
.input:focus:invalid+.icon{border-color:red}
.input:focus:valid{border-color:green}
.input:focus:valid+.icon{border-color:green}
#check,#check1{top:1px; position:relative}
.btn{border:none; outline:none; background:#0099CC; border-bottom:solid 4px #006699; font-family: 'Ropa Sans', sans-serif; margin:0 auto; display:block; height:40px; width:100%; padding:0 10px; border-radius:3px; font-size:16px; color:#FFF}

.social-login{margin-top:-30px;padding:15px 20px; background:#ba0032; border-top:solid 2px #72142d; text-align:center}
.social-login a{display:inline-block; height:35px; text-align:center; line-height:35px; width:35px; margin:0 3px; text-decoration:none; color:#FFFFFF}
.form a i.fa{line-height:35px}
.fb{background:#305891} .tw{background:#2ca8d2} .gp{background:#ce4d39} .in{background:#006699}
.remember{width:50%;     margin-top: -3px;display:inline-block; clear:both; font-size:14px}
.remember:nth-child(2){text-align:right}
.remember a{text-decoration:none; color:white}

.hide{display:none}
.blocks{
display:block !important;    
	}

/*swich form*/
#signup:checked~.section-out{margin-left:-350px;height:500px;}
#login:checked~.section-out{margin-left:0px;}
#login:checked~div .form-header li:nth-child(1),#signup:checked~div .form-header li:nth-child(2)
{    background: #72142d;
    color: white;
	  display: block;
    cursor: pointer;
    z-index: 999;}
	
select option:disabled {
    color: #808080;
}


.signup-section{
    height: 100%;
    overflow-x: hidden;
    overflow-y: scroll;
}
<!---------Changes made by Praveen on 13Aug2015------->

</style>

</head>

<!-- Fixed navbar -->

	
		<div class="container-fluid">
            
                <div class="mobview1">
				<div class="video_top">
				
					<video id="vide-1" width="250" height="150" controls="">
				  <source src="view/helper/Big_Buck_Bunny.mp4" type="video/mp4"></source>
				  </video>
				  </div>
				</div>
				
				
				<div class="mobview">
					<div id="login-form">

					<input type="radio" checked id="login" name="switch" class="hide">
					<input type="radio" id="signup" name="switch" class="hide">
					<div>
					<ul class="form-header">
					<li><label class="blocks" for="login">LOGIN<label for="login"></li>
					<li><label class="blocks"for="signup">REGISTER</label></li>
					</ul>
					</div>

					<div class="section-out">
					<section class="login-section">
					<div class="login">
					<form action="login" method="post" id="loginFormId">
					<ul class="ul-list">
					<p class="center margin_w">Welcome Back!</p>
					<p class="center margin_s"><strong>Sign in to your account!</strong></p>
					<hr class="hr_full">
					<label class="labeln" for ="email">Email</label>
					<li><input type="email" onkeypress="if(event==13){login();}" class="input" name="userName" id="loginUserNameId" placeholder="Enter your email address"/></li>
					<div id="emailshow" class="msgShow">Enter a valid email id including '@' and '.'</div>
					<label class="labeln" for ="password">Password</label>
					<li><input type="password" class="input" onkeypress="if(event.keyCode==13){login();}"  name="userPassword" id="loginUserPasswordId" placeholder="Enter your password"/></li>
				<div id="lengthDiv" class="msgShow">Enter a password with 8-16 characters including one letter and number</div>
				
					<li><span class="remember"><input id="remeberMeId" type="checkbox" id="check" class="left"/> 
					<label class="left" for="check">&nbsp;Remember Me</label></span></li>
					<li class="center"><input type="button" onclick="return login();" value="SIGN IN" class="buttons"></li>
					
					<hr class="hr_full margin_topm8">
					<p class="center margin_h">Having Trouble !</p>
					<p class="center margin_f"><strong>Forgot Password?</strong></p>
					
					</ul>
					</form>
					</div>
					 
					<div class="login margin_topm35">
					<form  method="post" id="forgetPasswordFormId">
					<ul class="ul-list">
					<hr class="hr_full">
					<label class="labeln" for ="email">Email</label>
					<li><input type="email" id="forgetUserNameId" class="input" placeholder="Enter your email address"/></li>
					<div id="emailshowforget" class="msgShow">Enter a valid email id including '@' and '.'</div>
					<li class="center"><input type="button" onclick="forgetPassword();" value="SUBMIT"  class="buttons1 margin_top10 margin_left6"></li>
					</ul>
					</form>
					<hr class="hr_full margin_top2p">
					<p class="center margin_tb12">Or use,</p>
					<p class="center margin_tb12"><strong>Other Sign In Option</strong></p>
					</div>
					
					<div class="social-login">
					
						<label id="loginfb"  for="login">
						
								
														<div onlogin="checkLoginState();" class="fb-login-button loginfb3" data-max-rows="1" data-size="medium" data-show-faces="false" data-auto-logout-link="false">Login</div>
													
						</label>
					</div>
					</section>
					
					

					<section class="signup-section">
					<div class="login">
					<form method="post" id="registrationFormId">
					<ul class="ul-list">
					<p class="center margin_w">New Here!</p>
					<p class="center margin_s"><strong>Create your Account</strong></p>
					
						
					<hr class="hr_full">
					
					<div class="width_25p left">
					<label class="labeln" for ="email">Title</label>
					<li><select name="title" id="titleId" class="cursor input width_100p" >
					<option value="" disabled selected style="display:none;">Title</option>
					<option value="Mr.">Mr.</option>
					<option value="Mrs.">Mrs.</option>
					<option value="Ms.">Ms.</option>
					<option value="Dr.">Dr.</option>
					</select></li>
					</div>
					
					<div class="width_36p left">
					<label class="labeln" for ="fname">First Name</label>
					<li><input type="text" name="firstName" id="firstNameId" class="input width_100p" placeholder="First name"/></li>
					</div>
					 
					
					
					
					
					<div class="width_36p left">
					<label class="labeln" for ="lname">Last Name</label>
					<li ><input type="text" name="lastName" id="lastNameId" class="input width_100p" placeholder="Last name"/></li>
					</div>
					<div id="titleSelect" class="msgShow">Title not selected</div>
					
					
					<label class="labeln" for ="email">Email</label>
					<li><input type="email" name="userName" id="userNameId" class="input" placeholder="Enter your email address"/></li>
					<div id="emailshowshow" class="msgShow">Enter a valid email id including '@' and '.'</div>
					
					<div class="width_50p left">
					<label class="labeln" for ="pwd">Password</label>
					<li><input type="password" name="userPassword" id="userPasswordId" value="" class="input width_100p" placeholder="Enter your password"/></li>
					</div>	
					
					<div class="width_50p left">
					<label class="labeln" for ="cpwd">Confirm Password</label>
					<li><input type="password" name="conUserPassword" id="conUserPasswordId" value="" class="input width_100p" placeholder="Enter your password"/></li>
					</div>
					<li>
					<div id="lengthDivshow" class="msgShow">Short passwords are easy to guess. Try one with at least 8-16 characters including a alphabet and a number.</div>
					</li>
					<li>
					<div id="confPasswords" class="msgShow">Confirm Password field doesn't match with password</div>
					</li>
					
					
					<li>
					<label class="labeln" for ="pwd">Organization</label>
					<s:if test="schoolsList !=null">
					
				<s:select  cssClass="input" name="schoolId" id="schoolId" 
				list="schoolsList" headerKey="0" headerValue="Select Organization" listKey="schoolId" listValue="schoolName"
				 onchange="getClassDetails(this.value)"></s:select><br/>
				<div id="schoolSelect" class="msgShow">Organization name not selected</div>
				</s:if>
				<s:else>
				<select  class="input" name="schoolId"><option value="0">Select your Organization</option></select><br/>
				</s:else>
					</li>
					
					
					
					
					<label class="labeln" for ="pwd">Organization Email</label>
					<li><input type="email" name="adminEmailId" id="adminEmailId" class="input" placeholder="Enter organization email address"/></li>
					<div id="schoolEmId" class="msgShow">Organization email seems to be incorrect, Enter a valid email id  including '@' and '.'</div>	
					
					
					<div class="width_50p left">
					<label class="labeln" for ="classId">Department</label>
					<li>
					
					<div id="classDivId">
				<s:if test="classesList !=null">
				<s:select cssClass="input width_100p" headerKey="0" headerValue="Select Department" name="classId" list="classesList" listKey="classId" listValue="className" onchange="getHomeDetails(this.value)"></s:select><br/>
				
				
				</s:if>
				<s:else><select class="input width_100p" name="classId"><option value="0">Select Department</option></select><br/></s:else>
				</div>
				
				
					</li>
					<div id="selectClassId" class="msgShow">Department not selected</div>
					</div>
					
					
					
					<div class="width_50p left">
					<li>
					<label class="labeln" for ="homeRoomId">Group</label>
					<div id="homeDivId">
					<s:if test="homesList !=null">
						<s:select cssClass="input width_100p" headerKey="0" headerValue="Select Group" onchange="checkOrgAndDepart();" name="homeRoomId" list="homesList" listKey="homeRoomId" listValue="homeRoomName"></s:select><br/>
						
						</s:if>
						<s:else><select class="input width_100p" name="homeRoomId" onchange="checkOrgAndDepart();"><option value="0">Select Group</option></select><br/>
						</s:else>
						
					</div>
					
					</li>
					<div id="homeDivIdMsg" class="msgShow">Group not selected</div>
					</div>
					
				
					<li class="center"><input type="button" value="SIGN UP" onclick="return registration();" class="buttons margin_top10"></li>
					</ul>
					</form>
					</div>

					</section>
					</div>

					</div>

				</div>
				
	
</div>

				<div class="video_bottom">
				
					<video id="vide-1" width="250" height="150" controls="">
				 		 <source src="view/helper/Big_Buck_Bunny.mp4" type="video/mp4">
				  </video>
				  </div>

 


    
   
    <!-- Inline Script for colors and config objects; used by various external scripts; -->

    <!-- Separate Vendor Script Bundles -->
    <script src="view/helper/js/vendor-core.min.js"></script>
    
    
</body>

<style>
.fieldFill{
	background-color: #c2c2c2;
    border: 1px solid blue;
    color: red;
}

.msgShow{
	color: white;
    font-family: helvetica;
    font-size: 12px;
   	position:relative;
   	top : -10px;
    display:none;
}

</style>