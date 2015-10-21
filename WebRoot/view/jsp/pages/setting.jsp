<%@ taglib prefix="s" uri="/struts-tags"%>


<script>
$(document).ready(function(){
/* $('.setting_clicked').click(function() {
    $(this).toggleClass('set_pic');
	 $(this).parent().children('.text').toggleClass('text2');
	
}); */
	$("#feedAccessTypeId #"+'${userAccessTypeId}'+" i").removeClass("fa-bell-o");
	
});


function follow(userId){
	var oldStatus=$("#userDivId-"+userId+" #userStatus").val();
	var arr = oldStatus.split('-');
	if(arr[1]==1){
		var newStatus=userId+"-0";
		$("#userDivId-"+userId+" #userStatus").val(newStatus);
		$("#userDivId-"+userId+" h6").addClass("text2");
		$("#userDivId-"+userId+" #userStatus").attr("name", "followStatus");
		$("#userDivId-"+userId+" img").addClass("set_pic");
	}else{
		$("#userDivId-"+userId+" h6").removeClass("text2");
		$("#userDivId-"+userId+" img").removeClass("set_pic");
		$("#userDivId-"+userId+" #userStatus").attr("name", "followStatus");
		var newStatus=userId+"-1"; 
		$("#userDivId-"+userId+" #userStatus").val(newStatus);
	}
}


function setFollowerStatus(){
	var newStatus = $("[name=followStatus]").val();
	
	var group = $('input[name="followStatus"]');
	var newStatus="";

		var i=1;
	   	group.each(function () {
	       newStatus=newStatus+$(this).attr("name",$(this).attr("name")).val();
	       if(i<group.length){
	       	newStatus=newStatus+",";
	       	i++;
	       }
	   });
	   
	   $.ajax({
			url : "setFollowerStatus",
			data :{"followStatus":newStatus},
			beforeSend :function(){
				startwindowDisable();
			},
			success : function(data){
			},
			complete		:	function(){
				endwindowDisable();
		}
        });
	
}

function setFeedAccessType(accessId){
	$("#feedAccessTypeId  i").addClass("fa-bell-o");
	$("#feedAccessTypeId #"+accessId+" i").removeClass("fa-bell-o");
	window.location="setFeedAccessType?userAccessTypeId="+accessId;
	/* $.ajax({
			url : "setFeedAccessType",
			data :{"userAccessTypeId":accessId},
			beforeSend :function(){
				//showErrorMessage("newStatus");
			},
			success : function(data){
			},
        }); */
}
</script>


<div class="container margin_topm22">
        <div class="page-section">
            <div class="row">
                <div class="col-md-4">

				
					
						
							

								
									<div class="row" data-toggle="isotope">
										<!-- Module -->
										
										<!-- Modules ends-->
										
										<div class="item col-xs-12 col-sm-12 col-md-12 col-lg-12">

												<div class="panel panel-default paper-shadow" data-z="0.5" data-hover-z="1" data-animated="">
													 <div class="panel-heading">
													<h5 class="h5_color">Who Can See My Updates?</h5>
													</div>
													<div class="panel-body pad_l14" id="feedAccessTypeId">
														<h5>
															<strong><i class="fa fa-university"></i> Organizations</strong>
															<a id="1" href="javaScript:;" onclick="setFeedAccessType(1);"><i class="fa fa-bell right default_color fa-bell-o"></i></a>
															</h5>
															<hr class="margin-none">
															
															<h5> <strong><i class="fa  fa-delicious"></i> Districts</strong>
															<a id="2" href="javaScript:;" onclick="setFeedAccessType(2);"><i class="fa fa-bell right default_color fa-bell-o"></i></a>
														</h5>
														<hr class="margin-none">
															<h5><strong><i class="fa fa-cubes"></i> Departments</strong>
															<a id="3" href="javaScript:;" onclick="setFeedAccessType(3);"><i class="fa fa-bell right default_color fa-bell-o"></i></a>
															</h5>
															<hr class="margin-none">
															 <h5><strong><i class="fa fa-users"></i> Groups</strong>
															<a id="4" href="javaScript:;" onclick="setFeedAccessType(4);"><i class="fa fa-bell right default_color fa-bell-o"></i></a>
														</h5>
														<!-- <hr class="margin-none"><br/>
														<a class="pad4 normalbutton btn-height btn_mar_left" href="#">Save</a> -->
														
														
													
													</div>
													<hr class="margin-none">


												</div>
											
										</div>

									</div>

			</div>
			<div class="col-md-8">

				
					
						
							

								
									<div class="row" data-toggle="isotope">
										<!-- Module -->
										
										<!-- Modules ends-->

										<div class="item col-xs-12 col-sm-12 col-md-12 col-lg-12" >
											
												<div class="panel panel-default paper-shadow" data-z="0.5" data-hover-z="1" data-animated="">
													 <div class="panel-heading">
													<h5 class="h5_color">Hide Post on my timeline <span style="font-size: 11px;text-transform: none;font-weight: 500;"> (Unfollow people to hide their updates) </span></h5>
													</div>
													<div class="panel-body pad_l14">
														<h5 class="center"> Tap to choose whose updates <br/>you want to stop seeing in your timeline </h5>
													
														<div  class="media v-middle seeting_pad">
															<s:if test="userList !=null && userList.size()>0">
															<s:iterator value="userList" var="status">
															<div id="userDivId-<s:property value='userId'/>" class="media-left center seeting_pic">
																	
																	<input id="userStatus" name="" type="text" value="<s:property value='userId'/>-<s:property value='isFollowUpAllowed'/>" style="display: none;"> 
																	
																	
																	<s:if test="isFollowUpAllowed == 1">
																		<img src="view/helper/images/people/110/guy-3.jpg" onclick="follow(<s:property value='userId'/>);" alt="person" class="setting_clicked img-circle width-60">
																	</s:if>
																	<s:else>
																		<img src="view/helper/images/people/110/guy-3.jpg" onclick="follow(<s:property value='userId'/>);" alt="person" class="setting_clicked img-circle width-60 set_pic">
																	</s:else>
																	<h5 class="setting_h5 auto_dots100"><s:property value="userName"/> </h5>
																	<s:if test="isFollowUpAllowed == 1">
																		<h6 class="text">unfollowed</h6>
																	</s:if>
																	<s:else><h6 class="text text2">unfollowed</h6></s:else>
																	
																
															</div>
															</s:iterator>
															</s:if>
															<s:else>There is no data</s:else>
														</div>
												<a class="pad4 normalbutton btn-height btn_mar_left margin_top15" href="javaScript:;" onclick="setFollowerStatus();">Save</a>
													</div>
												
													
													<hr class="margin-none">


												</div>
											
											
										</div>

									</div>

			</div>
              
        </div>
        </div>
        </div>
        