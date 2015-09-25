<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="container">
		<div class="row">
			<div class="col-md-9">

				<s:if test="courseListDetails!= null && courseListDetails.size()>0">
					<s:iterator value="courseListDetails" var="parent">
						<s:if test="modulesList!= null">
							<s:iterator value="modulesList" begin="0" end="0" var="child">

								<s:iterator value="assignmentSubmitList">
									<div class="row" data-toggle="isotope">
										<!-- Module -->
										<div class="item col-xs-12 col-sm-12  col-md-12 col-lg-8">
											<div class="panel panel-default paper-shadow" data-z="0.5">
												<div class="panel-heading">
															<%-- <h5 class="text-white">${assignmentVo.assignmentName}</h5> --%>
													<h5 class="h5_color"><s:property value="assignmentDesc" /></h5>

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
																		<%-- <h5 class="line_h16">
																			<s:property value="assignmentDesc" />
																		</h5> --%>

																		<s:if test="resourceList !=null">
																			<s:iterator value="resourceList">
																				<%-- <iframe width="500" height="290" src="<s:property value="resourceUrl" />" frameborder="0" allowfullscreen></iframe> --%>
																				<video id="vide-1" width="500" height="290"
																					controls="" poster="">
																					<source src='<s:property value="resourceUrl" />'
																						type="video/mp4">
													  
																				</video>
																			</s:iterator>
																		</s:if>
																	</div>
																</div>
															</div>
														</div>
														<div id="blocks-profile-1" class="tab-pane">
															Adipisci commodi consequuntur ducimus enim est, et
															facilis nostrum nulla officiis pariatur quasi reiciendis,
															sed sunt. Accusantium aut autem consequatur cupiditate
															delectus dolore dolorem doloribus ducimus ex harum, illo
															impedit ipsa iusto maiores, minus nesciunt, perspiciatis
															placeat quae quibusdam quis repellat repudiandae rerum
															sed sequi suscipit temporibus veniam vitae. Alias debitis
															earum incidunt nostrum veniam, voluptas. A consequatur
															consequuntur distinctio dolores ex excepturi id, iusto
															maxime numquam quae qui unde voluptates! Accusamus ad
															aut, blanditiis debitis deleniti eius eum facere ipsam
															laboriosam laborum magnam nesciunt odio quas repellendus
															rerum sequi, sit. Architecto ex hic necessitatibus,
															officia perferendis quae quidem sapiente.</div>
														<div id="blocks-messages-1" class="tab-pane">Ab
															accusamus aperiam consequatur ducimus ea eos est, non
															omnis porro possimus praesentium, provident quam
															quibusdam quidem quo suscipit voluptate? Aperiam, dolorum
															eaque labore natus placeat sint totam. Cupiditate eos
															explicabo fugiat labore natus officia quidem sed ullam
															veniam voluptatibus. Consequatur, ducimus id, iste modi
															nesciunt nostrum obcaecati odit porro quaerat quibusdam
															quisquam, sequi similique vero. Adipisci aliquid at aut
															culpa cumque distinctio earum esse eveniet excepturi
															exercitationem harum illum in iste laudantium mollitia,
															nulla numquam perferendis perspiciatis porro qui, quo
															quod ratione similique suscipit temporibus ullam voluptas
															voluptates! Aperiam atque dolor excepturi illum in,
															magnam nemo quidem tempora vitae.</div>
														<div id="blocks-settings-1" class="tab-pane">
															Aliquam distinctio eligendi eos iure maiores molestiae
															praesentium. Aliquam aliquid architecto at blanditiis
															dignissimos doloremque esse et eveniet ex excepturi
															expedita ipsam itaque iusto minima nisi nobis, numquam,
															odit omnis quae quaerat quas quisquam ratione sapiente,
															sint sit suscipit voluptas! Illum libero tempora velit.
															Accusamus animi aut beatae cupiditate dignissimos dolore
															eligendi exercitationem id maiores maxime necessitatibus,
															nisi non omnis quis quos reiciendis repellat vel. Aperiam
															asperiores at aut blanditiis consequatur consequuntur
															cumque ex exercitationem explicabo fuga impedit incidunt
															ipsam iusto libero minus nostrum nulla obcaecati omnis
															optio provident quae quaerat, quia quibusdam reiciendis
															sed, sunt tenetur? Hic tempora, vel!</div>
													</div>
													<!-- // END Panes -->

												</div>
											</div>


										</div>
										<!-- Modules ends-->

										<div class="item col-xs-12 col-sm-12 col-md-12 col-lg-4">
											<div class="col-lg-12 col-sm-6 col-md-6 col-xs-12">
												<div class="panel panel-default paper-shadow" data-z="0.5"
													data-hover-z="1" data-animated="">
													 <div class="panel-heading">
                            <h5 class="h5_color">Module Information</h5>
													</div>
													<div class="panel-body">
														<p class="text-caption">
															Course :
															<s:property value="#parent.courseName" />
															<br> Module :
															<s:property value="#child.moduleName" />
															<br>
															<%--   <s:if test="#child.timeDuration !=null">  --%>
															<!-- <i data-toggle="tooltip" title="" class="fa fa-clock-o fa-fw" data-original-title="Time duration"></i> -->
															<%-- Module Duration :&nbsp; ${moduleDetail.timeDuration} days &nbsp;<br></s:if> --%>
															<s:if test="#child.startedOn !=null">
																<!-- <i data-toggle="tooltip" title="" class="fa fa-calendar fa-fw" data-original-title="Start Date"></i> -->Scheduled Start :&nbsp; <s:property
																	value="#child.startedOn" />  &nbsp;<br>
															</s:if>
															<s:if test="#child.completedOn !=null">
																<!-- <i data-toggle="tooltip" title="" class="fa fa-calendar fa-fw" data-original-title="Complete Date"></i> -->Scheduled End : &nbsp; <s:property
																	value="#child.completedOn" />
															</s:if>
															<!-- <br>
										<!-- <i data-toggle="tooltip" title="" class="fa fa-user fa-fw" data-original-title="Author"></i> Adrian Demian
										<br> -->

														</p>
													</div>
													<hr class="margin-none">


												</div>
											</div>

											<div class="col-lg-12 col-sm-6 col-md-6 col-xs-12">
												<div class="panel panel-default paper-shadow" data-z="0.5"
													data-hover-z="1" data-animated="">
													 <div class="panel-heading">
                            								<h5 class="h5_color">Assignment Details</h5>
													</div>
													<div class="panel-body">

														<div
															class="expandable expandable-indicator-white expandable-trigger">
															<div class="expandable-content">
																<!-- <i data-toggle="tooltip" title="" class="fa fa-calendar fa-fw" data-original-title="Last date of submission"></i> -->
																Submitted On :&nbsp;
																<s:property value="assignmentSubmittedDate" />
																<br>
																<!-- <i data-toggle="tooltip" title="" class="fa fa-calendar fa-fw" data-original-title="Last date of submission"></i> -->
																Due Date :&nbsp;
																<s:property value="assignmentDueDate" />
																<br>

																<h5>
																	<s:property value="assignmentDesc" />
																</h5>
																<div class="expandable-indicator">
																	<i></i>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											
											
											
											 <!-- Start  -->
											
											<%-- <div class="col-lg-12 col-sm-6 col-md-6 col-xs-12">
												<div class="panel panel-default paper-shadow" data-z="0.5" data-hover-z="1" data-animated="">
													 <div class="panel-heading">
													<h5 class="h5_color">Review Assignment</h5>
													</div>
													<div class="panel-body pad_l14">
														<h5> <strong>Accuracy </strong>: Excellent</h5>
														<h5> <strong>Ingenuity </strong>: Need More Work</h5>
														<h5> <strong>Timely Submission </strong>: On Time</h5>
														
													</div>
													<hr class="margin-none">


												</div>
											</div> --%>
											
											
											 <!-- End  -->
											 
											 
											 
											 
											  <!-- Start  -->
											 
											 
											 <div class="col-lg-12 col-sm-6 col-md-6 col-xs-12">
												<div class="panel panel-default paper-shadow" data-z="0.5" data-hover-z="1" data-animated="">
													 <div class="panel-heading">
													<h5 class="h5_color">Review Assignment</h5>
													</div>
													<div class="panel-body">
														<select class="form-control panel-default bgsize pad_6" name="classId">
															 <option value="0">Accuracy</option>
														</select>
														</br>
														
														<select class="form-control panel-default bgsize pad_6" name="classId">
															 <option value="0">Ingenuity</option>
														</select>
														</br>
														
														<select class="form-control panel-default bgsize pad_6" name="classId">
															 <option value="0">Timely Submission</option>
														</select>
														</br>
														<a href="#" class="btn-pad normalbutton btn-height">Submit</a>
														
														
													</div>
													<hr class="margin-none">


												</div>
											</div>
											 
											 
											 
											  <!-- End  -->
											 
											 
											 
											
											
										</div>

									</div>

								</s:iterator>
							</s:iterator>
						</s:if>

					</s:iterator>
				</s:if>
				<s:else>
					<div class="panel panel-default curriculum paper-shadow"
						data-z="0.5">
						<div class="panel-heading">
							<div class="media">
								<div class="media-body">
									<div class="col-md-12">
										<p align="center">
											<span> No Data Found </span>
										</p>
									</div>

								</div>
							</div>
						</div>
					</div>

				</s:else>


			</div>
			<!-- Recent Updates Jsp Included -->
			<s:include value="TeacherResourseRecentUpdates.jsp"/>
			<!-- Recent Updates Jsp Included -->
		</div>
	</div>
