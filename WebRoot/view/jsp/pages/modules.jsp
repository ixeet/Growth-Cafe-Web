<%-- <div>
	<s:if test="moduleList != null">
		<s:iterator value="moduleList">
			<div>
				<h4><a href="getModules?courseId=<s:property value="moduleId"/>"><s:property value="moduleName"/></a></h4>
				<p> Started on: <s:property value="startedOn"/> </p>
				<p> Completed Percentage: <s:property value="completedPerStatus"/> </p>
				<p> Module Id: <s:property value="moduleId"/> </p>
			
			</div>	
		</s:iterator>
	</s:if>
</div>
 --%>



<%@ taglib prefix="s" uri="/struts-tags"%>

<script>
var courseId = ${courseId};
function moduleDescription(moduleId){
	window.location="moduleDescription?moduleId="+moduleId+"&courseId="+courseId;
	/* $.ajax({
			url : "moduleDescription",
			type :"post",
			data :{"moduleId":moduleId,"courseId":courseId},
			beforeSend :function(){
				//showErrorMessage("looading");
			},
			success : function(data){
			$("#BodyId").html(data);
			},
        }); */
        
}
function getResourceDetial(resourceId,moduleId){
	window.location="moduleDescription?moduleId="+moduleId+"&courseId="+courseId+"&resourceId="+resourceId;
	/* $.ajax({
			url : "moduleDescription",
			type :"post",
			data :{"moduleId":moduleId,"courseId":courseId,"resourceId":resourceId},
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
                    <h3 class="text-black margin-v-0"><a class="transf" href="courses">Courses</a> / Modules</h3>
                  
                </div>
               
            </div>
        </div>
    </div>

 <div class="container">
        <div class="page-section">
            <div class="row">
                <div class="col-md-9">
                    <div class="row" data-toggle="isotope">
<s:if test="moduleList != null">
<s:iterator value="moduleList" id="status">
<!-- course -->
<div class="item col-xs-12 col-sm-6 col-lg-4">
                            <div class="panel panel-default paper-shadow" data-z="0.5">
                                <div class="panel-heading bgcolor">
                                    <div class="media media-clearfix-xs-min v-middle">
                                        <div class="media-body text-caption text-white">
                                           <h4 class="text-white"><s:property value="moduleName"/></h4>
                                        </div>
                                        
                                    </div>
                                </div>
                                <div class="panel-heading">
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
                                	<s:if test="resourceList.size()>0">
								<div class="panel-heading">
                                  <div class="media-body text-caption">
                                           <h4 class="black-text center">Resources included</h4>
									
										<s:iterator value="resourceList">
										<div class="media v-middle">
                                            <div class="media-left">
                                                <a href="#">
                                                    <img src="view/helper/images/video.png" alt="person" class="img-square width-60">
                                                </a>
                                            </div>
                                            <div class="media-body">
                                                <a href="javaScript:;" onclick="getResourceDetial(<s:property value="resourceId"/>,<s:property value="#status.moduleId"/>)"; class="text-subhead link-text-color"><s:property value="authorName"/></a>
                                            </div>
                                        </div>
                                        </s:iterator>
                                        
										<li class="course-li"><a href="javaScript:;" onclick="moduleDescription(<s:property value='moduleId'/>)">More...</a> </li>
									 </div>
							    </div>
                                        
                                <hr class="margin-none">
                                <div class="panel-body">
									
									 <h5><i data-toggle="tooltip" title="Start Date" class="fa fa-calendar fa-fw"></i><s:property value="startedOn"/> </h5>
									 <s:if test="completedOn !=null">
									 <h5><i data-toggle="tooltip" title="Completed Date" class="fa fa-calendar fa-fw"></i><s:property value="completedOn"/> </h5>
									 </s:if>
                                    <a style="margin-top: -41px;" class="btn-pad loginbutton btn-height btn-pad-height" data-z="0" data-hover-z="1" data-animated="" href="javaScript:;" onclick="moduleDescription(<s:property value='moduleId'/>)">View Module</a>
                                </div>
                                </s:if>
                                <s:else>
                                <b style="text-align: center; margin: 20px;">There is no data</b>
                                </s:else>
                            </div>
                        </div><!-- module ends-->
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
