<%@ taglib prefix="s" uri="/struts-tags"%>

<script>
$(document).ready(function(){
$('.fa-bell').click(function() {
    $(this).toggleClass('fa-bell-o');
});

});
</script>

<script>
$(document).ready(function(){
$('.setting_clicked').click(function() {
    $(this).toggleClass('set_pic');
	 $(this).parent().children('.text').toggleClass('text2');
	
});

});
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
													<div class="panel-body pad_l14">
														<h5>
															<strong><i class="fa fa-university"></i> Organizations</strong>
															<a href="#"><i class="fa fa-bell right default_color"></i></a>
															</h5>
															<hr class="margin-none">
															
															<h5> <strong><i class="fa  fa-delicious"></i> Districts</strong>
															<a href="#"><i class="fa fa-bell right default_color"></i></a>
														</h5>
														<hr class="margin-none">
															<h5><strong><i class="fa fa-cubes"></i> Departments</strong>
															<a href="#"><i class="fa fa-bell right default_color"></i></a>
															</h5>
															<hr class="margin-none">
															 <h5><strong><i class="fa fa-users"></i> Groups</strong>
															<a href="#"><i class="fa fa-bell right default_color"></i></a>
														</h5>
														<hr class="margin-none"><br/>
														<a class="pad4 normalbutton btn-height btn_mar_left" href="#">Save</a>
														
														
													
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
													
														<div class="media v-middle seeting_pad">
															<s:if test="userList !=null && userList.size()>0">
															<s:iterator value="userList">
															<div class="media-left center seeting_pic">
															
																
																	<img src="view/helper/images/people/110/guy-3.jpg" alt="person" class="setting_clicked img-circle width-60">
																
																	<h5 class="setting_h5"><s:property value="userName"/> </h5>
																	<h6 class="text">unfollowed</h6>
																
															</div>
															</s:iterator>
															</s:if>
														</div>
												<a class="pad4 normalbutton btn-height btn_mar_left margin_top15" href="#">Save</a>
													</div>
												
													
													<hr class="margin-none">


												</div>
											
											
										</div>

									</div>

			</div>
              
        </div>
        </div>
        </div>
        