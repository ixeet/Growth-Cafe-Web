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


 <div class="container margin_topm22">
        <div class="page-section">
            <div class="row">
                <div class="col-md-9">
                    <div class="row" data-toggle="isotope">
<s:if test="coursesList != null && coursesList.size()>0">
<s:iterator value="coursesList">
<!-- course -->
<div class="item col-xs-12 col-sm-6 col-lg-4">
                            <div class="panel panel-default paper-shadow height_250" data-z="0.5">
                                <div class="panel-heading pad_modal1">
                                    <div class="media media-clearfix-xs-min v-middle">
                                        <div class="media-body text-caption text-white">
                                           <h5 class="h5_color auto_dots250"><s:property value="courseName"/></h5>
                                        </div>
                                        
                                    </div>
                                </div>
                                <div class="panel-heading height_36">
                                    <div class="">
                                    <div class="progress_n1">
														    <span class="progress-val_n1"><s:property value="completedPerStatus"/>%</span>
														    <span class="progress-bar_n1"><span class="progress-in_n1" style="width:<s:property value="completedPerStatus"/>%;"></span></span>
														  </div>
                                   
                                    </div>
                                </div>
								    <div class="panel-heading height_110 pad_head">
                               <div class="media-body text-caption">
                                           <h5 class="black-text">Modules</h5>
										   <ul class="pad_0">
										   <s:if test="modulesList.size()>0">
										   <s:iterator value="modulesList">
										   	<li class="module-li auto_dots195"><s:property value="moduleName"/> </li>
										   </s:iterator>
										  </s:if>
										  <s:if test="modulesList.size()>0">
											<p class="module-li"> <a href="javaScript:;" onclick="getModules(<s:property value="courseId"/>)">More...</a></p>
											</s:if>
											<s:else>
				                                	<b style="text-align: center;">There is no data</b>
											
											</s:else>
											</ul>
                                        </div>
										</div>
                                        
                                <hr class="margin-none">
                                <div class="panel-body">
									<div class="media-left panel-left">
									
									 <!-- <i data-toggle="tooltip" title="Start Date" class="fa fa-calendar fa-fw margin_top9"></i> -->Scheduled Start: <s:property value="startedOn"/>&nbsp;&nbsp;&nbsp;<br/>
									 <s:if test="completedOn !=null">
									<!-- <i data-toggle="tooltip" title="Completed Date" class="fa fa-calendar fa-fw margin_top9"></i> -->Scheduled End: <s:property value="completedOn"/>
									 </s:if>
									 </div>
									 
									 <div class="media-right">
                                    <a class="btn-pad normalbutton btn-height margin_bot1 margin_topm10" data-z="0" data-hover-z="1" data-animated="" href="javaScript:;" onclick="getModules(<s:property value="courseId"/>)">Modules</a>
                                    </div>
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
