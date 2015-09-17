<%@ taglib prefix="s" uri="/struts-tags"%>
<s:if test="courseReportList!=null  && courseReportList.size()!=0">
	<s:iterator value="courseReportList" var="parent">
				<div class="col-md-12" style="padding: 0px;margin-top: 8px;">
					<div class="panel panel-default curriculum paper-shadow"
						data-z="0.5"  style="margin-top: -26px;">
						<div class="panel-heading panel-collapse-trigger collapsed"
							data-toggle="collapse"
							data-target="#<s:property value="schoolId"/>-1-<s:property value="courseId"/>">
							<div class="media">
								<%-- <div class="media-left">
									<span class="icon-block img-circle half bg-green-300 text-white"><s:property
											value="completedPerStatus" />%</span>
								</div> --%>
								<%-- <div class="media-body">
									<div class="col-md-6">
										<p>
											<span class="btn default_bg btn-xs">Organization </span> <span><s:property value="schoolName" /> </span>
										</p>
									</div>
									<div class="col-md-6">
										<p>
											<span class="btn default_bg btn-xs">Department </span> <span><s:property value="className" /> </span>
										</p>
									</div>
									<div class="col-md-6">
										<p>
											<span class="btn default_bg btn-xs">Group </span> <span><s:property value="homeRoomName" /> </span>
										</p>
									</div>
									<div class="col-md-6">
										<p>
											<span class="btn default_bg btn-xs">Course Name </span> <span><s:property value="courseName" /> </span>
										</p>
									</div>
								</div> --%>
								
								<div class="media-body">
									 <p class="col-sm-2 col-xs-2 center">  <i class="fa fa-fw fa-institution"></i></br><span><s:property value="schoolName"/></span></p>
                                          <p class="col-sm-2 col-xs-2 center"> <i class="fa fa-fw fa-cubes"></i></br><span><s:property value="className"/></span></p>
										  <p class="col-sm-2 col-xs-2 center">  <i class="fa fa-fw fa-group"></i></br><span><s:property value="homeRoomName"/></span> </p>
										 <p class="col-sm-2 col-xs-2 center"> <i class="fa fa-fw fa-mortar-board"></i></br><span><s:property value="courseName"/></span></p>
										
										<div class="col-sm-4  col-xs-4">	
											<div class="progress_n2">
														    <span class="progress-val_n2"><s:property value="completedPerStatus"/>%</span>
														    <span class="progress-bar_n2"><span class="progress-in_n2" style="width:<s:property value="completedPerStatus"/>%;"></span></span>
														  </div>
										</div>
								</div>
								
							</div>

						</div>
						<div class="list-group collapse"
							id="<s:property value="schoolId"/>-1-<s:property value="courseId"/>">
							<div class="table-responsive">
								<table class="table v-middle table-bordered" id="table_even">
									<thead>
										<tr>
											<th width="5%">S.No</th>
											<th width="50%">Module Name</th>
											<th width="11%">Resources</th>
											<th width="20%">Progress</th>
											<th width="14%">Action</th>
										</tr>
									</thead>
									<tbody id="responsive-table-body">
										<s:if test="modulesList != null && modulesList.size()>0">
											<s:iterator value="modulesList" var="child" status="status">
												<tr>
													<td><span class="label" style="background-color: rgb(194, 194, 194);"><s:property value="%{#status.count}" /></span>
													</td>
													<td class="td_link" onclick="viewDetail('<s:property value="#parent.courseId" />','<s:property value="moduleId" />','<s:property value="#parent.schoolId"/>','<s:property value="#parent.classId"/>','<s:property value="#parent.homeRoomId"/>')"> <a href="javaScript:;" ><s:property value="#child.moduleName" /></a></td>
													
													
												
													<td><s:property value="resourceSize" /></td>
													<td>
															<s:if test="completedPerStatus < 0">
																<!-- <div class="progress-bar" role="progressbar"
																	aria-valuenow="100" aria-valuemin="0"
																	aria-valuemax="100" style="width: 80%;">Not Started
																</div> -->
															<div class="progress_n">
														    <span class="progress-val_n"><s:property value="completedPerStatus"/>%</span>
														    <span class="progress-bar_n"><span class="progress-in_n" style="width:<s:property value="completedPerStatus"/>%;"></span></span>
														  </div>
															</s:if>

															<s:elseif test="completedPerStatus == 100">
																<!-- <div class="progress-bar" role="progressbar"
																	aria-valuenow="100" aria-valuemin="0"
																	aria-valuemax="100" style="width: 80%;">Completed
																</div> -->
																
												<div class="progress_n">
														    <span class="progress-val_n"><s:property value="completedPerStatus"/>%</span>
														    <span class="progress-bar_n"><span class="progress-in_n" style="width:<s:property value="completedPerStatus"/>%;"></span></span>
														  </div>
															</s:elseif>

															<s:elseif
																test="completedPerStatus >= 0 && completedPerStatus<100">
																<div class="progress_n">
																 <span class="progress-val_n"><s:property value="completedPerStatus"/>%</span>
														    <span class="progress-bar_n"><span class="progress-in_n" style="width:<s:property value="completedPerStatus"/>%;"></span></span>
																
																</div>
																<%-- 
																<div class="progress-bar" role="progressbar"
																	aria-valuenow="<s:property value='completedPerStatus'/>"
																	aria-valuemin="0" aria-valuemax="100"
																	style="width: 80%;">
																	<s:property value="#child.completedPerStatus" />
																	%
																</div> --%>
															</s:elseif>

													</td>
													<td class="text-right"><s:if test="moduleStatuId!=1">
															
															<%-- <a href="javaScript:;"
																onclick="viewDetail('<s:property value="#parent.courseId" />','<s:property value="moduleId" />','<s:property value="#parent.schoolId"/>','<s:property value="#parent.classId"/>','<s:property value="#parent.homeRoomId"/>')"
																class="btn-pad normalbutton btn-height" data-toggle="tooltip"
																data-placement="top" title="View this module">View</a> --%>
																<a href="javaScript:;"
																onclick="changeStatusDetail('<s:property value='ModuleSessionId'/>','<s:property value='moduleStatuId'/>')"
																class="btn-pad normalbutton btn-height" data-toggle="tooltip"
																data-placement="top" style="float:left;" title="Complete this module">Complete</a>
														</s:if> <%-- <s:elseif test="moduleStatuId==2">
															<a href="javaScript:;"
																onclick="changeStatusDetail('<s:property value='ModuleSessionId'/>','<s:property value='moduleStatuId'/>')"
																class="btn btn-success btn-xs" data-toggle="tooltip"
																data-placement="top" title="Start this module">Start</a>
															<a href="javaScript:;"
																onclick="viewDetail('<s:property value="#parent.courseId" />','<s:property value="moduleId" />','<s:property value="#parent.schoolId"/>','<s:property value="#parent.classId"/>','<s:property value="#parent.homeRoomId"/>')"
																class="btn btn-danger btn-xs" data-toggle="tooltip"
																data-placement="top" title="View this module">View</a>
														</s:elseif> --%>
													</td>
												</tr>
											</s:iterator>
										</s:if>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
	</s:iterator>
</s:if>

<s:else>
	<div class="panel panel-default curriculum paper-shadow" data-z="0.5"  style="margin-top: 27px;">
		<div class="panel-heading">
			<div class="media">

				<div class="media-body">

					<div class="col-md-12">
						<p align="center">
							<span > No Data Found </span>
						</p>
					</div>

				</div>
			</div>
		</div>
	</div>

</s:else>
