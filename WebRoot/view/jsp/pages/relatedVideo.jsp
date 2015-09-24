<%@ taglib prefix="s" uri="/struts-tags"%>

    
     <div class="container margin_topm22">
        <div class="page-section">
            <div class="row">
                <div class="col-md-9">
                    <div class="row" data-toggle="isotope">
                        <!-- Module -->
						<div class="item col-xs-12 col-sm-12  col-md-12 col-lg-12">
                            <div class="panel panel-default paper-shadow" data-z="0.5">
                                <div class="panel-heading">
                                    <div class="media media-clearfix-xs-min v-middle">
                                        <div class="media-body text-caption ">
                                           <h5 class="h5_color">${resourceName}</h5>
                                        </div>
                                        
                                    </div>
                                </div>
                                
                               
								<div class="tabbable tabs-blocks">
									<!-- Tabs -->
									<!-- <ul class="nav nav-tabs" tabindex="4" style="overflow: hidden; outline: none;">
										<li class="active"><a href="#blocks-home-1" data-toggle="tab"><i class="fa fa-vimeo-square"></i> Assignment 1</a></li>
										<li><a href="#blocks-profile-1" data-toggle="tab"><i class="fa fa-vimeo-square"></i> Assignment 2</a></li>
										<li><a href="#blocks-messages-1" data-toggle="tab"><i class="fa fa-vimeo-square"></i> Assignment 3</a></li>
										<li><a href="#blocks-settings-1" data-toggle="tab"><i class="fa fa-vimeo-square"></i> Assignment 4</a></li>
									</ul> -->
									<!-- // END Tabs -->
									<!-- Panes -->
									
									<div class="tab-content">
										<div id="blocks-home-1" class="tab-pane active">
											<div class="panel-heading">
											  <div class="media-body">
													   
														<div>
														<div class="col-xs-12 col-sm-12  col-md-12 col-lg-8">
														<!-- <h4>This is a title of this assignment which student has submitted</h4> -->
														<h6></h6>
													
														<%-- <iframe width="500" height="290" src="<s:property value="resourceUrl" />" frameborder="0" allowfullscreen></iframe> --%>
														<video id="vide-1" width="500" height="290" controls="" poster="">
													 	 <source src='${resourceUrl}' type="video/mp4">
													  </video>
													  </div>
													  
													  <div class="col-xs-12 col-sm-12  col-md-12 col-lg-4">
														<h5 class="font14" style="font-weight: bolder;">Description:</h5>
														<h6 class="font14" style="text-align: justify;">${resourceDesc}</h6>
													  </div>
													  
													</div>
												</div>
											</div>
										</div>
										<div id="blocks-profile-1" class="tab-pane">
											Adipisci commodi consequuntur ducimus enim est, et facilis nostrum nulla officiis pariatur quasi reiciendis, sed sunt. Accusantium aut autem consequatur cupiditate delectus dolore dolorem doloribus ducimus ex harum, illo impedit ipsa iusto maiores, minus nesciunt, perspiciatis placeat quae quibusdam quis repellat repudiandae rerum sed sequi suscipit temporibus veniam vitae. Alias debitis earum incidunt nostrum veniam, voluptas. A consequatur consequuntur distinctio dolores ex excepturi id, iusto maxime numquam quae qui unde voluptates! Accusamus ad aut, blanditiis debitis deleniti eius eum facere ipsam laboriosam laborum magnam nesciunt odio quas repellendus rerum sequi, sit. Architecto ex hic necessitatibus, officia perferendis quae quidem sapiente.
										</div>
										<div id="blocks-messages-1" class="tab-pane">
											Ab accusamus aperiam consequatur ducimus ea eos est, non omnis porro possimus praesentium, provident quam quibusdam quidem quo suscipit voluptate? Aperiam, dolorum eaque labore natus placeat sint totam. Cupiditate eos explicabo fugiat labore natus officia quidem sed ullam veniam voluptatibus. Consequatur, ducimus id, iste modi nesciunt nostrum obcaecati odit porro quaerat quibusdam quisquam, sequi similique vero. Adipisci aliquid at aut culpa cumque distinctio earum esse eveniet excepturi exercitationem harum illum in iste laudantium mollitia, nulla numquam perferendis perspiciatis porro qui, quo quod ratione similique suscipit temporibus ullam voluptas voluptates! Aperiam atque dolor excepturi illum in, magnam nemo quidem tempora vitae.
										</div>
										<div id="blocks-settings-1" class="tab-pane">
											Aliquam distinctio eligendi eos iure maiores molestiae praesentium. Aliquam aliquid architecto at blanditiis dignissimos doloremque esse et eveniet ex excepturi expedita ipsam itaque iusto minima nisi nobis, numquam, odit omnis quae quaerat quas quisquam ratione sapiente, sint sit suscipit voluptas! Illum libero tempora velit. Accusamus animi aut beatae cupiditate dignissimos dolore eligendi exercitationem id maiores maxime necessitatibus, nisi non omnis quis quos reiciendis repellat vel. Aperiam asperiores at aut blanditiis consequatur consequuntur cumque ex exercitationem explicabo fuga impedit incidunt ipsam iusto libero minus nostrum nulla obcaecati omnis optio provident quae quaerat, quia quibusdam reiciendis sed, sunt tenetur? Hic tempora, vel!
										</div>
									</div>
								
									<!-- // END Panes -->
								
                                </div>
                            </div>
							
					
                        </div>
						<!-- Modules ends-->
						
						
						
						</div>
                    
                </div>
				<!-- Recent Updates Jsp Included -->
		              			<s:include value="recentUpdates.jsp"></s:include>
		              <!-- Recent Updates Jsp Included -->
        </div>
    </div>
   </div>