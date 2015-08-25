<%@ taglib prefix="s" uri="/struts-tags"%>

<script type="text/javascript">


function getModules(courseId){
	window.location="getModules?courseId="+courseId;
}

function commentOnFeed(feedId, commentTxt){
	if(commentTxt!=""){
		$.ajax({
				url : "commentOnFeed",
				type :"post",
				data :{"feedId":feedId,"commentTxt":commentTxt},
				beforeSend :function(){
					$(this).val("");
				},
				success : function(data){
				$("#feedCommentJspDivId"+feedId).html(data);
				},
	        });
	        }
      /*   var commentDiv='<li class="media">'+
                        '<div class="media-left">'+
                          '<a href="">'+
                            '<img src="view/helper/images/people/50/guy-5.jpg" class="media-object img-circle width-40">'+
                         '</a>'+
                        '</div>'+
                        '<div class="media-body">'+
                          
                          '<a href="" class="comment-author pull-left">${commentBy}&nbsp;</a>'+
                          '<span>${commentTxt}</span>'+
                          '<div class="comment-date">'+commentTxt+'</div>'+
        				'</div>'+
                      '</li>';alert(commentDiv);
                      $('#feedCommentJspDivId').find(' > li:nth-last-child(1)').before(commentDiv);
        return false;   */
}

function commentOnFeedComment(feedId,commentId,commentTxt){
	if(commentTxt!=""){
	$.ajax({
			url : "commentOnFeedComment",
			type :"post",
			data :{"feedId":feedId,"commentTxt":commentTxt,"commentId":commentId},
			beforeSend :function(){
			$(this).val("");
				//showErrorMessage("looading");
			},
			success : function(data){
			$("#feedCommentJspDivId"+feedId).html(data);
			},
        });
        return false; 
        } 
}

function likeOnFeed(feedId){
	$.ajax({
			url : "likeOnFeed",
			type :"post",
			data :{"feedId":feedId},
			beforeSend :function(){
				//showErrorMessage("looading");
			},
			success : function(data){
			$("#feedCommentJspDivId"+feedId).html(data);
			},
        });
        return false;  
}

function likeOnFeedComment(feedId,commentId){
	$.ajax({
			url : "likeOnFeedComment",
			type :"post",
			data :{"feedId":feedId,"commentId":commentId},
			beforeSend :function(){
				//showErrorMessage("looading");
			},
			success : function(data){
			$("#feedCommentJspDivId"+feedId).html(data);
			},
        });
        return false;  
}

function viewAllComments(feedId){
	$("#twoCommentsDivId"+feedId).hide();
	$("#allCommentDivId"+feedId).show();
}

function showSubComment(commentId){
	$("#subCommentDivId"+commentId).show();
}

</script>



<div class="parallax overflow-hidden  page-section third margin-section-module">
        <div class="container parallax-layer" data-opacity="true" style="opacity: 1; transform: translate3d(0px, 0px, 0px);">
            <div class="media v-middle">
                
                <div class="media-body">
                    <h3 class="text-black margin-v-0">Updates</h3>
					
                  
                </div>
               
            </div>
        </div>
    </div>
    
    
    
    <div class="container">
        <div class="page-section pad_top_80">
            <div class="row">
            
             <div class="col-xs-12 col-md-7 col-lg-7">
             <s:iterator value="feedList">
              <div class="col-xs-12 col-md-12 col-lg-12 item">
				
                <div class="timeline-block">
                  <div class="panel panel-default " style="padding: 8px;">

                    <div class="panel-heading bgcolor">
                      <div class="media">
                        <div class="media-left">
                          <a  href="javaScript:;" onclick="personalProfile(${user.userId});">
                          	
                            <img src='view/helper/images/people/50/guy-6.jpg' class="media-object img-circle width-50">
                          </a>
                        </div>
                        <div class="media-body">
						
                            <span> <s:text name="feedText"/> &nbsp;</span>
							<br><i><s:property value="feedOn" /> </i>
                        </div>
                      </div>
                    </div>

                    <div class="panel-body list-group" style="text-align: justify;">
                       <s:property value="resource.resourceDesc"/><br/><br/>
                 
                    <!-- 4:3 aspect ratio -->
                    <div class="embed-responsive embed-responsive-4by32">
					
                       <!--  <iframe width="500" height="400" src="${resource.resourceUrl}" frameborder="0" allowfullscreen></iframe> -->
                       <video width="600" height="365" controls="" poster="${resource.thumbImg}">
							 <source src="${resource.resourceUrl}">
						</video>
                    </div>
                   		<!-- Comment Content Start -->
						<div id="feedCommentJspDivId<s:property value='feedId' />">
							
							
							 <ul class="mdesc_ul mdesc_pad">
							 	<s:if test="%{likeStatus}">
							 		<li class="mdesc_li pad_0 boder_0"><a href="javaScript:;"><i class="fa fa-fw fa-thumbs-up"></i>${likeCounts} Like</a></li>
								</s:if>
								<s:else>
									<li class="mdesc_li"><a href="javaScript:;" onclick="likeOnFeed(<s:property value='feedId'/>)"><i class="fa fa-fw fa-thumbs-o-up" ></i>${likeCounts} Like</a></li>
								</s:else>
								
								<li id="comments_cl" class="mdesc_li com" ><a href="javaScript:;"><i class="fa fa-fw fa-comments-o"></i> ${commentCounts} Comment</a></li>
								<!-- <li class="mdesc_li"><a href="javaScript:;"><i class="fa fa-fw fa-share-square-o"></i>300 Share</a></li> -->
								
					</ul></br>
					
				<ul class="comments">
					<s:if test="commentList != null && commentList.size()>0 && commentList.size()<3">
					<s:iterator value="commentList">
                      <li class="media">
                        <div class="media-left">
                          <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);">
                            <img src="view/helper/images/people/50/guy-6.jpg" class="media-object img-circle width-40">
                          </a>
                        </div>
                        <div class="media-body">
                          
                          <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);" class="comment-author pull-left">${commentBy}&nbsp;</a>
                          <span>${commentTxt}</span>
                          <div class="comment-date">${commentDate}</div>
						  
								<ul class="mdesc_ul mdesc_pad">
								<s:if test="%{likeStatus}">
									<li class="mdesc_li pad_0 boder_0"><a href="javaScript:;"><i class="fa fa-fw fa-thumbs-up"></i>${likeCounts} Like</a></li>
								</s:if>
								<s:else>
									<li class="mdesc_li pad_0 boder_0"><a href="javaScript:;" onclick="likeOnFeedComment(<s:property value='feedId' />,<s:property value='commentId' />);"><i class="fa fa-fw fa-thumbs-o-up"></i>${likeCounts} Like</a></li>
								</s:else>
								<li class="mdesc_li pad_0 boder_0"><a href="javaScript:;" onclick="showSubComment(<s:property value='commentId'/>);"><i class="fa fa-fw fa-comments-o"></i> ${commentCounts} Comment</a></li>
								
								</ul></br>
										<!-- comment second level -->
									<div id="subCommentDivId<s:property value='commentId'/>" style="display:none;">	
										<ul class="comments">
										<s:if test="subCommentList != null && subCommentList.size()>0">
										<s:iterator value="subCommentList">
										  <li class="media">
											<div class="media-left">
											  <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);">
												<img src="view/helper/images/people/50/guy-6.jpg" class="media-object img-circle width-30">
											  </a>
											</div>
											<div class="media-body">
											  
											  <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);" class="comment-author pull-left"><s:property value="commentBy" /> </a>
											  <span>&nbsp;<s:property value="commentTxt" /></span>
											  <div class="comment-date"><s:property value="commentDate" /></div>
											  <ul class="mdesc_ul mdesc_pad">
												<s:if test="%{likeStatus}">
													<li class="mdesc_li pad_0 boder_0"><a href="javaScript:;"><i class="fa fa-fw fa-thumbs-up"></i>${likeCounts} Like</a></li>
												</s:if>
												<s:else>
													<li class="mdesc_li pad_0 boder_0"><a href="javaScript:;" onclick="likeOnFeedComment(<s:property value='feedId' />,<s:property value='commentId' />);"><i class="fa fa-fw fa-thumbs-o-up"></i>${likeCounts} Like</a></li>
												</s:else>
												</ul>
											</div>
										  </li>
										  </s:iterator>
										  </s:if>						  
										  <li class="comment-form">
											<div class="media-left">
												   <a href=""><img src="view/helper/images/people/50/guy-6.jpg" class="media-object img-circle width-30"></i></a>
												</div>
												<div class="media-body">
												<input type="text" class="form-control" onkeydown="if (event.keyCode == 13) commentOnFeedComment(${feedId},<s:property value='commentId' />,this.value  );">
											</div>
										  </li>
										</ul>
										</div>
										<!-- comment second level end-->
                        </div>
                      </li>
                      </s:iterator>
                      </s:if>
                      <s:elseif test="commentList.size()>0">
                      <div id="twoCommentsDivId<s:property value='feedId' />">
		                      <span id="commentTextId">
									2 of ${commentCounts} comments shown
									<span style="color: #0c80df">
									<a onclick="viewAllComments(<s:property value='feedId' />);" href="javaScript:;">View all comments</a>
									</span>
									</span>
                      <s:iterator value="commentList" begin="0" end="1">
                      <li class="media">
                        <div class="media-left">
                          <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);">
                            <img src="view/helper/images/people/50/guy-6.jpg" class="media-object img-circle width-40">
                          </a>
                        </div>
                        <div class="media-body">
                          
                          <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);" class="comment-author pull-left">${commentBy}&nbsp;</a>
                          <span>${commentTxt}</span>
                          <div class="comment-date">${commentDate}</div>
						  
								<ul class="mdesc_ul mdesc_pad">
								<s:if test="%{likeStatus}">
									<li class="mdesc_li pad_0 boder_0"><a href="javaScript:;"><i class="fa fa-fw fa-thumbs-up"></i>${likeCounts} Like</a></li>
								</s:if>
								<s:else>
									<li class="mdesc_li pad_0 boder_0"><a href="javaScript:;" onclick="likeOnFeedComment(<s:property value='feedId' />,<s:property value='commentId' />);"><i class="fa fa-fw fa-thumbs-o-up"></i>${likeCounts} Like</a></li>
								</s:else>
								<li class="mdesc_li pad_0 boder_0"><a href="javaScript:;" onclick="showSubComment(<s:property value='commentId'/>);"><i class="fa fa-fw fa-comments-o"></i> ${commentCounts} Comment</a></li>
								
								</ul></br>
										<!-- comment second level -->
										<div id="subCommentDivId<s:property value='commentId'/>" style="display:none;">
										<ul class="comments">
										<s:if test="subCommentList != null && subCommentList.size()>0">
										<s:iterator value="subCommentList">
										  <li class="media">
											<div class="media-left">
											  <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);">
												<img src="view/helper/images/people/50/guy-6.jpg" class="media-object img-circle width-30">
											  </a>
											</div>
											<div class="media-body">
											  
											  <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);" class="comment-author pull-left"><s:property value="commentBy" /> </a>
											  <span>&nbsp;<s:property value="commentTxt" /></span>
											  <div class="comment-date"><s:property value="commentDate" />
											  <ul class="mdesc_ul mdesc_pad">
												<s:if test="%{likeStatus}">
													<li class="mdesc_li pad_0 boder_0"><a href="javaScript:;"><i class="fa fa-fw fa-thumbs-up"></i>${likeCounts} Like</a></li>
												</s:if>
												<s:else>
													<li class="mdesc_li pad_0 boder_0"><a href="javaScript:;" onclick="likeOnFeedComment(<s:property value='feedId' />,<s:property value='commentId' />);"><i class="fa fa-fw fa-thumbs-o-up"></i>${likeCounts} Like</a></li>
												</s:else>
												</ul>
											  </div>
											</div>
										  </li>
										  </s:iterator>
										  </s:if>						  
										  <li class="comment-form">
											<div class="media-left">
												   <a href=""><img src="view/helper/images/people/50/guy-6.jpg" class="media-object img-circle width-30"></i></a>
												</div>
												<div class="media-body">
												<input type="text" class="form-control" onkeydown="if (event.keyCode == 13) commentOnFeedComment(${feedId},<s:property value='commentId' />,this.value  );">
											</div>
										  </li>
										</ul>
										</div>
										<!-- comment second level end-->
                        </div>
                      </li>
                      </s:iterator>
                      </div>
                      </s:elseif>
                      <s:if test="commentList != null && commentList.size()>0 ">
                      <div id="allCommentDivId<s:property value='feedId' />" style="display: none;">
						<s:iterator value="commentList">
                      <li class="media">
                        <div class="media-left">
                          <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);">
                            <img src="view/helper/images/people/50/guy-6.jpg" class="media-object img-circle width-40">
                          </a>
                        </div>
                        <div class="media-body">
                          
                          <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);" class="comment-author pull-left">${commentBy}&nbsp;</a>
                          <span>${commentTxt}</span>
                          <div class="comment-date">${commentDate}</div>
						  
								<ul class="mdesc_ul mdesc_pad">
								<s:if test="%{likeStatus}">
									<li class="mdesc_li pad_0 boder_0"><a href="javaScript:;"><i class="fa fa-fw fa-thumbs-up"></i>${likeCounts} Like</a></li>
								</s:if>
								<s:else>
									<li class="mdesc_li pad_0 boder_0"><a href="javaScript:;" onclick="likeOnFeedComment(<s:property value='feedId' />,<s:property value='commentId' />);"><i class="fa fa-fw fa-thumbs-o-up"></i>${likeCounts} Like</a></li>
								</s:else>
								<li class="mdesc_li pad_0 boder_0"><a href="javaScript:;" onclick="showSubComment(<s:property value='commentId'/>);"><i class="fa fa-fw fa-comments-o"></i> ${commentCounts} Comment</a></li>
								
								</ul></br>
										<!-- comment second level -->
										<div id="subCommentDivId<s:property value='commentId'/>" style="display:none;">
										<ul class="comments">
										<s:if test="subCommentList != null && subCommentList.size()>0">
										<s:iterator value="subCommentList">
										  <li class="media">
											<div class="media-left">
											  <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);">
												<img src="view/helper/images/people/50/guy-6.jpg" class="media-object img-circle width-30">
											  </a>
											</div>
											<div class="media-body">
											  
											  <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);" class="comment-author pull-left"><s:property value="commentBy" /> </a>
											  <span>&nbsp; <s:property value="commentTxt" /></span>
											  <div class="comment-date"><s:property value="commentDate" />
											  
											  <ul class="mdesc_ul mdesc_pad">
												<s:if test="%{likeStatus}">
													<li class="mdesc_li pad_0 boder_0"><a href="javaScript:;"><i class="fa fa-fw fa-thumbs-up"></i>${likeCounts} Like</a></li>
												</s:if>
												<s:else>
													<li class="mdesc_li pad_0 boder_0"><a href="javaScript:;" onclick="likeOnFeedComment(<s:property value='feedId' />,<s:property value='commentId' />);"><i class="fa fa-fw fa-thumbs-o-up"></i>${likeCounts} Like</a></li>
												</s:else>
												</ul>
											  </div>
											</div>
										  </li>
										  </s:iterator>
										  </s:if>						  
										  <li class="comment-form">
											<div class="media-left">
												   <a href="javaScript:;" onclick="personalProfile(${loginDetail.userId});"><img src="view/helper/images/people/50/guy-5.jpg" class="media-object img-circle width-30"></i></a>
												</div>
												<div class="media-body">
												<input type="text" class="form-control" onkeydown="if (event.keyCode == 13) commentOnFeedComment(${feedId},<s:property value='commentId' />,this.value  );">
											</div>
										  </li>
										</ul>
										</div>
										<!-- comment second level end-->
                        </div>
                      </li>
                      </s:iterator>
                      </div>
                      </s:if>
                      <li class="comment-form">
                        <div class="input-group">
							<span class="input-group-btn">
							   <a href="" class="btn btn-default"><img src="view/helper/images/people/50/guy-6.jpg" class="media-object img-circle width-40"></i></a>
							</span>
							<input type="text" class="form-control" onkeydown="if (event.keyCode == 13) commentOnFeed(<s:property value='feedId' />,this.value  );">
						</div>
                      </li>
                    </ul>
							

						</div>
						<!-- Comment Content End -->
                    </div>
                  
                </div>
				</div>
              </div>
                </s:iterator>
              
              </div>
              
            
			<!-- update course started -->
			<div class="col-xs-12 col-md-5 col-lg-5">
			<div class="col-xs-12 col-md-12 col-lg-12">
                    <div class="panel panel-default" data-toggle="panel-collapse" data-open="true">
                        <div class="panel-heading bgntext panel-collapse-trigger">
                            <h4 class="text-white">Course</h4>
                        </div>
                        <div class="panel-body list-group pad_0">
                           <ul class="list-group relative paper-shadow" data-hover-z="0.5" data-animated>
                           <s:if test="#session.courseList != null && #session.courseList.size()>0">
                           		<s:iterator value="#session.courseList">
                                    <li class="list-group-item paper-shadow">
                                        <div class="media v-middle">
												<div class="left">
													<a href="javaScript:;" onclick="getModules(<s:property value="courseId"/>)">
													<h6 class="text-subhead color_blue text_upper link-text-color"><s:property value="courseName"/></h6></a>
													</div>
												<s:if test="completedPerStatus == 100">
												<div class="right">
														<h6
															class="text-subhead green right text_upper link-text-color">Completed</h6>
													</div>
												</s:if>
												<s:else>
													<div class="right">
														<h6
															class="text-subhead color_blue right text_upper link-text-color"><s:property value="completedPerStatus"/>%</h6>
													</div>
													<div
														class="clear_both progress progress-mini width_100p margin-none">
														<div class="progress-bar progress-bar-normal"
															role="progressbar" aria-valuenow="<s:property value="completedPerStatus"/>" aria-valuemin="0"
															aria-valuemax="100" style="width:80%;"></div>
													</div>
												</s:else>



												
												</div>
                                       
                                    </li>
                                  </s:iterator>
                                </s:if>
									<li class="list-group-item paper-shadow">
                                        <div class="media v-middle">
												<a class="btn-pad loginbutton btn-height" href="courses" > View All Courses</a>
                                        </div>
                                    </li>
									
                                </ul>
                        </div>
                    </div>
            </div> <!-- clsoed all course module -->
			
			<!-- assignments started -->
			<div class="col-xs-12 col-md-12 col-lg-12">
                    <div class="panel panel-default" data-toggle="panel-collapse" data-open="true">
                        <div class="panel-heading bgntext panel-collapse-trigger">
                            <h4 class="text-white">Your Assignments</h4>
                        </div>
                        <div class="panel-body list-group pad_0">
                           <ul class="list-group relative paper-shadow" data-hover-z="0.5" data-animated>
                           		<s:if test="#session.assignmentList !=null && #session.assignmentList.size()>3"  >
                           		<s:iterator value="#session.assignmentList" begin="0" end="2">
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
												<a class="btn-pad loginbutton btn-height" href="assignments" > View All Assignments</a>
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