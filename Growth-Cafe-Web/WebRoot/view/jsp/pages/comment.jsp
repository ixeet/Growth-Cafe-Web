 <%@ taglib prefix="s" uri="/struts-tags"%>
 
 <script type="text/javascript">
	function showSubComment(commentId){
		$("#subCommentDivId"+commentId).show();
	}
	
	function showSubComments(commentId){
		$("#subCommentDivIds"+commentId).show();
	}
 </script>
 							<ul class="mdesc_ul mdesc_pad1">
								<s:if test="%{moduleDescription.likeStatus}">
									<li class="mdesc_li"><a class="color_likes bold" href="javaScript:;" ><i class="fa fa-fw fa-thumbs-up"></i>${moduleDescription.likeCounts}<s:if test="moduleDescription.likeCounts>1"> Likes</s:if><s:else> Like</s:else></a></li>
								</s:if>
								<s:else>
									<li class="mdesc_li"><a class="color_likes bold" href="javaScript:;" onclick="likeResource()"><i class="fa fa-fw fa-thumbs-o-up"></i>${moduleDescription.likeCounts}<s:if test="moduleDescription.likeCounts>1"> Likes</s:if><s:else> Like</s:else></a></li>
								</s:else>
								
								<li class="mdesc_li"><a class="color_likes bold" href="javaScript:;"><i class="fa fa-fw fa-comments-o"></i>${moduleDescription.commentCounts} Comments</a></li>
								<li class="mdesc_li"><a class="color_likes bold" href="javaScript:;" id="share_button"><i class="fa fa-fw fa-share-square-o"></i>Share</a></li>
								
							</ul>
 

							 <hr/>
							 
							
								
				<div id="remainingCommentDivId" style="display: none;">
				<ul class="comments border_t_likes">
					<s:if test="moduleDescription.commentList !=null && moduleDescription.commentList.size()>2">
									<!-- comment section -->
									
					<s:iterator value="moduleDescription.commentList" begin="0">
						 <li class="media">
		                        <div class="media-left">
		                          <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);">
		                            <s:if test="commentByImg!=null && commentByImg!=''">
		                            <img src='<s:property value="commentByImg" />' class="media-object img-circle width-30">
									</s:if>
									<s:else>
										<img src="view/helper/images/people/50/guy-6.jpg" class="media-object img-circle width-30">	
									</s:else>
		                          </a>
		                        </div>
                        <div class="media-body">
                          
                          <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);" class="comment-author pull-left color_blue bold">${commentBy}&nbsp;</a>
                          <span>&nbsp;${commentTxt}</span>
                          <div class="comment-date">${commentDate}</div>
						  
								<ul class="mdesc_ul mdesc_pad">
								<s:if test="%{likeStatus}">
									<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;"><i class="fa fa-fw fa-thumbs-up"></i>${likeCounts} <s:if test="likeCounts>1">Likes</s:if><s:else>Like</s:else></a></li>
								</s:if>
								<s:else>
									<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;" onclick="likeOnComment(<s:property value='commentId' />);"><i class="fa fa-fw fa-thumbs-o-up"></i>${likeCounts} <s:if test="likeCounts>1">Likes</s:if><s:else>Like</s:else></a></li>
								</s:else>
								<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;" onclick="showSubComment(<s:property value='commentId'/>);"><i class="fa fa-fw fa-comments-o"></i> ${commentCounts} <s:if test="commentCounts>1">Comments</s:if><s:else>Comment</s:else></a></li>
								
								</ul><br/>
										<!-- comment second level -->
										<div id="subCommentDivId<s:property value='commentId'/>" style="display:none;">	
										<ul class="comments">
										<s:if test="subCommentList != null && subCommentList.size()>0">
										<s:iterator value="subCommentList">
										  <li class="media">
											<div class="media-left">
											  <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);">
												<s:if test="commentByImg!=null && commentByImg!=''">
						                            <img src='<s:property value="commentByImg" />' class="media-object img-circle width-20">
													</s:if>
													<s:else>
														<img src="view/helper/images/people/50/guy-6.jpg" class="media-object img-circle width-20">	
													</s:else>
											  </a>
											</div>
											<div class="media-body">
											  
											  <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);" class="comment-author pull-left color_blue bold"><s:property value="commentBy" /> </a>
											  <span>&nbsp;<s:property value="commentTxt" /></span>
											  <div class="comment-date"><s:property value="commentDate" />
											  
											  <ul class="mdesc_ul mdesc_pad">
												<s:if test="%{likeStatus}">
													<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;"><i class="fa fa-fw fa-thumbs-up"></i>${likeCounts} <s:if test="likeCounts>1">Likes</s:if><s:else>Like</s:else></a></li>
												</s:if>
												<s:else>
													<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;" onclick="likeOnComment(<s:property value='commentId' />);"><i class="fa fa-fw fa-thumbs-o-up"></i>${likeCounts} <s:if test="likeCounts>1">Likes</s:if><s:else>Like</s:else></a></li>
												</s:else>
												</ul>
											  </div>
											</div>
										  </li>
										  </s:iterator>
										  </s:if>						  
										  <li class="comment-form">
											<div class="media-left">
												   <a href="javaScript:;" onclick="personalProfile(${loginDetail.userId});">
												   	<s:if test="#session.loginDetail.profilePhotoFileName !=null && #session.loginDetail.profilePhotoFileName !=''">
														   <img src="${sessionScope.loginDetail.profilePhotoFileName}" class="media-object img-circle width-20">
														   </s:if>
														   <s:else>
														   	<img src="view/helper/images/people/50/guy-6.jpg" class="media-object img-circle width-20">
														   </s:else>
													</a>
												</div>
												<div class="media-body">
												<input type="text" placeholder="Write a reply..." class="form-control comment_box_r" onkeydown="if (event.keyCode == 13) commentOnComment(<s:property value='commentId'/>,this.value );">
											</div>
										  </li>
										</ul>
										</div>
										<!-- comment second level end-->
                        </div>
                      </li>
										  
										  
										  
										  
										  
										</s:iterator>
								</s:if>
								</ul>
								</div>
						<ul class="comments border_t_likes">
							 <s:if test="moduleDescription.commentList !=null && moduleDescription.commentList.size()>2">
							 <div id="currentCommentDivId">
							 <span id="commentTextId">
							2 of ${moduleDescription.commentCounts} comments shown<span style="color: #0c80df"> <a href="javaScript:;" class="color_blue" onclick="moreComments();">View all comments</a></span>
							</span>
							<!-- comment section -->
							
							<s:iterator value="moduleDescription.commentList" begin="0" end="1">
								   
							 <li class="media">
		                        <div class="media-left">
		                          <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);">
		                            <s:if test="commentByImg!=null && commentByImg!=''">
		                            <img src='<s:property value="commentByImg" />' class="media-object img-circle width-30">
									</s:if>
									<s:else>
										<img src="view/helper/images/people/50/guy-6.jpg" class="media-object img-circle width-30">	
									</s:else>
		                          </a>
		                        </div>
                        <div class="media-body">
                          
                          <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);" class="comment-author pull-left color_blue bold">${commentBy}&nbsp;</a>
                          <span>&nbsp;${commentTxt}</span>
                          <div class="comment-date">${commentDate}</div>
						  
								<ul class="mdesc_ul mdesc_pad">
								<s:if test="%{likeStatus}">
									<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;"><i class="fa fa-fw fa-thumbs-up"></i>${likeCounts} <s:if test="likeCounts>1">Likes</s:if><s:else>Like</s:else></a></li>
								</s:if>
								<s:else>
									<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;" onclick="likeOnComment(<s:property value='commentId' />);"><i class="fa fa-fw fa-thumbs-o-up"></i>${likeCounts} <s:if test="likeCounts>1">Likes</s:if><s:else>Like</s:else></a></li>
								</s:else>
								<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;" onclick="showSubComments(<s:property value='commentId'/>);"><i class="fa fa-fw fa-comments-o"></i> ${commentCounts} <s:if test="commentCounts>1">Comments</s:if><s:else>Comment</s:else></a></li>
								
								</ul><br/>
										<!-- comment second level -->
										<div id="subCommentDivIds<s:property value='commentId'/>" style="display:none;">	
										<ul class="comments">
										<s:if test="subCommentList != null && subCommentList.size()>0">
										<s:iterator value="subCommentList">
										  <li class="media">
											<div class="media-left">
											  <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);">
												<s:if test="commentByImg!=null && commentByImg!=''">
						                            <img src='<s:property value="commentByImg" />' class="media-object img-circle width-20">
													</s:if>
													<s:else>
														<img src="view/helper/images/people/50/guy-6.jpg" class="media-object img-circle width-20">	
													</s:else>
											  </a>
											</div>
											<div class="media-body">
											  
											  <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);" class="comment-author pull-left color_blue bold"><s:property value="commentBy" /> </a>
											  <span>&nbsp;<s:property value="commentTxt" /></span>
											  <div class="comment-date"><s:property value="commentDate" />
											  
											  <ul class="mdesc_ul mdesc_pad">
												<s:if test="%{likeStatus}">
													<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;"><i class="fa fa-fw fa-thumbs-up"></i>${likeCounts} <s:if test="likeCounts>1">Likes</s:if><s:else>Like</s:else></a></li>
												</s:if>
												<s:else>
													<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;" onclick="likeOnComment(<s:property value='commentId' />);"><i class="fa fa-fw fa-thumbs-o-up"></i>${likeCounts} <s:if test="likeCounts>1">Likes</s:if><s:else>Like</s:else></a></li>
												</s:else>
												</ul>
											  </div>
											</div>
										  </li>
										  </s:iterator>
										  </s:if>						  
										  <li class="comment-form">
											<div class="media-left">
												   <a href="javaScript:;" onclick="personalProfile(${loginDetail.userId});">
												   	<s:if test="#session.loginDetail.profilePhotoFileName !=null && #session.loginDetail.profilePhotoFileName !=''">
														   <img src="${sessionScope.loginDetail.profilePhotoFileName}" class="media-object img-circle width-20">
														   </s:if>
														   <s:else>
														   	<img src="view/helper/images/people/50/guy-6.jpg" class="media-object img-circle width-20">
														   </s:else>
													</a>
												</div>
												<div class="media-body">
												<input type="text" placeholder="Write a reply..." class="form-control comment_box_r" onkeydown="if (event.keyCode == 13) commentOnComment(<s:property value='commentId' />,this.value );">
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
								<s:else>
									<s:if test="moduleDescription.commentList !=null && moduleDescription.commentList.size()>0">
									${moduleDescription.commentCounts} comment shown <span style="color: #0c80df"></span>
								<!-- comment section -->
								
								<s:iterator value="moduleDescription.commentList" begin="0">
									<li class="media">
		                        <div class="media-left">
		                          <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);">
		                            <s:if test="commentByImg!=null && commentByImg!=''">
		                            <img src='<s:property value="commentByImg" />' class="media-object img-circle width-30">
									</s:if>
									<s:else>
										<img src="view/helper/images/people/50/guy-6.jpg" class="media-object img-circle width-30">	
									</s:else>
		                          </a>
		                        </div>
                        <div class="media-body">
                          
                          <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);" class="comment-author pull-left color_blue bold">${commentBy}&nbsp;</a>
                          <span>&nbsp;${commentTxt}</span>
                          <div class="comment-date">${commentDate}</div>
						  
								<ul class="mdesc_ul mdesc_pad">
								<s:if test="%{likeStatus}">
									<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;"><i class="fa fa-fw fa-thumbs-up"></i>${likeCounts} <s:if test="likeCounts>1">Likes</s:if><s:else>Like</s:else></a></li>
								</s:if>
								<s:else>
									<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;" onclick="likeOnComment(<s:property value='commentId' />);"><i class="fa fa-fw fa-thumbs-o-up"></i>${likeCounts} <s:if test="likeCounts>1">Likes</s:if><s:else>Like</s:else></a></li>
								</s:else>
								<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;" onclick="showSubComment(<s:property value='commentId'/>);"><i class="fa fa-fw fa-comments-o"></i> ${commentCounts} <s:if test="commentCounts>1">Comments</s:if><s:else>Comment</s:else></a></li>
								
								</ul><br/>
										<!-- comment second level -->
										<div id="subCommentDivId<s:property value='commentId'/>" style="display:none;">	
										<ul class="comments">
										<s:if test="subCommentList != null && subCommentList.size()>0">
										<s:iterator value="subCommentList">
										  <li class="media">
											<div class="media-left">
											  <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);">
												<s:if test="commentByImg!=null && commentByImg!=''">
						                            <img src='<s:property value="commentByImg" />' class="media-object img-circle width-20">
													</s:if>
													<s:else>
														<img src="view/helper/images/people/50/guy-6.jpg" class="media-object img-circle width-20">	
													</s:else>
											  </a>
											</div>
											<div class="media-body">
											  
											  <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);" class="comment-author pull-left color_blue bold"><s:property value="commentBy" /> </a>
											  <span>&nbsp;<s:property value="commentTxt" /></span>
											  <div class="comment-date"><s:property value="commentDate" />
											  
											  <ul class="mdesc_ul mdesc_pad">
												<s:if test="%{likeStatus}">
													<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;"><i class="fa fa-fw fa-thumbs-up"></i>${likeCounts} <s:if test="likeCounts>1">Likes</s:if><s:else>Like</s:else></a></li>
												</s:if>
												<s:else>
													<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;" onclick="likeOnComment(<s:property value='commentId' />);"><i class="fa fa-fw fa-thumbs-o-up"></i>${likeCounts} <s:if test="likeCounts>1">Likes</s:if><s:else>Like</s:else></a></li>
												</s:else>
												</ul>
											  </div>
											</div>
										  </li>
										  </s:iterator>
										  </s:if>						  
										  <li class="comment-form">
											<div class="media-left">
												   <a href="javaScript:;" onclick="personalProfile(${loginDetail.userId});">
												   	<s:if test="#session.loginDetail.profilePhotoFileName !=null && #session.loginDetail.profilePhotoFileName !=''">
														   <img src="${sessionScope.loginDetail.profilePhotoFileName}" class="media-object img-circle width-20">
														   </s:if>
														   <s:else>
														   	<img src="view/helper/images/people/50/guy-6.jpg" class="media-object img-circle width-20">
														   </s:else>
													</a>
												</div>
												<div class="media-body">
												<input type="text" placeholder="Write a reply..." class="form-control comment_box_r" onkeydown="if (event.keyCode == 13) commentOnComment(<s:property value='commentId' />,this.value );">
											</div>
										  </li>
										</ul>
										</div>
										<!-- comment second level end-->
                        </div>
                      </li>



									</s:iterator>
									</s:if>
								
								</s:else>
								
								
					<li class="comment-form">
                        <div class="input-group">
							<span class="input-group-btn">
							   <a href="javaScript:;" onclick="personalProfile(${loginDetail.userId});" class="">
								  <s:if test="#session.loginDetail.profilePhotoFileName !=null && #session.loginDetail.profilePhotoFileName !=''">
								  	 <img src="${sessionScope.loginDetail.profilePhotoFileName}" class="media-object img-circle width-30">
								   </s:if>
								   <s:else>
								   	<img src="view/helper/images/people/50/guy-6.jpg" class="media-object img-circle width-30">
								   </s:else>
								</a>
							</span>
							<input type="text" onkeydown="if (event.keyCode == 13){commentOnResource(this.value);}" id="commentTextFieldId" class="form-control" placeholder="Write a comment.." />
						</div>
                      </li>
                    </ul>
								