<%@ taglib prefix="s" uri="/struts-tags"%>

    
     <div class="container margin_topm22">
        <div class="page-section">
            <div class="row">
                <div class="col-md-9">
                    <div class="row" data-toggle="isotope">
                        <!-- Module -->
						<div class="item col-xs-12 col-sm-12  col-md-12 col-lg-8">
                            <div class="panel panel-default paper-shadow" data-z="0.5">
                                <div class="panel-heading pad_modal1">
                                    <div class="media media-clearfix-xs-min v-middle">
                                        <div class="media-body text-caption text-white">
                                           <h5 class="h5_color">${assignmentVo.assignmentName}</h5>
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
											  <div class="media-body text-caption">
													   
														<div>
														<!-- <h4>This is a title of this assignment which student has submitted</h4> -->
														<h5 class="line_h16">${assignmentVo.assignmentDesc}</h5>
														<s:if test="assignmentVo.resourcesList !=null">
														<s:iterator value="assignmentVo.resourcesList">
														<%-- <iframe width="500" height="290" src="<s:property value="resourceUrl" />" frameborder="0" allowfullscreen></iframe> --%>
														<video id="vide-1" width="500" height="290" controls="" poster="">
													 	 <source src='<s:property value="resourceUrl" />' type="video/mp4">
													  </video>
													  </s:iterator>
													  </s:if>
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
						
						<div class="item col-xs-12 col-sm-12 col-md-12 col-lg-4">
								<div class="col-lg-12 col-sm-6 col-md-6 col-xs-12">
							<div class="panel panel-default paper-shadow" data-z="0.5" data-hover-z="1" data-animated="">
								<div class="panel-heading pad_modal1">
									<h5 class="h5_color">Module Information</h5>
								</div>
								<div class="panel-body">
									<p class="text-caption text_default">
										Course : ${assignmentVo.courseName} <br>
										Module : ${assignmentVo.moduleName} <br>
									  <s:if test="moduleDetail.timeDuration !=null"> <!-- <i data-toggle="tooltip" title="" class="fa fa-clock-o fa-fw" data-original-title="Time duration"></i> -->Module Duration :&nbsp; ${moduleDetail.timeDuration} days &nbsp;<br></s:if>
									  <s:if test="moduleDetail.startedOn !=null"><!-- <i data-toggle="tooltip" title="" class="fa fa-calendar fa-fw" data-original-title="Start Date"></i> -->Scheduled Start :&nbsp; ${moduleDetail.startedOn} &nbsp;<br></s:if> 
									   <s:if test="moduleDetail.completedOn !=null"><!-- <i data-toggle="tooltip" title="" class="fa fa-calendar fa-fw" data-original-title="Complete Date"></i> -->Scheduled End : &nbsp; ${moduleDetail.completedOn}</s:if>
										<!-- <br>
										<i data-toggle="tooltip" title="" class="fa fa-user fa-fw" data-original-title="Author"></i> Adrian Demian
										<br> -->
										
									</p>
								</div>
								<hr class="margin-none">
							   
							  
							</div>
					</div>
					
					<div class="col-lg-12 col-sm-6 col-md-6 col-xs-12">
							<div class="panel panel-default paper-shadow" data-z="0.5" data-hover-z="1" data-animated="">
							<div class="panel-heading pad_modal1">
									<h5 class="h5_color">Assignment Details</h5>
									</div>
								<div class="panel-body">
									
									<div class="expandable expandable-indicator-white expandable-trigger">
										<div class="expandable-content text_default">
										  <!-- <i data-toggle="tooltip" title="" class="fa fa-calendar fa-fw" data-original-title="Last date of submission"></i> -->Due Date :&nbsp; ${assignmentVo.assignmentDueDate}<br>
										  	<s:if test="assignmentVo.assignmentDueDate !=null">
										<!-- <i data-toggle="tooltip" title="" class="fa fa-calendar fa-fw" data-original-title="Last date of submission"></i> -->Submitted On :&nbsp; ${assignmentVo.assignmentSubmittedDate}<br>
										</s:if>
											<h5>${assignmentVo.assignmentDesc}</h5>
										<div class="expandable-indicator"><i></i></div></div>
									</div>
								</div>
							</div>
						</div>
						<s:if test="assignmentVo.ratingParameter !=null">
						<div class="col-lg-12 col-sm-6 col-md-6 col-xs-12">
							<div class="panel panel-default paper-shadow" data-z="0.5" data-hover-z="1" data-animated="">
								<div class="panel-heading pad_modal1">
									<h5 class="h5_color">Rating</h5>
								</div>
								<div class="panel-body">
									<p class="text-caption text_default">
									
										<div>${assignmentVo.ratingParameter[0][0]} : ${assignmentVo.ratingParameter[0][1]}</div>
					                    <div>${assignmentVo.ratingParameter[1][0]} : ${assignmentVo.ratingParameter[1][1]}</div>
					                     <div>${assignmentVo.ratingParameter[2][0]} : ${assignmentVo.ratingParameter[2][1]}</div>
					                  
									</p>
								</div>
								<hr class="margin-none">
									</div>
							</div>
					 </s:if>	
						
						</div>
						
						</div>
                    
                </div>
				<!-- Recent Updates Jsp Included -->
		              			<s:include value="recentUpdates.jsp"></s:include>
		              <!-- Recent Updates Jsp Included -->
        </div>
    </div>
   </div>