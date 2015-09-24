<%@ taglib prefix="s" uri="/struts-tags"%>

<s:if test="courseListDetails!= null && courseListDetails.size()>0">
	<s:iterator value="courseListDetails" var="parent">
		<s:if test="modulesList!= null && modulesList.size()>0">
			<s:iterator value="modulesList" var="child">
				<s:if
					test="assignmentSubmitList!= null && assignmentSubmitList.size()>0">
					<div class="col-md-12" style="padding: 0px;margin-top: -18px;">
						<div class="panel panel-default curriculum paper-shadow"
							data-z="0.5">
							<div class="panel-heading panel-collapse-trigger collapsed"
								data-toggle="collapse"
								data-target="#<s:property value="#parent.schoolId" />-<s:property value="#parent.classId" />-<s:property value="#parent.hrmId" />-<s:property value="#parent.courseId" />-<s:property value="#child.moduleId" />">
								<div class="media">
									<div class="media-body">
										<p class="col-sm-2 col-xs-2 center">
											<i class="fa fa-fw fa-institution"></i></br>
											<span><s:property value="#parent.schoolName" />
											</span>
										</p>
										<p class="col-sm-2 col-xs-2 center">
											<i class="fa fa-fw fa-cubes"></i></br>
											<span><s:property value="#parent.className" />
											</span>
										</p>
										<p class="col-sm-2 col-xs-2 center">
											<i class="fa fa-fw fa-group"></i></br>
											<span><s:property value="#parent.homeRoomName" />
											</span>
										</p>
										<p class="col-sm-2 col-xs-2 center">
											<i class="fa fa-fw fa-mortar-board"></i></br>
											<span><s:property value="#parent.courseName" />
											</span>
										</p>
										<p class="col-sm-2 col-xs-2 center">
											<i class="fa fa-fw fa-book"></i></br>
											<span><s:property value="#child.moduleName" />
											</span>
										</p>

										<div class="col-sm-2  col-xs-2">
											<div class="progress_n2" style="margin-left: 0px;">
												<span class="progress-val_n2"><s:property
														value="#child.assignmentsunmittedPercent" />%</span> <span
													class="progress-bar_n2"><span class="progress-in_n2"
													style="width:<s:property value="#child.assignmentsunmittedPercent"/>%;"></span>
												</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="list-group collapse"
								id="<s:property value="#parent.schoolId" />-<s:property value="#parent.classId" />-<s:property value="#parent.hrmId" />-<s:property value="#parent.courseId" />-<s:property value="#child.moduleId" />">



								<div class="tabbable tabs-primary">
									<!-- Tabs -->
									<ul class="nav nav-tabs" tabindex="2"
										style="overflow: hidden; outline: none;">
										<li class="active"><a
											href="#color-home-<s:property value="#parent.schoolId" />-<s:property value="#parent.classId" />-<s:property value="#parent.hrmId" />-<s:property value="#parent.courseId" />-<s:property value="#child.moduleId" />"
											data-toggle="tab" aria-expanded="true"><i
												class="fa fa-fw fa-check-square-o"></i> Submitted</a>
										</li>
										<li class=""><a
											href="#color-profile-<s:property value="#parent.schoolId" />-<s:property value="#parent.classId" />-<s:property value="#parent.hrmId" />-<s:property value="#parent.courseId" />-<s:property value="#child.moduleId" />"
											data-toggle="tab" aria-expanded="false"><i
												class="fa fa-fw fa-exclamation-triangle"></i> Not-Submitted</a>
										</li>

									</ul>
									<!-- // END Tabs -->
									<!-- Panes -->
									<div class="tab-content">

										<div
											id="color-home-<s:property value="#parent.schoolId" />-<s:property value="#parent.classId" />-<s:property value="#parent.hrmId" />-<s:property value="#parent.courseId" />-<s:property value="#child.moduleId" />"
											class="tab-pane active">
											<div class="table-responsive">
												<table class="table v-middle table-bordered" id="table_even">
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
															test="assignmentSubmitList!= null && assignmentSubmitList.size()>0">
															<s:iterator value="assignmentSubmitList" status="counter">
																<s:if test="assignmentStatus==2">
																	<tr>
																		<td><span class="label"
																			style="background-color: rgb(194, 194, 194);"><s:property
																					value="%{#counter.index+1}" /> </span>
																		</td>
																		<td><s:property value="studentName" /></td>
																		<td><s:property value="assignmentSubmittedDate" />
																		</td>
																		<!--  <td>Yes</td> -->

																		<td class="text-center"><a href="javaScript:;"
																			style="float: left;"
																			onclick="studentAssignmentViewDetail('<s:property value="#parent.schoolId" />','<s:property value="#parent.classId" />','<s:property value="#parent.hrmId" />','<s:property value="#parent.courseId" />','<s:property value="#child.moduleId" />','<s:property value="assignmentSubmittedById" />');"
																			class="btn-pad normalbutton btn-height"
																			data-toggle="tooltip" data-placement="top"
																			title="View his assignment">View</a></td>
																	</tr>
																</s:if>
															</s:iterator>
														</s:if>


													</tbody>
												</table>
											</div>
										</div>
										<div
											id="color-profile-<s:property value="#parent.schoolId" />-<s:property value="#parent.classId" />-<s:property value="#parent.hrmId" />-<s:property value="#parent.courseId" />-<s:property value="#child.moduleId" />"
											class="tab-pane">
											<div class="table-responsive">
												<table class="table v-middle table-bordered" id="table_even">
													<thead>
														<tr>
															<th width="5%">S.no</th>
															<th width="95%">Student Name</th>

															<!--  <th class="text-center">Action</th> -->
														</tr>
													</thead>
													<tbody id="responsive-table-body">

														<s:iterator value="assigNotSubmitList" status="counter">
															<s:if test="assignmentStatus==1">

																<tr>
																	<td><span class="label"
																		style="background-color: rgb(194, 194, 194);">
																			<s:property value="%{#counter.index+1}" /> </span>
																	</td>
																	<td><s:property value="studentName" /></td>
																</tr>

															</s:if>
														</s:iterator>

													</tbody>
												</table>
											</div>
										</div>

									</div>
									<!-- // END Panes -->
								</div>
							</div>
						</div>
					</div>
				</s:if>
			</s:iterator>
		</s:if>
	</s:iterator>
</s:if>

<s:else>
	<div class="panel panel-default curriculum paper-shadow" data-z="0.5">
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

