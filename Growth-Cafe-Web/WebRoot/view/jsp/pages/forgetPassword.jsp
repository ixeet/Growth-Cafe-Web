<%@ taglib prefix="s" uri="/struts-tags"%>

<script type="text/javascript">

function ValidateEmail(email) {
      var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
        return expr.test(email);
    };


function sendforgetPassword(){
		var userName = $("#fpuserNameId").val();
		if(userName ==""){
				showSuccessMessage("Email field can't be empty, please enter a registered email id to get password");
		}else if(!ValidateEmail(userName)){
			showSuccessMessage("Enter a valid email id including '@' and '.'");
		}else{
			/* $("#forgetPasswordFormId").submit(); */
			
			var dataString = $("#forgetPasswordFormId").serialize();
		/* $.get("sendforgetPassword",dataString,
		function(data,status){
			var response = JSON.parse(data);
            if(response.statusMessage=='success'){
						showSuccessMessage("Your password is sent to "+userName+", please check SPAM folder if not received in inbox");
						setTimeout(function() {homeClick();},2250);
					}else{
						showErrorMessage("Email doesn't match with database, please enter a registered email Id to get password");
					}
        }); */
        
        
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
}

</script>

<div class="body_signup"><!-- signup body -->
	<div class="signup_container"><!-- signup container -->
		<div class="signupbox"><!-- signup box -->
			<div class="signup_head">
				<h3> Forgot Password</h3>
			</div>
			
			<form class="form_pad" action="forgetPassword" id="forgetPasswordFormId"><!-- signup form -->
				
				<input type="text" class="signupinput-l" name="userName" id="fpuserNameId" value=""  placeholder="Enter email id">
				
				<input  class="signupbutton" value="Submit" tabindex="4" onclick="sendforgetPassword();" type="button">
			</form><!-- signup form -->
		</div><!-- signup box -->
	</div><!-- signup container -->
   </div><!-- signup body -->