<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="parallax overflow-hidden  page-section third margin-section">
        <div class="container parallax-layer" data-opacity="true" style="opacity: 1; transform: translate3d(0px, 0px, 0px);">
            <div class="media v-middle">
                
                <div class="media-body">
                    <h3 class="text-black margin-v-0">Assignments</h3>
					
                  
                </div>
               
            </div>
        </div>
    </div>
   <div class="container">
        <div class="page-section">
            <div class="row">
                <div class="col-md-9">
                    <div class="row" data-toggle="isotope">
                        <!-- Module -->
                        <s:if test="assignmentList !=null && assignmentList.size()>0">
	                        <s:iterator value="assignmentList">
							<div class="item col-xs-12 col-sm-6 col-lg-4">
	                            <div class="panel panel-default paper-shadow" data-z="0.5">
	                                <div class="panel-heading bgcolor">
	                                    <div class="media media-clearfix-xs-min v-middle">
	                                        <div class="media-body text-caption text-white">
	                                           <h4 class="text-white dotwrap"><s:property value="assignmentName"/> </h4>
	                                        </div>
	                                        
	                                    </div>
	                                </div>
	                                <div class="panel-heading">
	                                    <div class="media media-clearfix-xs-min v-middle">
	                                        <div class=" center green media-body text-caption">
	                                        	<s:if test="assignmentStatus ==1">
	                                            	<h4 class="default_color"> Open for Submission </h4>
	                                            </s:if>
	                                            <s:elseif test="assignmentStatus ==4">
	                                            	<h4 class="color_red">Overdue</h4>
	                                            </s:elseif>
	                                             <s:elseif test="assignmentStatus ==2">
	                                            	<h4 class="green"> Submitted </h4>
	                                            </s:elseif>
	                                             <s:elseif test="assignmentStatus ==3">
	                                            	 <h4 class="green"><i data-toggle="tooltip" title="Reviewed by teacher" class="margin_top10 fa fa-check-square-o fa-fw"></i>Submitted</h4>
	                                            </s:elseif>
	                                        </div>
	                                        
	                                    </div>
	                                </div>
									<div class="panel-heading">
	                                  <div class="media-body text-caption">
	                                           <h5 class="black-text"><s:property value="courseName"/> / <s:property value="moduleName"/></h5>
											  
											<div class="media v-middle">
	                                            
	                                            <div class="media-body">
	                                                <h6 class="black-text justify "><s:property value="assignmentDesc"/></h6>
	                                            </div>
	                                        </div>
											
											
									
										 </div>
								    </div>
	                                        
	                                <hr class="margin-none">
	                                <div class="panel-body">
										<s:if test="assignmentSubmittedDate !=null">
										 	<i data-toggle="tooltip" title="Submitted On" class="margin_top10 fa fa-calendar fa-fw"></i><s:property value="assignmentSubmittedDate"/><br/>
										 </s:if>
										 <s:if test="assignmentDueDate !=null">
										 <i data-toggle="tooltip" title="Last date of submission" class="margin_top10 fa fa-calendar fa-fw"></i><s:property value="assignmentDueDate"/>
										 </s:if>
										 <s:if test="assignmentStatus ==1">
	                                            	<a class="btn-pad loginbutton btn-height" style="margin-top: -9px;" data-z="0" data-hover-z="1" data-animated="" href="submitAssignment?assignmentId=<s:property value="assignmentId"/>">Submit now</a>
	                                            </s:if>
	                                            <s:elseif test="assignmentStatus ==4">
	                                            	<a class="btn-pad loginbutton btn-height" style="margin-top: -9px;" data-z="0" data-hover-z="1" data-animated="submitAssignment" href="submitAssignment?assignmentId=<s:property value="assignmentId"/>">Submit now</a>
	                                            </s:elseif>
	                                             <s:elseif test="assignmentStatus ==3">
	                                            	 <a class="btn-pad loginbutton btn-height" style="margin-top: -9px;" data-z="0" data-hover-z="1" data-animated="viewAssignment" href="viewAssignment?assignmentId=<s:property value="assignmentId"/>">View</a>
	                                            </s:elseif>
	                                             <s:elseif test="assignmentStatus ==2">
	                                            	 <a class="btn-pad loginbutton btn-height" style="margin-top: -9px;" data-z="0" data-hover-z="1" data-animated="viewAssignment" href="viewAssignment?assignmentId=<s:property value="assignmentId"/>">View</a>
	                                            </s:elseif>
	                                </div>
	                            </div>
	                        </div>
	                        </s:iterator>	
                       </s:if>
					              
                    </div>
                    
                </div>
                <!-- Recent Updates Jsp Included -->
              			<s:include value="recentUpdates.jsp"></s:include>
              <!-- Recent Updates Jsp Included -->
        </div>
        
        </div>
        </div>