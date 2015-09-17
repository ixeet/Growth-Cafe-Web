<%@ taglib prefix="s" uri="/struts-tags"%>

<script type="text/javascript">

function uploadAssignment(){
var assignmentName = $("#assignmentNameId").val();
var assignmentDesc = $("#assignmentDescId").val();
var assignmentLink = $("#assignmentLinkId").val();
var assignmentRes = $("#assignmentResId").val();
if(assignmentName==""){
	showErrorMessage("Title can't be empty");
}else if (assignmentDesc =="") {
	showErrorMessage(" Description can't be empty");
}else if (assignmentLink=="" && assignmentRes=="") {
	showErrorMessage("Please enter video link or upload a mp4 file");
}else{
	/* $("#uploadAssignmentFormId").submit(); */
	 var formData = new FormData($("#uploadAssignmentFormId")[0]);
					 console.log(formData);
					
					   /* var formDataSerialized = $("#profileImgUploadFormId").serialize();
					  console.log(formDataSerialized);  */
					  
					  $.ajax({
					            url: 'uploadAssignment',
					            type: 'POST',
					            data: formData,
					            contentType: false,
					            processData: false,
					            beforeSend :function(){
					            loadingImg();
					            },
					            success: function (result) {
					                var response = JSON.parse(result);
					                if(response.statusMessage=='success'){
					                	window.location="assignments";
					                }else{
					                	showErrorMessage(response.message);
					                }
					                loadingComp();
					            },
					            error: function(result){ }
					           
					        });
	}
}

</script>

    
    <div class="container margin_topm22">
        <div class="page-section">
            <div class="row">
                <div class="col-md-9">
                    <div class="row" data-toggle="isotope">
                        <!-- Module -->
						<div class="item col-xs-12 col-sm-12 col-lg-8">
                            <div class="panel panel-default paper-shadow" data-z="0.5">
                                <div class="panel-heading">
                                    <div class="media media-clearfix-xs-min v-middle">
                                        <div class="media-body text-caption text-white">
                                           <h5 class="h5_color">${assignmentVo.assignmentName}</h5>
                                        </div>
                                        
                                    </div>
                                </div>
                                <form action="uploadAssignment" enctype="multipart/form-data" id="uploadAssignmentFormId" method="post">
								<div class="panel-heading">
                                  <div class="media-body text-caption">
                                           
											<div class="col-sm-12 col-md-12">
											Enter assignment title
                                            <input name="assignmentName" id="assignmentNameId" type="text" class="form-control" placeholder="Enter a title" value=""><br>
											Enter assignment description
											<textarea name="assignmentDesc" id="assignmentDescId" class="form-control" placeholder="Write some description about your asignment..." ></textarea><br>
											Enter assignment link
                                            <input name="assignmentLink" id="assignmentLinkId" type="text" class="form-control" placeholder="Enter link including http://www." value=""><br>
											Upload Assignment (Video only)
                                            <input id="assignmentResId" name="assignmentRes" type="file" class="form-control"  value="" accept="video/*"><br>
											<s:hidden name="assignmentId"></s:hidden>
                                        </div>
									</div>
							    </div>
                                        
                                <hr class="margin-none">
                                <div class="panel-body">
									<a onclick="uploadAssignment();" class="btn-pad normalbutton btn-height margin_bot1" data-z="0" data-hover-z="1" data-animated="" href="javaScript:;">Submit</a>
                                </div>
                                </form>
                            </div>
                        </div>
						<!-- Modules ends-->
						
						<div class="item col-xs-12 col-sm-12 col-md-12 col-lg-4">
								<div class="col-lg-12 col-sm-6 col-md-6 col-xs-12">
							<div class="panel panel-default paper-shadow" data-z="0.5" data-hover-z="1" data-animated="">
								<div class="panel-heading">
									<h5 class="h5_color">Module Information</h5>
								</div>
								<div class="panel-body">
									<p class="text-caption text_default">
										Course : ${assignmentVo.courseName} <br>
										Module : ${assignmentVo.moduleName} <br>
									   <!-- <i data-toggle="tooltip" title="" class="fa fa-clock-o fa-fw" data-original-title="Time duration"></i> -->Module Duration :&nbsp; ${moduleDetail.timeDuration} days &nbsp;<br>
									   <!-- <i data-toggle="tooltip" title="" class="fa fa-calendar fa-fw" data-original-title="Start Date"></i> -->Scheduled Start :&nbsp; ${moduleDetail.startedOn} &nbsp;<br>
									   <!-- <i data-toggle="tooltip" title="" class="fa fa-calendar fa-fw" data-original-title="Complete Date"></i> -->Scheduled End : &nbsp; ${moduleDetail.completedOn}
										<br>
										<!-- <i data-toggle="tooltip" title="" class="fa fa-user fa-fw" data-original-title="Author"></i> Adrian Demian -->
										<br>
										
									</p>
								</div>
								<hr class="margin-none">
							   
							  
							</div>
					</div>
					
					<div class="col-lg-12 col-sm-6 col-md-6 col-xs-12">
							<div class="panel panel-default paper-shadow" data-z="0.5" data-hover-z="1" data-animated="">
							<div class="panel-heading">
									<h5 class="h5_color">Assignment Details</h5>
									</div>
								<div class="panel-body">
									
									<div class="expandable expandable-indicator-white expandable-trigger">
										<div class="expandable-content text_default">
										  <!-- <i data-toggle="tooltip" title="" class="fa fa-calendar fa-fw" data-original-title="Last date of submission"></i> -->Due Date :&nbsp; ${assignmentVo.assignmentDueDate}<br>	
											<p>${assignmentVo.assignmentDesc}</p>
										<div class="expandable-indicator"><i></i></div></div>
									</div>
								</div>
							</div>
						</div>
						</div>
						
						</div>
                    
                </div>
							<!-- Recent Updates Jsp Included -->
			              			<s:include value="recentUpdates.jsp"></s:include>
			              <!-- Recent Updates Jsp Included -->
		                      </div>
      </div>
    </div>