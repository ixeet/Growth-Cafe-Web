<%@ taglib prefix="s" uri="/struts-tags"%>

<script type="text/javascript">

var eventStatus=true;
 $(function () {
             var $win = $(window);
			var lastScrollTop = 0;
             $win.scroll(function (event) {
             jQuery.support.cors = true;
                 var st = $win.scrollTop();
  				 if (st > lastScrollTop){
                 if ($win.height() + $win.scrollTop()
                                > Math.round(($(document).height()*.9)) && eventStatus) {
                                $("#paginationContentId").append("<img src='view/helper/images/animatedLoading.gif' style='margin-left: 50%; width:100px;height:120px;' alt='loading please wait' id='loadingUpdateImgId'>");
                                eventStatus=false;
                                $.ajax({
									url : "paginationNotification",
									data :{"offset":1},
									type: "POST",
									beforeSend :function(){
									},
									success : function(result){
									$("#noMoreUpdateDivId").remove();
										$("#paginationContentId").append(result);
										$("#loadingUpdateImgId").remove();
										eventStatus=true;
									},
						        });
                 }
                }
                lastScrollTop = st;
             });
             
         });


function getModules(courseId){
	window.location="getModules?courseId="+courseId;
}

function moduleDescription(moduleId,courseId){
	window.location="moduleDescription?moduleId="+moduleId+"&courseId="+courseId;
	}

</script>

    
    
    <div class="container margin_topm22">
        <div class="page-section">
            <div class="row">
            
             <div class="col-xs-12 col-md-7 col-lg-7">
              <div class="row" data-toggle="isotope">
             <s:iterator value="feedList">
             
              <div class="col-xs-12 col-md-12 col-lg-12"  style='cursor: pointer; cursor: hand;' onclick="getNotificationDetail(<s:property value="feedId"/>);">
				
                <div class="timeline-block">
                  <div class="panel panel-default " style="padding: 8px;">

                    <div class="panel-heading">
                      <div class="media">
                        <div class="media-left">
                          <a  href="javaScript:;" onclick="personalProfile(${user.userId});">
                          	<s:if test="user.profilePhotoFileName !=null && user.profilePhotoFileName!=''">
                            <img src='<s:property value="user.profilePhotoFileName" />' class="media-object width-50 height-50">
                            </s:if>
                            <s:else>
                            	<img src='view/helper/images/people/50/guy-6.jpg' class="media-object width-50 height-50">
                            </s:else>
                          </a>
                        </div>
                        <div class="media-body">
						
                            <span><h6 class=" color_blue bold link-text-color"> <s:text name="feedTextPost"/> </h6>&nbsp;</span>
							<br><i><s:property value="feedOn" /> </i>
                        </div>
                      </div>
                    </div>
                </div>
				</div>
              </div>
                </s:iterator>
              
              </div>
              <div class="row" data-toggle="isotope">
              <div  id="paginationContentId">
              	
              	</div>
              	</div>
              </div>
              
            
			<!-- update course started -->
			<div class="col-xs-12 col-md-5 col-lg-5">
			 <div class="row update_row1" data-toggle="isotope">
			<div class="col-xs-12 col-md-12 col-lg-12">
                    <div class="panel panel-default" data-toggle="panel-collapse" data-open="true">
                        <div class="panel-heading panel-collapse-trigger pad_modal">
                            <h5 class="h5_color">Courses</h5>
                        </div>
                        <div class="panel-body list-group pad_0">
                           <ul class="list-group relative paper-shadow" data-hover-z="0.5" data-animated>
                           <s:if test="#session.courseList != null && #session.courseList.size()>3">
                           		<s:iterator value="#session.courseList" begin="0" end="2">
                                    <li class="list-group-item paper-shadow">
                                        <div class="media v-middle">
												<div class="left width_60p">
													<a href="javaScript:;" onclick="getModules(<s:property value="courseId"/>)">
													<h6 class=" color_blue bold link-text-color"><s:property value="courseName"/></h6></a>
													</div>
												<s:if test="completedPerStatus == 100">
												<div class="right">
												<div class="progress_n">
														    <span class="progress-val_n"><s:property value="completedPerStatus"/>%</span>
														    <span class="progress-bar_n"><span class="progress-in_n" style="width:<s:property value="completedPerStatus"/>%;"></span></span>
														  </div>
														 </div>
												</s:if>
												<s:else>
													<div class="right">
														
													
													<div class="progress_n">
														    <span class="progress-val_n"><s:property value="completedPerStatus"/>%</span>
														    <span class="progress-bar_n"><span class="progress-in_n" style="width:<s:property value="completedPerStatus"/>%;"></span></span>
														  </div>
												
													</div>
												</s:else>



												
												</div>
                                       
                                    </li>
                                  </s:iterator>
                                </s:if>
                                <s:else>
                                <s:iterator value="#session.courseList">
                                    <li class="list-group-item paper-shadow">
                                        <div class="media v-middle">
												<div class="left width_60p">
													<a href="javaScript:;" onclick="getModules(<s:property value="courseId"/>)">
													<h6 class=" color_blue bold link-text-color"><s:property value="courseName"/></h6></a>
													</div>
												<s:if test="completedPerStatus == 100">
												<div class="right">
												<div class="progress_n">
														    <span class="progress-val_n"><s:property value="completedPerStatus"/>%</span>
														    <span class="progress-bar_n"><span class="progress-in_n" style="width:<s:property value="completedPerStatus"/>%;"></span></span>
														  </div>
														 </div>
												</s:if>
												<s:else>
													<div class="right">
														
													
													<div class="progress_n">
														    <span class="progress-val_n"><s:property value="completedPerStatus"/>%</span>
														    <span class="progress-bar_n"><span class="progress-in_n" style="width:<s:property value="completedPerStatus"/>%;"></span></span>
														  </div>
												
													</div>
												</s:else>



												
												</div>
                                       
                                    </li>
                                  </s:iterator>
                                </s:else>
									<li class="list-group-item paper-shadow">
                                        <div class="media v-middle">
												<a class="btn-pad normalbutton btn-height margin_bot1" href="courses" >View All</a>
                                        </div>
                                    </li>
									
                                </ul>
                        </div>
                    </div>
            </div> <!-- clsoed all course module -->
            </div>
			
			<!-- assignments started -->
			 <div class="row update_row2" data-toggle="isotope">
			<div class="col-xs-12 col-md-12 col-lg-12">
                    <div class="panel panel-default" data-toggle="panel-collapse" data-open="true">
                        <div class="panel-heading panel-collapse-trigger pad_modal">
                            <h5 class="h5_color">Assignments</h5>
                        </div>
                        <div class="panel-body list-group pad_0">
                           <ul class="list-group relative paper-shadow" data-hover-z="0.5" data-animated>
                           		<s:if test="#session.assignmentList !=null && #session.assignmentList.size()>3"  >
                           		<s:iterator value="#session.assignmentList" begin="0" end="2">
                                    <li class="list-group-item paper-shadow">
                                        <div class="media v-middle">
												<div class="width_100p margin_bot4m">
												<h5 class="line_height20 margin_tb4"><span class="">
												${assignmentName}</span> for <span class="color_blue"><a class="color_blue bold" href="javaScript:;" onclick="moduleDescription(<s:property value="moduleId"/>,<s:property value="courseId"/>)"> ${moduleName} </a> </span> -
												<span class="color_blue"><a class="color_blue bold" href="javaScript:;" onclick="getModules(<s:property value="courseId"/>)"> ${courseName}</a></span> 
												<s:if test="assignmentStatus ==1">
															is open for submission. 
														</s:if>
														<s:elseif test="assignmentStatus ==4">
															is now over due for submission. 
														</s:elseif>
														<s:elseif test="assignmentStatus ==2">
															has been submitted on &nbsp;<span class="color_black">${assignmentSubmittedDate}.</span>
														</s:elseif>
														<s:elseif test="assignmentStatus ==3">
															has been reviewed.
														</s:elseif>
												</h5>
												
												<div class="media-left width_160p">
														<s:if test="assignmentStatus ==1">
															<h5 ><span class="text-black">Status: </span>Open for submission</h5>
														</s:if>
														<s:elseif test="assignmentStatus ==4">
															<h5 class="color_red"><span class="text-black">Status: </span>Overdue</h5>
														</s:elseif>
														<s:elseif test="assignmentStatus ==2">
														<h5 class="green"><span class="text-black">Status: </span>Submitted</h5>
														</s:elseif>
														<s:elseif test="assignmentStatus ==3">
														<h5 class="green"><span class="text-black">Status: </span>Reviewed</h5>
															<!-- <h4 class="green">
																<i data-toggle="tooltip" title="Reviewed by teacher"
																	class="margin_top10 fa fa-check-square-o fa-fw"></i>Reviewed
															</h4> -->
														</s:elseif>
													</div>
													
												<div class="media-body width_330p">
												<s:if test="assignmentDueDate !=null">
												<h5 class="color_black line_height20">Due Date :
												<span class="color_black">${assignmentDueDate}</span></h5>
												</s:if>
												</div>

													<div class="media-right">
														
														<s:if test="assignmentStatus ==1">
															<a class="btn-pad normalbutton left btn-height margin_bot1" href="submitAssignment?assignmentId=<s:property value="assignmentId"/>" >Submit</a>
														</s:if>
														<s:elseif test="assignmentStatus ==4">
															<a class="btn-pad normalbutton btn-height margin_bot1" href="submitAssignment?assignmentId=<s:property value="assignmentId"/>" >Submit</a>
														</s:elseif>
														<s:elseif test="assignmentStatus ==2">
															
															<a class="btn-pad normalbutton btn-height margin_bot1" href="viewAssignment?assignmentId=<s:property value="assignmentId"/>" >View</a>
														</s:elseif>
														<s:elseif test="assignmentStatus ==3">
														<a class="btn-pad normalbutton btn-height margin_bot1" href="viewAssignment?assignmentId=<s:property value="assignmentId"/>" >View</a>
															<!-- <h4 class="green">
																<i data-toggle="tooltip" title="Reviewed by teacher"
																	class="margin_top10 fa fa-check-square-o fa-fw"></i>Reviewed
															</h4> -->
														</s:elseif>
													</div>

												</div>
												
                                        </div>
                                    </li>
                                    </s:iterator>
                                    </s:if>
                                    <s:else>
                                    <s:iterator value="#session.assignmentList">
                                    <li class="list-group-item paper-shadow">
                                        <div class="media v-middle">
												<div class="width_100p">
												<h5 class="color_black line_height20"><span class="color_blue">
												${assignmentName}</span> for <span class="color_blue"> ${moduleName}  </span> -
												<span class="color_blue"> ${courseName}</span> 
												<s:if test="assignmentStatus ==1">
															is open for submission 
														</s:if>
														<s:elseif test="assignmentStatus ==4">
															is now over due for submission 
														</s:elseif>
														<s:elseif test="assignmentStatus ==2">
															has been submitted on &nbsp;<span class="color_blue">${assignmentSubmittedDate}</span>
														</s:elseif>
														<s:elseif test="assignmentStatus ==3">
															has been reviewed.
														</s:elseif>
												</h5>
												<div class="left">
												<s:if test="assignmentDueDate !=null">
												<h5 class="color_blue line_height20">Last Submission Date :
												<span class="color_black">${assignmentDueDate}</span></h5>
												</s:if>
												</div>

													<div class="right">
														<s:if test="assignmentStatus ==1">
															<h4 class="default_color">Open for Submission</h4>
														</s:if>
														<s:elseif test="assignmentStatus ==4">
															<h4 class="color_red">Overdue</h4>
														</s:elseif>
														<s:elseif test="assignmentStatus ==2">
															<h4 class="green">Submitted</h4>
														</s:elseif>
														<s:elseif test="assignmentStatus ==3">
															<h4 class="green">
																<i data-toggle="tooltip" title="Reviewed by teacher"
																	class="margin_top10 fa fa-check-square-o fa-fw"></i>Submitted
															</h4>
														</s:elseif>
													</div>

												</div>
												
                                        </div>
                                    </li>
                                    </s:iterator>
                                    </s:else>
									
									<li class="list-group-item paper-shadow">
                                        <div class="media v-middle">
												<a class="btn-pad normalbutton btn-height" href="assignments" >View All</a>
                                        </div>
                                    </li>
									
                                </ul>
                        </div>
                    </div>
            </div> <!-- assignments closed-->
            </div>
			
            </div> 
            </div>
		</div>
	</div>