<%@ taglib prefix="s" uri="/struts-tags"%>

<s:if test="courseListDetails!= null && courseListDetails.size()>0">
	<s:iterator value="courseListDetails" var="courseDtl">

		<div class="panel panel-default botm-none curriculum paper-shadow" data-z="0.5"
			style="padding: 0px;margin-top: -18px;">
			<div class="panel-heading panel-collapse-trigger collapsed pad-0"
				data-toggle="collapse"
				data-target="#<s:property value="#courseDtl.schoolId"/>-<s:property value="#courseDtl.classId"/>-<s:property value="#courseDtl.homeRoomId"/>-<s:property value="#courseDtl.courseId"/>"
				aria-expanded="false">
				<div class="media">
					<div class="media-body">
						<div class="col-sm-3 col-xs-3 center">
							<p class="col-sm-12 col-xs-12">
								<i class="ass_font fa fa-fw fa-mortar-board"></i>
							</p>
							<h5 class="col-sm-12 col-xs-12 txt-8px" >
								<s:property value="courseName" />
							</h5>
						</div>

						<div class="col-sm-2 col-xs-2 center">
							<p class="col-sm-12 col-xs-12 ass_font"><s:property value="totalStudent"/></p>
							<h5 class="col-sm-12 col-xs-12 txt-8px">Students</h5>
						</div>
						<div class="col-sm-2 col-xs-2 center">
							<p class="col-sm-12 col-xs-12 ass_font"><s:property value="reviewPending"/></p>
							<h5 class="col-sm-12 col-xs-12 txt-8px">Reviews Pending</h5>
						</div>
						<div class="col-sm-2 col-xs-2 center">
							<p class="col-sm-12 col-xs-12 ass_font"><s:property value="assignPending"/></p>
							<h5 class="col-sm-12 col-xs-12 txt-8px">Assignments Pending</h5>
						</div>

						<div class="col-sm-2  col-xs-2 center">
							<div class="progress_n2" style="margin-left: 0px;">
								<span class="progress-val_n2"> <s:property
										value="completedPerStatus" />%</span> <span class="progress-bar_n2"><span
									class="progress-in_n2"
									style="width:<s:property value="completedPerStatus"/>%;"></span>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="list-group collapse"
				id="<s:property value="#courseDtl.schoolId"/>-<s:property value="#courseDtl.classId"/>-<s:property value="#courseDtl.homeRoomId"/>-<s:property value="#courseDtl.courseId"/>"
				aria-expanded="false" style="height: 0px;">


				<div class="panel panel-default botm-none curriculum paper-shadow"
					data-z="0.5">
					<div class="panel-heading panel-collapse-trigger collapsed"
						data-toggle="collapse"
						data-target="#<s:property value="#courseDtl.schoolId"/>--<s:property value="#courseDtl.classId"/>--<s:property value="#courseDtl.homeRoomId"/>--<s:property value="#courseDtl.courseId"/>"
						aria-expanded="false">
						<h5>
							<s:property value="#courseDtl.className" />
							->
							<s:property value="#courseDtl.homeRoomName" />
						</h5>
					</div>

					<div class="list-group collapse"
						id="<s:property value="#courseDtl.schoolId"/>--<s:property value="#courseDtl.classId"/>--<s:property value="#courseDtl.homeRoomId"/>--<s:property value="#courseDtl.courseId"/>"
						aria-expanded="false" style="height: 0px;">

						<s:if test="modulesList!=null && modulesList.size()>0">
							<s:iterator value="modulesList" var="module">

								<div class="panel panel-default botm-none  curriculum paper-shadow"
									data-z="0.5">
									<div class="panel-heading panel-collapse-trigger collapsed pad-0"
										data-toggle="collapse"
										data-target="#<s:property value="#courseDtl.schoolId"/>--<s:property value="#courseDtl.classId"/>--<s:property value="#courseDtl.homeRoomId"/>--<s:property value="#courseDtl.courseId"/>--<s:property value="#module.moduleId"/>"
										aria-expanded="false">
										<div class="media">
											<div class="media-body">

												<div class="col-sm-3 col-xs-3 center">
													<i class="ass_font fa fa-fw fa-book"></i><br>
													<h5 class="col-sm-12 col-xs-12 txt-8px">
														<s:property value="#module.moduleName" />
													</h5>
												</div>
												<div class="col-sm-4 col-xs-4 center"></div>
												<div class="col-sm-2 col-xs-2 center"></div>
												<div class="col-sm-2  col-xs-2 ">
													<div class="progress_n2" style="margin-left: 0px;">
														<span class="progress-val_n2"><s:property
																value="#module.completedPerStatus" />%</span> <span
															class="progress-bar_n2"><span
															class="progress-in_n2"
															style="width:<s:property value="#module.completedPerStatus"/>%;"></span>
														</span>
													</div>
												</div>
											</div>

										</div>
									</div>
									
									<div class="list-group collapse"
												id="<s:property value="#courseDtl.schoolId"/>--<s:property value="#courseDtl.classId"/>--<s:property value="#courseDtl.homeRoomId"/>--<s:property value="#courseDtl.courseId"/>--<s:property value="#module.moduleId"/>"
												aria-expanded="false" style="height: 0px;">
									<s:if test="assignmentList!=null && assignmentList.size()>0">
										<s:iterator value="assignmentList" var="assignment">
											


												<div class="panel panel-default botm-none  curriculum paper-shadow"
													data-z="0.5">
													<div class="panel-heading panel-collapse-trigger collapsed pad-0"
														data-toggle="collapse"
														data-target="#<s:property value="#courseDtl.schoolId"/>--<s:property value="#courseDtl.classId"/>--<s:property value="#courseDtl.homeRoomId"/>-<s:property value="#module.moduleId"/>-<s:property value="#courseDtl.courseId"/>-<s:property value="#assignment.assignmentId"/>"
														aria-expanded="false">
														<div class="media">
															<div class="media-body">
																<div class="col-sm-2 col-xs-2 center"></div>
																<div class="col-sm-3 col-xs-3 center">
																	<i class="ass_font fa fa-fw  fa-pencil-square-o"></i><br>
																	<h5 class="col-sm-12 col-xs-12 txt-8px">
																		<s:property value="assignmentName" />
																	</h5>
																</div>
																<div class="col-sm-4 col-xs-4 center"></div>
																<div class="col-sm-2  col-xs-2 ">
																	<div class="progress_n2" style="margin-left: 0px;">
																		<span class="progress-val_n2"><s:property
																				value="#module.assignmentsunmittedPercent" />%</span> <span
																			class="progress-bar_n2"><span
																			class="progress-in_n2"
																			style="width:<s:property value="#module.assignmentsunmittedPercent"/>%;"></span>
																		</span>
																	</div>
																</div>
															</div>
															</div>
														</div>

														<div class="list-group collapse"
															id="<s:property value="#courseDtl.schoolId"/>--<s:property value="#courseDtl.classId"/>--<s:property value="#courseDtl.homeRoomId"/>-<s:property value="#module.moduleId"/>-<s:property value="#courseDtl.courseId"/>-<s:property value="#assignment.assignmentId"/>"
															aria-expanded="false" style="height: 0px;">
															<div class="tabbable tabs-primary">
																<!-- Tabs -->
																<ul class="nav nav-tabs" tabindex="2"
																	style="overflow: hidden; outline: none;">
																	<li class="active"><a
																		href="#color-home-<s:property value="#courseDtl.schoolId"/>--<s:property value="#courseDtl.classId"/>--<s:property value="#courseDtl.homeRoomId"/>-<s:property value="#module.moduleId"/>-<s:property value="#courseDtl.courseId"/>-<s:property value="#assignment.assignmentId"/>"
																		data-toggle="tab" aria-expanded="true"><i
																			class="fa fa-fw fa-check-square-o"></i> Submitted</a></li>
																	<li class=""><a
																		href="#color-profile-<s:property value="#courseDtl.schoolId"/>--<s:property value="#courseDtl.classId"/>--<s:property value="#courseDtl.homeRoomId"/>-<s:property value="#module.moduleId"/>-<s:property value="#courseDtl.courseId"/>-<s:property value="#assignment.assignmentId"/>"
																		data-toggle="tab" aria-expanded="false"><i
																			class="fa fa-fw fa-exclamation-triangle"></i>
																			Not-Submitted</a></li>

																</ul>
																<!-- // END Tabs -->
																<!-- Panes -->
																<div class="tab-content">

																	<div
																		id="color-home-<s:property value="#courseDtl.schoolId"/>--<s:property value="#courseDtl.classId"/>--<s:property value="#courseDtl.homeRoomId"/>-<s:property value="#module.moduleId"/>-<s:property value="#courseDtl.courseId"/>-<s:property value="#assignment.assignmentId"/>"
																		class="tab-pane active">
																		<div class="table-responsive">
																			<table class="table v-middle table-bordered"
																				id="table_even">
																				<thead>
																					<tr>
																						<th width="5%">S.no</th>
																						<th width="60%">Student Name</th>
																						<th width="20%">Submission Date</th>
																						<!--  <th>Review Status</th> -->
																						<th width="15%">Action</th>
																					</tr>
																				</thead>
																				<tbody id="responsive-table-body">
																					<s:if
																						test="studentList!= null && studentList.size()>0">
																						<s:iterator value="studentList" status="counter">
																							<s:if
																								test="assignmentStatus==2 || assignmentStatus==3">
																								<tr>
																									<td><span class="label"
																										style="background-color: rgb(194, 194, 194);">
																										<s:property	value="%{#counter.index+1}" /> </span></td>
																									<td><s:property value="studentName" />
																									</td>
																									<td><s:property
																											value="assignmentSubmittedDate" /></td>
																									<!--  <td>Yes</td> -->
																									<s:if test="assignmentStatus==2">
																										<td class="text-center"><a
																											href="javaScript:;" style="float: left;"
																											onclick="studentAssignmentViewDetail('<s:property value="#courseDtl.schoolId" />','<s:property value="#courseDtl.classId" />','<s:property value="#courseDtl.HomeRoomId" />','<s:property value="#courseDtl.courseId" />','<s:property value="#module.moduleId" />','<s:property value="assignmentSubmittedById" />');"
																											class="btn-pad normalbutton btn-height"
																											data-toggle="tooltip" data-placement="top"
																											title="View his assignment">View</a>
																										</td>
																									</s:if>

																									<s:if test="assignmentStatus==3">
																										<td class="text-center"><a
																											href="javaScript:;" style="float: left;"
																											onclick="studentAssignmentViewDetail('<s:property value="#courseDtl.schoolId" />','<s:property value="#courseDtl.classId" />','<s:property value="#courseDtl.HomeRoomId" />','<s:property value="#courseDtl.courseId" />','<s:property value="#module.moduleId" />','<s:property value="assignmentSubmittedById" />');"
																											class="btn-pad normalbutton btn-height"
																											data-toggle="tooltip" data-placement="top"
																											title="View his assignment"><i
																												class="fa fa-fw fa-check-square-o"></i>View</a>
																										</td>
																									</s:if>

																								</tr>
																							</s:if>
																						</s:iterator>
																					</s:if>


																				</tbody>
																			</table>
																		</div>
																	</div>
																	<div
																		id="color-profile-<s:property value="#courseDtl.schoolId"/>--<s:property value="#courseDtl.classId"/>--<s:property value="#courseDtl.homeRoomId"/>-<s:property value="#module.moduleId"/>-<s:property value="#courseDtl.courseId"/>-<s:property value="#assignment.assignmentId"/>"
																		class="tab-pane">
																		<div class="table-responsive">
																			<table class="table v-middle table-bordered"
																				id="table_even">
																				<thead>
																					<tr>
																						<th width="5%">S.no</th>
																						<th width="95%">Student Name</th>

																						<!--  <th class="text-center">Action</th> -->
																					</tr>
																				</thead>
																				<tbody id="responsive-table-body">

																					<s:iterator value="studentList" status="counterNo">
																						<s:if test="assignmentStatus==1">

																							<tr>
																								<td><span class="label"
																									style="background-color: rgb(194, 194, 194);">
																										<s:property	value="%{#counterNo.index+1}" /> </span></td>
																								<td><s:property value="studentName" />
																								</td>
																							</tr>

																						</s:if>
																					</s:iterator>

																				</tbody>
																			</table>
																		</div>
																	</div>
																	<!-- ends tabs-->
																</div>
															</div>
														
													 
											</div>
									</div>

										</s:iterator>

									</s:if>
									</div>
									
									</div>
							</s:iterator>
						</s:if>
						<s:else>
							<div class="list-group collapse"
								id="<s:property value="#courseDtl.schoolId"/>--<s:property value="#courseDtl.classId"/>--<s:property value="#courseDtl.homeRoomId"/>--<s:property value="#courseDtl.courseId"/>--<s:property value="#module.moduleId"/>"
								aria-expanded="false" style="height: 0px;">
								<h4 align="center">THERE IS NO ASSIGNMENT</h4>

							</div>
						</s:else>
					</div>
				</div>
			</div>
		</div>
	</s:iterator>
</s:if>





<%-- 
<s:else>
	<div class="panel panel-default botm-none  curriculum paper-shadow" data-z="0.5">
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

 --%>