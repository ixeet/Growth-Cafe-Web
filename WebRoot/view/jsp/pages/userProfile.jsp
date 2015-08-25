<%@ taglib prefix="s" uri="/struts-tags"%>

	
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
	    margin-left: 10px;
	    display:none;
	}

</style>


<script>

function validPassword(password){
 var expr = /^(?=.*[0-9])(?=.*[a-zA-Z])([a-zA-Z0-9]+)|(?=.*[0-9])(?=.*[a-zA-Z])([a-zA-Z0-9-+_!@#$%^&*.,?]+)$/;
 return expr.test(password);
}


	$(document).ready(function(){
	var headerValue = $("#titleId").val();
	$("#headerKeyId").val(headerValue);
	});
	</script>
	<script>
	
	function ValidateEmail(email) {
      var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
        return expr.test(email);
    };
	
	function updateProfile(){
		var title=$("#headerKeyId").val();
		var firstName=$("#firstNameId").val();
		var lastName=$("#lastNameId").val();
		//var adminEmail=$("#adminEmailId").val();
		
			
		if(title=="Title"){
			$("#headerKeyId").addClass("fieldFill");
			}
	
		else if(title!="Title"){
			$("#headerKeyId").removeClass("fieldFill");
			}
	 
	 	if(firstName==""){
			$("#firstNameId").addClass("fieldFill").attr("placeholder", "Enter FirstName");
			}
	
		else  if(firstName!=""){
			$("#firstNameId").removeClass("fieldFill");
			}
			
		if(lastName==""){
		$("#lastNameId").addClass("fieldFill").attr("placeholder", "Enter FirstName");
		}
	
		else  if(lastName!=""){
			$("#lastNameId").removeClass("fieldFill");
			}
		
		
	
	/* 	if(adminEmail==""){
		$("#adminEmailId").addClass("fieldFill").attr("placeholder", "Please enter email");
		}
		
		
		
		else if(!ValidateEmail(adminEmail)){
			$("#emailshow").show();
			//alert("Enter a valid email id including '@' and '.'");
		}
		else if(ValidateEmail(adminEmail)){
			$("#emailshow").hide();
				$("#adminEmailId").removeClass("fieldFill");
			//alert("Enter a valid email id including '@' and '.'");
		} */
			
		if(lastName!="" && firstName!="" && title!="Title"){
		$("#profileFormId").submit();
		/* $.post("updateProfile",data,
		function(data,status){
		location.reload(); 
        });*/
	}
		return false;
	}
	
  function openFileOption()
	{
	  document.getElementById("file1").click();
	}
	
	
	
	function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#blah')
                    .attr('src', e.target.result)
                    .width(100)
                    .height(150);
            };
            
            $("#profileImgUploadFormId").submit();

        }
    }



$("input").change(function(e) {

      for (var i = 0; i < e.originalEvent.srcElement.files.length; i++) {
        var file = e.originalEvent.srcElement.files[i];
        var img = document.createElement("img");
        var reader = new FileReader();
        reader.onloadend = function() {
           img.src = reader.result;
        }
        reader.readAsDataURL(file);
        $("input").after(img);
      
    }
});
	
	function changePassword(){
	var confirmPassword = document.getElementById("conUserPasswordId").value;
	var userPassword = document.getElementById("userPasswordId").value;
	var userNewPassword = document.getElementById("userNewPasswordId").value;
	if(userPassword=="" || userPassword=="" || userNewPassword==""){
			showSuccessMessage("Password fields can't be empty, please enter a valid password.");
		} else if(userNewPassword !=confirmPassword){
			showSuccessMessage("Enter a password not match");
		} else if(!validPassword(userNewPassword)){
			showSuccessMessage("Enter a password with 8 characters including one letter and number.");
		} else if(!validPassword(userPassword)){
			showSuccessMessage("Enter a password with 8 characters including one letter and number.");
		}else if(userPassword.length<8 || userNewPassword.length<8){
		showSuccessMessage("Enter a password with 8 characters including one letter and number.");
		} else{
		$("#changePasswordFormId").submit();
		
		/* var data = $("#loginFormId").serialize();
		$.post("login",data,
		function(data,status){
            alert("Data: " + data + "\nStatus: " + status);
        }); */
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
                    $.ajax({
						url : "setFacebookId",
						type :"post",
						data :{"userFbId":response.email},
						beforeSend :function(){
							//showErrorMessage("looading");
						},
						success : function(result1){alert(result1);/* 
						var response = JSON.parse(result1);alert(response);
						if(response.statusMessage=='success'){
							showSuccessMessage("Your Facebook Id successfuly set");
						}else{
							showSuccessMessage("Your Facebook Id not set");
						} */
						//$("#BodyId").html(data);
						},
			        });
                       // window.location="?userFbId="+response.email;
                    });
                    
  }
</script>

	<div class="parallax overflow-hidden  page-section third margin-section">
        <div class="container parallax-layer" data-opacity="true" style="opacity: 1; transform: translate3d(0px, 0px, 0px);">
            <div class="media v-middle">
                
                <div class="media-body">
                    <h3 class="text-black margin-v-0"><a class="transf" href="#">Dashboard</a> / Profile</h3>
					
                  
                </div>
               
            </div>
        </div>
    </div>

 <div class="container">
        <div class="page-section">
            <div class="row">
                <div class="col-md-9">
                    <!-- Tabbable Widget -->
                    <div class="tabbable paper-shadow relative" data-z="0.5">
                        <!-- Tabs -->
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#"><i class="fa fa-fw fa-lock"></i> <span class="hidden-sm hidden-xs">Your Profile</span></a></li>
                            
                        </ul>
                        <!-- // END Tabs -->
                        <!-- Panes -->
                        <div class="tab-content">
                            <div id="account" class="tab-pane active">
                            
                            
                            
                            
                            
                              <div class="panel panel-default">
                       				 <div class="panel-body">
                            <form class="form-horizontal" action="updateProfileImg" method="post" id="profileImgUploadFormId" enctype="multipart/form-data">
                                
                                    <div class="form-group">
                                    <label for="inputEmail3" class="col-md-2 control-label">Profile Picture</label>
                                    <div class="col-md-8">
                                    	<div class="row">
                                        
		                                        <div class="col-md-6">
		                                            <div class="media v-middle">
		                                                <div class="media-left">
		                                                    <div class="icon-block width-100 bg-grey-100">
		                                                       <!--  <i class="fa fa-photo text-light"></i> -->
		                                                       <img class=" width-100 height-100" id="blah" src="${sessionScope.loginDetail.profilePhotoFileName}" alt="" />
		                                                    </div>
		                                                </div>
		                                                <div class="media-body">
		                                                    <a href="#" onclick="openFileOption();return;" style="float:left"  class="btn btn-pad btn-height loginbutton" data-z="0.5" data-hover-z="1" data-animated> Add Image<i class="fa fa-upl"></i></a>
															<input type="file" id="file1"  name="profilePhoto"  onchange="readURL(this);" style="display: none;"/>
														</div>
		                                            </div>
		                                        </div>
		                                         <div class="col-md-6">
		                                            <div class="media v-middle">
		                                              <a href="#modal-update-credit-card" data-toggle="modal" ><i class="fa fa-pencil fa-fw"></i> Change Password</a>
		                                            </div>
		                                            <div class="media v-middle">
		                                              <label id="loginfb"  for="login">
														<div onlogin="checkLoginState();" class="fb-login-button loginfb" data-max-rows="1" data-size="medium" data-show-faces="false" data-auto-logout-link="false">Set Facebook Id</div>
													</label>
		                                            </div>
		                                        </div>
		                                        
		                                        
                    
		                                    </div>
		                                 </div>   
                                    </div>
                            </form>
                                <form class="form-horizontal" action="updateProfile" method="post" id="profileFormId">
                                
                                    <!-- <div class="form-group">
                                    <label for="inputEmail3" class="col-md-2 control-label">Profile Picture</label>
                                    <div class="col-md-8">
                                    	<div class="row">
                                        
		                                        <div class="col-md-6">
		                                            <div class="media v-middle">
		                                                <div class="media-left">
		                                                    <div class="icon-block width-100 bg-grey-100">
		                                                        <i class="fa fa-photo text-light"></i>
		                                                       <img id="blah" src="#" alt="your image" />
		                                                    </div>
		                                                </div>
		                                                <div class="media-body">
		                                                    <a href="#" onclick="openFileOption();return;" style="float:left"  class="btn btn-pad btn-height loginbutton" data-z="0.5" data-hover-z="1" data-animated> Add Image<i class="fa fa-upl"></i></a>
															<input type="file" id="file1"  name="userProfileImg"  onchange="readURL(this);" style="display: none;"/>
														</div>
		                                            </div>
		                                        </div>
		                                         <div class="col-md-6">
		                                            <div class="media v-middle">
		                                              <a href="#modal-update-credit-card" data-toggle="modal" ><i class="fa fa-pencil fa-fw"></i> Change Password</a>
		                                            </div>
		                                        </div>
		                                        
		                                        
                    
		                                    </div>
		                                 </div>   
                                    </div> -->
                                    
                                    <%-- <div class="form-group">
                                        <label for="inputPassword3" class="col-md-2 control-label">Title</label>
                                        <div class="col-md-6">
                                            <div class="form-control-material">
                                            <s:select name="title" cssClass="form-control used" list='#{"Mr.":"Mr.","Mrs.":"Mrs.","Ms.":"Ms.","Dr.":"Dr."}' id="headerKeyId" headerKey="Title" headerValue="Title"/>
                                            </div>
                                        </div>
                                    </div>
                                     --%>
                                     <div style="clear:both"></div>
                                     <div class="form-group">
                                    <label for="inputEmail3" class="col-md-2 control-label">Title</label>
                                    <div class="col-md-8">
                                    
                                     <div class="row">
                                       <%--  <select class="selectpicker col-md-6 col-sm-6 col-xs-6" data-style="btn-white" title='Choose one of the following...'>
                                            <option>Mustard</option>
                                            <option>Ketchup</option>
                                            <option>Relish</option>
                                        </select> --%>
                                     <div class="col-md-6 selectw">
									<s:select name="title" cssClass="borderg col-md-12 col-sm-6 col-xs-6" list='#{"Mr.":"Mr.","Mrs.":"Mrs.","Ms.":"Ms.","Dr.":"Dr."}' data-style="btn-white" id="headerKeyId" headerKey="Title" headerValue="Title"/>
                                            </div>
                                        
                                    </div>
                                    </div>
                                </div>
                            
                                <div style="clear:both"></div>
                                        <br>
                                    <input type="text" style="display:none;"  id="titleId" value="${sessionScope.loginDetail.title}">
                                    
                                    <div class="form-group">
                                        <label for="inputEmail3" class="col-md-2 control-label">Full Name</label>
                                        <div class="col-md-8">
                                            <div class="row">
                                                <div class="col-md-6 selectw">
                                                    <div class="form-control-material pad_0 " style="height:38px">
                                                        <input type="text" class="form-control used " name="firstName" id="firstNameId" value="${sessionScope.loginDetail.firstName}" placeholder="Your first name">
                                                      
                                                    </div>
                                                </div>
                                                <div class="col-md-6 selectw">
                                                    <div class="form-control-material pad_0" style="height:38px">
                                                        <input type="text" class="form-control used" name="lastName" id="lastNameId" value="${sessionScope.loginDetail.lastName}" placeholder="Your last name">
                                                       
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <%-- <div class="form-group">
                                    <label for="inputEmail3" class="col-md-2 control-label">Email</label>
                                        <div class="col-md-8">
                                            <div class="form-control-material">
                                                <input type="text" class="form-control used" name="emailId" id="adminEmailId" value="${sessionScope.loginDetail.emailId}"  placeholder="Email">
                                                <label for="inputPassword3">Email</label>
                                            </div>
                                        </div>
                                    </div> --%>
                                    <div style="clear:both"></div>
                                    <br>
                                    <div class="form-group">
                                        <div class="col-md-offset-2 col-md-10">
											 <input  value="Save Changes" type="button" onclick="return updateProfile();" class="left btn-pad btn-height loginbutton " data-z="0.5" data-hover-z="1" data-animated>
                                        </div>
                                    </div>
                                </form>
                                
                                </div></div>
                                
                                
                            </div>
                        </div>
                        <!-- // END Panes -->
                    </div>
                    <!-- // END Tabbable Widget -->
                    <br/>
                    <br/>
                </div>
				
              <div class="col-md-3">
                    <div class="panel panel-default" data-toggle="panel-collapse" data-open="true">
                        <div class="panel-heading bgntext panel-collapse-trigger">
                            <h4 class="text-white">Information</h4>
                        </div>
                        <div class="panel-body list-group">
                           <ul class="list-group relative paper-shadow" data-hover-z="0.5" data-animated>
                                    <li class="list-group-item paper-shadow">
                                        <div class="media v-middle">
                                            
                                            <div class="media-body">
                                               <h4 style="color:#ba0032">School :  <a href="#" class="text-subhead link-text-color">${sessionScope.loginDetail.schoolName}</a></h4>
                                                
                                            </div>
                                           
                                        </div>
                                    </li>
                                    <li class="list-group-item paper-shadow">
                                        <div class="media v-middle">
                                            
                                            <div class="media-body">
                                                <h4 style="color:#ba0032">Class :  <a href="#" class="text-subhead link-text-color">${sessionScope.loginDetail.className}</a></h4>
                                                
                                            </div>
                                           
                                        </div>
                                    </li>
									<li class="list-group-item paper-shadow">
                                        <div class="media v-middle">
                                            
                                            <div class="media-body">
                                                <h4 style="color:#ba0032">Home Room :  <a href="#" class="text-subhead link-text-color">${sessionScope.loginDetail.homeRoomName}</a></h4>
                                                
                                            </div>
                                           
                                        </div>
                                    </li>
									
                                </ul>
                        </div>
                    </div>
            </div>
        </div>
 </div>
 </div>
	 
 									<!-- popup box for change password -->
		                                        
										              <div class="modal grow modal-backdrop-white fade" id="modal-update-credit-card">
								                        <div class="modal-dialog modal-sm">
								                            <div class="v-cell">
								                                <div class="modal-content">
								                                    <div class="modal-header">
								                                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
								                                        <h4 class="modal-title">Change password</h4>
								                                    </div>
								                                    <div class="modal-body">
								                                        <form id="changePasswordFormId" method="post" action="changePassword">
								                                            <div class="form-group form-control-material">
								                                                <input name="userPassword" type="password" class="form-control used" id="userPasswordId" placeholder="Old password">
								                                                <label for="credit-card">Old Password</label>
								                                            </div>
								                                            <div class="form-group form-control-material">
								                                                <input name="userNewPassword" type="password" class="form-control used" id="userNewPasswordId" placeholder="New password">
								                                                <label for="credit-card">New Password</label>
								                                            </div>
								                                            <div class="form-group form-control-material">
								                                                <input name="confPassword" type="password" class="form-control used" id="conUserPasswordId" placeholder="Confirm password">
								                                                <label for="credit-card">Confirm Password</label>
								                                            </div>
								                                            
								                                            <button type="button" onclick="return changePassword();" class="btn-pad btn-height loginbutton fnone paper-shadow relative" data-z="0.5" data-hover-z="1" data-animated data-dismiss="modal">Update Password</button>
								                                        </form>
								                                    </div>
								                                </div>
								                            </div>
								                        </div>
								                    </div>
								                    
								                    <!--  poppup ends here -->
								                    
		<%-- <div style="background-color: rgba(186, 0, 50, 0.7); margin: 2%; width: 39%;">

			<form   method="post" class="form_pad" id="profileFormId"><!-- signup form     action="updateProfile" -->
			<s:select name="title" cssClass="signupinput-update-m" list='#{"Mr.":"Mr.","Mrs.":"Mrs.","Ms.":"Ms.","Dr.":"Dr."}' id="headerKeyId" headerKey="Title" headerValue="Title"/>
				<input type="text" class="signupinput-update-m" name="firstName" id="firstNameId" value="${sessionScope.loginDetail.firstName}" placeholder="First Name">
				<input type="text" class="signupinput-update-m" name="lastName" id="lastNameId" value="${sessionScope.loginDetail.lastName}" placeholder="Last Name">
				<input type="text" class="signupinput-update" name="emailId" id="adminEmailId" value="${sessionScope.loginDetail.emailId}"  placeholder="Email">
				<div id="emailshow" class="msgShow">Enter a valid email id including '@' and '.'</div>
				<input type="text" style="display:none;"  id="titleId" value="${sessionScope.loginDetail.title}">
				<input class="signupbutton" value="Update" type="button" onclick="return updateProfile();">
			</form>
			
		</div> --%>