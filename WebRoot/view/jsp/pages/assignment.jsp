<%@ taglib prefix="s" uri="/struts-tags"%>

<script>

var p=$('#fog2 h6');
var divh=$('#fog2').height();
while ($(p).outerHeight()>divh) {
    $(p).text(function (index, text) {
        return text.replace(/\W*\s(\S)*$/, '...');
    });
}
</script>

<script>

var p=$('#fog3 h5');
var divh=$('#fog3').height();
while ($(p).outerHeight()>divh) {
    $(p).text(function (index, text) {
        return text.replace(/\W*\s(\S)*$/, '...');
    });
}
</script>


   <div class="container margin_topm22">
        <div class="page-section">
            <div class="row">
                <div class="col-md-9">
                    <div class="row" data-toggle="isotope">
                        <!-- Module -->
                        <s:if test="assignmentList !=null && assignmentList.size()>0">
	                        <s:iterator value="assignmentList">
							<div class="item col-xs-12 col-sm-6 col-lg-4">
	                            <div class="panel panel-default paper-shadow height_250" data-z="0.5">
	                                 <div class="panel-heading pad_modal1">
                                    <div class="media media-clearfix-xs-min v-middle">
                                        <div class="media-body text-caption text-white">
                                           <h5 class="h5_color auto_dots250"><s:property value="assignmentName"/></h5>
                                        </div>
                                        
                                    </div>
                                </div>
	                                <div class="panel-heading height_36">
	                                    <div class="media media-clearfix-xs-min v-middle">
	                                        <div class=" center green media-body text-caption">
	                                        	<s:if test="assignmentStatus ==1">
	                                            	<h6 class=" margin_top4"> Open for Submission </h6>
	                                            </s:if>
	                                            <s:elseif test="assignmentStatus ==4">
	                                            	<h6 class="color_red margin_top4">Overdue</h6>
	                                            </s:elseif>
	                                             <s:elseif test="assignmentStatus ==2">
	                                            	<h6 class="green margin_top4"> Submitted </h6>
	                                            </s:elseif>
	                                             <s:elseif test="assignmentStatus ==3">
	                                            	 <h6 class="green margin_top4"><i data-toggle="tooltip" title="Reviewed by teacher" class=" fa fa-check-square-o fa-fw"></i>Reviewed</h6>
	                                            </s:elseif>
	                                        </div>
	                                        
	                                    </div>
	                                </div>
									<div class="panel-heading height_110">
	                                  <div class="media-body text-caption">
	                                  		<div id="fog3">
	                                         <h5 class="black-text margin_all0 line_h16"><span class="default_color">Course: </span><s:property value="courseName"/> 
													<span class="default_color"><br/>Module: </span> <s:property value="moduleName"/></h5>
											  </div><br/>
											<div class="v-middle">
	                                            
	                                            <div class="media-body">
	                                             <div id="fog2">
	                                           
	                                                <h5 class="black-text margin_all0"><s:property value="assignmentDesc"/></h5>
	                                             
	                                               </div>
	                                            </div>
	                                        </div>
											
											
									
										 </div>
								    </div>
	                                        
	                                <hr class="margin-none">
	                                <div class="panel-body">
	                                <div class="media-left panel-left">
	                                	 <s:if test="assignmentDueDate !=null">
											 <!-- <i data-toggle="tooltip" title="Last date of submission" class="margin_top10 fa fa-calendar fa-fw"></i> -->Due Date :&nbsp;<s:property value="assignmentDueDate"/>
											 </s:if>
										<s:if test="assignmentSubmittedDate !=null">
										 	<!-- <i data-toggle="tooltip" title="Submitted On" class="margin_top10 fa fa-calendar fa-fw"></i> -->Submitted On :&nbsp;<s:property value="assignmentSubmittedDate"/>&nbsp;&nbsp;&nbsp;<br/>
										 </s:if>
										</div>
										<div class="media-right">
										 <s:if test="assignmentStatus ==1">
	                                            	<a class="btn-pad normalbutton btn-height margin_bot1 margin_topm10" data-z="0" data-hover-z="1" data-animated="" href="submitAssignment?assignmentId=<s:property value="assignmentId"/>">Submit</a>
	                                            </s:if>
	                                            <s:elseif test="assignmentStatus ==4">
	                                            	<a class="btn-pad normalbutton btn-height margin_bot1 margin_topm10"  data-z="0" data-hover-z="1" data-animated="submitAssignment" href="submitAssignment?assignmentId=<s:property value="assignmentId"/>">Submit</a>
	                                            </s:elseif>
	                                             <s:elseif test="assignmentStatus ==3">
	                                            	 <a class="btn-pad normalbutton btn-height margin_bot1 margin_topm10"  data-z="0" data-hover-z="1" data-animated="viewAssignment" href="viewAssignment?assignmentId=<s:property value="assignmentId"/>">View</a>
	                                            </s:elseif>
	                                             <s:elseif test="assignmentStatus ==2">
	                                            	 <a class="btn-pad normalbutton btn-height margin_bot1 margin_topm10"  data-z="0" data-hover-z="1" data-animated="viewAssignment" href="viewAssignment?assignmentId=<s:property value="assignmentId"/>">View</a>
	                                            </s:elseif>
	                                        </div>
	                                </div>
	                            </div>
	                        </div>
	                        </s:iterator>	
                       </s:if>
                       
                      
<s:else>
	<div class="panel panel-default botm-none  curriculum paper-shadow" data-z="0.5">
		<div class="panel-heading">
			<div class="media">

				<div class="media-body">

					<div class="col-md-12">
						<p align="center">There is no Assignment.
						</p>
					</div>

				</div>
			</div>
		</div>
	</div>

</s:else>
                       
					              
                    </div>
                    
                </div>
                <!-- Recent Updates Jsp Included -->
              			<s:include value="recentUpdates.jsp"></s:include>
              <!-- Recent Updates Jsp Included -->
        </div>
        
        </div>
        </div>
        
