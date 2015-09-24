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
<script>

var p=$('#fog p');
var divh=$('#fog').height();
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
<s:if test="moduleList != null">
<s:iterator value="moduleList" id="status">
<!-- course -->
<div class="item col-xs-12 col-sm-6 col-lg-4">
                            <div class="panel panel-default paper-shadow height_250" data-z="0.5">
                                <div class="panel-heading pad_modal1">
                                    <div class="media media-clearfix-xs-min v-middle">
                                        <div class="media-body text-caption text-white">
                                           <h5 class="h5_color auto_dots250"><s:property value="moduleName"/></h5>
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
                                	<s:if test="resourceList.size()>0">
								<div class="panel-heading height_110 pad_head">
                                  <div class="media-body text-caption">
                                           <h5 class="black-text">Resources included</h5>
									
										<s:iterator value="resourceList">
										<div class="media v-middle margin_all0">
                                            <div class="media-left">
                                                <a href="#">
                                                    <img src="view/helper/images/video.png" alt="person" class="img-square width-60">
                                                </a>
                                            </div>
                                            <div class="media-body">
                                            <div id="fog">
                                          
                                              
                                              <p class="module-li">
                                                <a href="javaScript:;" onclick="getResourceDetial(<s:property value="resourceId"/>,<s:property value="#status.moduleId"/>)"; class="module-li"><s:property value="resourceName"/></a>
                                              </p>
                                              </div>
                                            </div>
                                        </div>
                                        </s:iterator>
                                        
										<p class="module-li margin_top4"><a href="javaScript:;" onclick="moduleDescription(<s:property value='moduleId'/>)">More...</a> </p>
									 </div>
							    </div>
                                        
                                <hr class="margin-none">
                                <div class="panel-body">
									<div class="media-left panel-left">
									<!-- <i data-toggle="tooltip" title="Start Date" class="fa fa-calendar fa-fw margin_top9"></i> -->Scheduled Start : <s:property value="startedOn"/>&nbsp;&nbsp;&nbsp;<br/>
									 <s:if test="completedOn !=null">
									 <!-- <i data-toggle="tooltip" title="Completed Date" class="fa fa-calendar fa-fw margin_top9""></i> -->Scheduled End : <s:property value="completedOn"/>
									 </s:if>
									  </div>
									 
									 <div class="media-right">
                                    <a class="btn-pad normalbutton btn-height margin_bot1 margin_topm10" data-z="0" data-hover-z="1" data-animated="" href="javaScript:;" onclick="moduleDescription(<s:property value='moduleId'/>)">View</a>
                               	 </div>
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
