<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="row">
	<div class="col-md-7">
		
		<div class="panel panel-default paper-shadow" data-z="0.5" data-hover-z="1" data-animated="">
                        <div class="panel-heading">
                            <h5 class="h5_color">Recent Progress Status</h5>
                        </div>
                        <s:if test="courseReportList!=null"> 
                        <s:iterator value="courseReportList">
                        <div class="panel-body">
                          <div class="media v-middle">
                                            <div class="media-left">
                                                <span class="icon-block half bg-green-300 img-circle text-white"><s:property value="completedPerStatus"/>% </span>
												<%-- <span class="center">Start Date </br> 09-2-2015</span> --%>
                                            </div>
                                            <div class="media-body">
                                          <p>  <span class="btn default_bg btn-xs">Organization </span> 
                                              <span>  <s:property value="schoolName"/></span></p>
                                              <p>  <span class="btn default_bg btn-xs">Department </span>
											 <span>	<s:property value="className"/></span></p>
												 <p>  <span class="btn default_bg btn-xs">Group </span> <span>  <s:property value="homeRoomName"/></span> </p>
												<p>  <span class="btn default_bg btn-xs">Course </span> <span>  <s:property value="courseName"/> </span></p>
												<!-- <p class="text-subhead link-text-color">Module B is in Progress</p> -->
                                            </div>
                                            
                                        </div>  
                        </div>
                        <hr class="margin-none">
                        </s:iterator>
                        </s:if>
                        
                    </div>
		
	</div>
	
	
		<div id="recentAssignmentDetailId">
		<%-- <s:include value="RecentAssignmentDetail.jsp"/> --%>
		<s:include value="teacherRecentUpdates.jsp"/>
	
	</div>
</div>