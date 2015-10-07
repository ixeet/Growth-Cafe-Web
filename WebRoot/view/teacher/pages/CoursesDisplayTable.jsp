<%@ taglib prefix="s" uri="/struts-tags"%>
<s:if test="courseReportList!=null  && courseReportList.size()!=0">
	<s:iterator value="courseReportList" var="schoolparent">
		<div class="panel panel-default botm-none curriculum paper-shadow"
			data-z="0.5" style="padding: 0px;margin-top: -18px;">
			<div class="panel-heading panel-collapse-trigger collapsed pad-0"
				data-toggle="collapse"
				data-target="#<s:property value="#schoolparent.schoolId"/>-"
				aria-expanded="false">
				<div class="media">
					<div class="media-body">

						<div class="col-sm-3 col-xs-3 center">
							<p class="col-sm-12 col-xs-12">
								<i class="ass_font fa fa-fw fa-mortar-board"></i>
							</p>
							<h5 class="col-sm-12 col-xs-12 txt-8px">
								<s:property value="schoolName" />
							</h5>
						</div>

						<div class="col-sm-2 col-xs-2 center">
							<p class="col-sm-12 col-xs-12 ass_font">
								<s:property value="departSize" />
							</p>
							<h5 class="col-sm-12 col-xs-12 txt-8px">Departments</h5>
						</div>
						<div class="col-sm-2 col-xs-2 center">
							<p class="col-sm-12 col-xs-12 ass_font">
								<s:property value="homeRoomSize" />
							</p>
							<h5 class="col-sm-12 col-xs-12 txt-8px">Groups</h5>
						</div>
						<div class="col-sm-3 col-xs-3 center">
							<p class="col-sm-12 col-xs-12 ass_font">
								<s:property value="courseSize" />
							</p>
							<h5 class="col-sm-12 col-xs-12 txt-8px">Courses</h5>
						</div>

						<div class="col-sm-2  col-xs-2 center">
												<div class="progress_n2" style="margin-left: 0px;">
													<span class="progress-val_n2"> <s:property value="completedPerStatus" />%</span> <span
														class="progress-bar_n2"><span 	class="progress-in_n2"
														style="width:<s:property value="completedPerStatus"/>%;"></span>
													</span>
												</div>
						
						
						
							<%-- <div class="progress_n2" style="margin-left: 0px;">
								<span class="progress-val_n2"> <s:property value="completedPerStatus"/>%</span> <span class="progress-bar_n2"><span
									class="progress-in_n2"
									style="width:<s:property value="completedPerStatus"/>%;"></span>
								</span>
							</div> --%>
						</div>
					</div>
				</div>
			</div>


			<div class="list-group collapse" id="<s:property value="#schoolparent.schoolId"/>-" aria-expanded="false" style="height: 0px;">
				<s:if test="homeRoomList!=null && homeRoomList.size()>0">
					<s:iterator value="homeRoomList" var="homelist">
						<div class="panel panel-default botm-none curriculum paper-shadow" data-z="0.5">
							<div class="panel-heading panel-collapse-trigger collapsed" data-toggle="collapse"
								data-target="#<s:property value="#schoolparent.schoolId"/>--<s:property value="#homelist.homeRoomId"/>" aria-expanded="false">
								<h5>
									<s:property value="#homelist.className" />
									->
									<s:property value="#homelist.homeRoomName" />
								</h5>
							</div>
							<div class="list-group collapse"
								id="<s:property value="#schoolparent.schoolId"/>--<s:property value="#homelist.homeRoomId"/>" 	aria-expanded="false" style="height: 0px;">
								 
									
									<s:if test="courseList!=null && courseList.size()>0">
											<s:iterator value="courseList" var="coulist">
											<div class="panel panel-default botm-none curriculum paper-shadow" data-z="0.5">
											<div class="panel-heading panel-collapse-trigger collapsed pad-0" data-toggle="collapse"
								 					data-target="#<s:property value="#schoolparent.schoolId"/>--<s:property value="#homelist.homeRoomId"/>-<s:property value="#coulist.courseId"/>" aria-expanded="false">
									<div class="media">
										<div class="media-body">
											<div class="col-sm-3 col-xs-3 center">
												<p class="col-sm-12 col-xs-12">
													<i class="ass_font fa fa-fw fa-mortar-board"></i>
												</p>
												<h5 class="col-sm-12 col-xs-12 txt-8px">
													<s:property value="#coulist.courseName" />
												</h5>
											</div>
											<div class="col-sm-2  col-xs-2 center">
												<div class="progress_n2" style="margin-left: 0px;">
													<span class="progress-val_n2"> <s:property
															value="completedPerStatus" />%</span> <span
														class="progress-bar_n2"><span
														class="progress-in_n2"
														style="width:<s:property value="completedPerStatus"/>%;"></span>
													</span>
												</div>
											</div>
										</div>
									</div>
									</div>
									
									<div class="panel panel-default botm-none curriculum paper-shadow" data-z="0.5">
								<div class="list-group collapse"
												id="<s:property value="#schoolparent.schoolId"/>--<s:property value="#homelist.homeRoomId"/>-<s:property value="#coulist.courseId"/>" 	aria-expanded="false" style="height: 0px;">
												
									<s:if test="modulesList != null && modulesList.size()>0">
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
													<td class="td_link" onclick="viewDetail('<s:property value="#coulist.courseId" />','<s:property value="moduleId" />','<s:property value="#schoolparent.schoolId"/>','<s:property value="#homelist.classId"/>','<s:property value="#homelist.homeRoomId"/>')"> <a href="javaScript:;" ><s:property value="#child.moduleName" /></a></td>
													<td><s:property value="resourceSize" /></td>
													<td>
															<s:if test="completedPerStatus < 0">
																 
															<div class="progress_n">
														    <span class="progress-val_n"><s:property value="completedPerStatus"/>%</span>
														    <span class="progress-bar_n"><span class="progress-in_n" style="width:<s:property value="completedPerStatus"/>%;"></span></span>
														  </div>
															</s:if>

															<s:elseif test="completedPerStatus == 100">
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
																
																 
															</s:elseif>

													</td>
													<td class="text-right"><s:if test="moduleStatuId!=1">
															
															<a href="javaScript:;"
																onclick="viewDetail('<s:property value="#coulist.courseId" />','<s:property value="moduleId" />','<s:property value="#schoolparent.schoolId"/>','<s:property value="#homelist.classId"/>','<s:property value="#homelist.homeRoomId"/>')"
																class="btn-pad normalbutton btn-height" data-toggle="tooltip"
																data-placement="top" title="View this module">View</a>
																
															 
																<button onclick="changeStatusDetail(event)"
																class="btn-pad normalbutton btn-height" data-toggle="tooltip" value="<s:property value='ModuleSessionId'/>"
																data-placement="top" style="float:left;" title="Complete this module">Complete</button>
																
																
														</s:if> <s:elseif test="moduleStatuId==2">
															<a href="javaScript:;"
																onclick="changeStatusDetail('<s:property value='ModuleSessionId'/>','<s:property value='moduleStatuId'/>')"
																class="btn btn-success btn-xs" data-toggle="tooltip"
																data-placement="top" title="Start this module">Start</a>
															<a href="javaScript:;"
																onclick="viewDetail('<s:property value="#coulist.courseId" />','<s:property value="moduleId" />','<s:property value="#schoolparent.schoolId"/>','<s:property value="#homelist.classId"/>','<s:property value="#homelist.homeRoomId"/>')"
																class="btn btn-danger btn-xs" data-toggle="tooltip"
																data-placement="top" title="View this module">View</a>
														</s:elseif>
													</td>
												</tr>
											</s:iterator>
										</s:if>
									</tbody>
								</table>
							</div>
									</s:if>
								</div>
								</div>
									
									
									</div>
									</s:iterator>
									</s:if>
									
									
								
								
							</div>
						</div>
					</s:iterator>
				</s:if>
			</div>

		</div>
	</s:iterator>
</s:if>
<%-- 
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
 --%>