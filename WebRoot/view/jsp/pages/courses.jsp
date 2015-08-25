<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
function getModules(courseId){
	window.location="getModules?courseId="+courseId;
	/* $.ajax({
			url : "getModules",
			type :"post",
			data :{"courseId":courseId},
			beforeSend :function(){
				//showErrorMessage("looading");
			},
			success : function(data){
			$("#BodyId").html(data);
			},
        });
         */
}

</script>


<div class="parallax overflow-hidden  page-section third margin-section">
        <div class="container parallax-layer" data-opacity="true" style="opacity: 1; transform: translate3d(0px, 0px, 0px);">
            <div class="media v-middle">
                
                <div class="media-body">
                    <h3 class="text-black text-display-1 margin-v-0">Courses</h3>
                  
                </div>
               
            </div>
        </div>
    </div>

 <div class="container">
        <div class="page-section">
            <div class="row">
                <div class="col-md-9">
                    <div class="row" data-toggle="isotope">
<s:if test="coursesList != null && coursesList.size()>0">
<s:iterator value="coursesList">
<!-- course -->
<div class="item col-xs-12 col-sm-6 col-lg-4">
                            <div class="panel panel-default paper-shadow" data-z="0.5">
                                <div class="panel-heading bgcolor">
                                    <div class="media media-clearfix-xs-min v-middle">
                                        <div class="media-body text-caption text-white">
                                           <h4 class="text-white"><s:property value="courseName"/></h4>
                                        </div>
                                        
                                    </div>
                                </div>
                                <div class="panel-heading">
                                    <div class="media media-clearfix-xs-min v-middle">
                                    <s:if test="completedPerStatus == 100">
                                     <div class=" center green media-body text-caption">
                                            <h4 class="green"> Completed </h4>
                                        </div>
                                    </s:if>
                                    <s:else>
                                        <div class="media-body text-caption text-light">
                                        
                                            Module  Completed <s:property value="completedPerStatus"/> %
                                        </div>
                                        <div class="media-right">
                                            <div class="progress progress-mini width-100 margin-none">
                                                <div class="progress-bar progress-bar-blue-300" role="progressbar" aria-valuenow="<s:property value="completedPerStatus"/>" aria-valuemin="0" aria-valuemax="100" style="width:30%;">
                                                </div>
                                            </div>
                                        </div>
                                      </s:else>
                                    </div>
                                </div>
								    <div class="panel-heading">
                               <div class="media-body text-caption">
                                           <h4 class="black-text center">Modules included</h4>
										   <ul>
										   <s:if test="modulesList.size()>0">
										   <s:iterator value="modulesList">
										   	<li class="module-li"><s:property value="moduleName"/> </li>
										   </s:iterator>
										  </s:if>
										  <s:if test="modulesList.size()>0">
											<li class="module-li">And <a href="javaScript:;" onclick="getModules(<s:property value="courseId"/>)">More...</a></li>
											</s:if>
											<s:else>
				                                	<b style="text-align: center;">There is no data</b>
											
											</s:else>
											</ul>
                                        </div>
										</div>
                                        
                                <hr class="margin-none">
                                <div class="panel-body">
									
									 <h5><i data-toggle="tooltip" title="Start Date" class="fa fa-calendar fa-fw"></i><s:property value="startedOn"/></h5>
									 <s:if test="completedOn !=null">
									 <h5><i data-toggle="tooltip" title="Completed Date" class="fa fa-calendar fa-fw"></i><s:property value="completedOn"/></h5>
									 </s:if>
                                    <a style="margin-top: -41px;" class="btn-pad loginbutton btn-height btn-pad-height" data-z="0" data-hover-z="1" data-animated="" href="javaScript:;" onclick="getModules(<s:property value="courseId"/>)">Modules</a>
                                </div>
                            </div>
                        </div><!-- course ends-->
                        </s:iterator>
						</s:if>
					</div>
					</div>
					
					<!-- Courses Updates -->
					
					
					<!-- Recent Updates Jsp Included -->
              			<s:include value="recentUpdates.jsp"></s:include>
              		<!-- Recent Updates Jsp Included -->
					
					</div>
					</div>
            </div>
