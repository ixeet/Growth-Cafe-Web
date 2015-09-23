<%@ taglib prefix="s" uri="/struts-tags"%>
 <ul class="mdesc_ul mdesc_pad">
					 <s:if test="%{feedDetails.likeStatus}">
					 			<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;"><i class="fa fa-fw fa-thumbs-up"></i>${feedDetails.likeCounts} <s:if test="feedDetails.likeCounts>1">Likes</s:if><s:else>Like</s:else></a></li>
								</s:if>
								<s:else>
									<li class="mdesc_li"><a class="color_likes bold" href="javaScript:;" onclick="likeOnFeed(${feedDetails.feedId})"><i class="fa fa-fw fa-thumbs-o-up" ></i>${FeedDetails.likeCounts} <s:if test="feedDetails.likeCounts>1">Likes</s:if><s:else>Like</s:else></a></li>
								</s:else>
								<li id="comments_cl" class="mdesc_li com" ><a class="color_likes bold" href="javaScript:;"><i class="fa fa-fw fa-comments-o"></i> ${feedDetails.commentCounts} <s:if test="feedDetails.commentCounts>1">Comments</s:if><s:else>Comment</s:else></a></li>
								<!-- <li class="mdesc_li"><a href="javaScript:;"><i class="fa fa-fw fa-share-square-o"></i>300 Share</a></li> -->
								
					</ul><br/>
					
				<ul class="comments border_t_likes">
				<s:if test="feedDetails.commentList != null && feedDetails.commentList.size()>0 && feedDetails.commentList.size()<3">
					<s:iterator value="feedDetails.commentList">
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
                          <a href="" class="comment-author pull-left color_blue bold color_blue bold">${commentBy} &nbsp; </a>
                          <span> &nbsp; ${commentTxt}</span>
                          <div class="comment-date">${commentDate}</div>
						  
								<ul class="mdesc_ul mdesc_pad">
								<s:if test="%{likeStatus}">
									<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold"href="javaScript:;"><i class="fa fa-fw fa-thumbs-up"></i>${likeCounts} Like</a></li>
								</s:if>
								<s:else>
									<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;" onclick="likeOnFeedComment(${feedDetails.feedId},<s:property value='commentId' />);"><i class="fa fa-fw fa-thumbs-o-up"></i>${likeCounts} <s:if test="likeCounts>1">Likes</s:if><s:else>Like</s:else></a></li>
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
											  
											  <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);" class="comment-author pull-left color_blue bold color_blue bold"><s:property value="commentBy" /> </a>
											  <span>&nbsp;<s:property value="commentTxt" /></span>
											  <div class="comment-date"><s:property value="commentDate" />
											  
											  <ul class="mdesc_ul mdesc_pad">
												<s:if test="%{likeStatus}">
													<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;"><i class="fa fa-fw fa-thumbs-up"></i>${likeCounts} <s:if test="likeCounts>1">Likes</s:if><s:else>Like</s:else></a></li>
												</s:if>
												<s:else>
													<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;" onclick="likeOnFeedComment(${feedDetails.feedId},<s:property value='commentId' />);"><i class="fa fa-fw fa-thumbs-o-up"></i>${likeCounts} <s:if test="likeCounts>1">Likes</s:if><s:else>Like</s:else></a></li>
												</s:else>
												</ul>
											  </div>
											</div>
										  </li>
										  </s:iterator>
										  </s:if>						  
										  <li class="comment-form">
											<div class="media-left">
												   <a href="javaScript:;" onclick="personalProfile(${logDetail.userId});">
												   <s:if test="#session.teacherloginDetail.profilePhotoFileName !=null && #session.teacherloginDetail.profilePhotoFileName !=''">
												   <img src="${sessionScope.teacherloginDetail.profilePhotoFileName}" class="media-object img-circle width-20">
												   </s:if>
												   <s:else>
												   	<img src="view/helper/images/people/50/guy-6.jpg" class="media-object img-circle width-20">
												   </s:else>
												   </a>
												</div>
												<div class="media-body">
												<input type="text" placeholder="Write a reply..." class="form-control comment_box_r" onkeydown="if (event.keyCode == 13) commentOnFeedComment(${feedDetails.feedId},<s:property value='commentId' />,this.value  );">
											</div>
										  </li>
										</ul>
										</div>
										<!-- comment second level end-->
                        </div>
                      </li>
                      </s:iterator>
                      </s:if>
                      <s:else>
                      <div id="twoCommentsDivId${feedDetails.feedId}">
                      <s:if test="feedDetails.commentList !=null">
		                      <span id="commentTextId">
									2 of ${commentCounts} comments shown
									<span style="color: #0c80df">
									<a class="color_blue bold" onclick="viewAllComments(${feedDetails.feedId});" href="javaScript:;">View all comments</a>
									</span>
									</span>
                      <s:iterator value="feedDetails.commentList" begin="0" end="1">
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
									<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;" onclick="likeOnFeedComment(${feedDetails.feedId},<s:property value='commentId' />);"><i class="fa fa-fw fa-thumbs-o-up"></i>${likeCounts} <s:if test="likeCounts>1">Likes</s:if><s:else>Like</s:else></a></li>
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
													<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;" onclick="likeOnFeedComment(${feedDetails.feedId},<s:property value='commentId' />);"><i class="fa fa-fw fa-thumbs-o-up"></i>${likeCounts} <s:if test="likeCounts>1">Likes</s:if><s:else>Like</s:else></a></li>
												</s:else>
												</ul>
											  </div>
											</div>
										  </li>
										  </s:iterator>
										  </s:if>						  
										  <li class="comment-form">
											<div class="media-left">
												   <a href="javaScript:;" onclick="personalProfile(${teacherloginDetail.userId});">
												   		<s:if test="#session.teacherloginDetail.profilePhotoFileName !=null && #session.teacherloginDetail.profilePhotoFileName !=''">
														   <img src="${sessionScope.teacherloginDetail.profilePhotoFileName}" class="media-object img-circle width-20">
														   </s:if>
														   <s:else>
														   	<img src="view/helper/images/people/50/guy-6.jpg" class="media-object img-circle width-20">
														   </s:else>
												   </a>
												</div>
												<div class="media-body">
												<input type="text" placeholder="Write a reply..." class="form-control comment_box_r" onkeydown="if (event.keyCode == 13) commentOnFeedComment(${feedDetails.feedId},<s:property value='commentId' />,this.value  );">
											</div>
										  </li>
										</ul>
										</div>
										<!-- comment second level end-->
                        </div>
                      </li>
                       </s:iterator>
                      </s:if>
                      </div>
                      </s:else>
                      <s:if test="FeedDetails.commentList != null && FeedDetails.commentList.size()>0 ">
                      <div id="allCommentDivId${feedDetails.feedId}" style="display: none;">
                      <s:iterator value="FeedDetails.commentList" >
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
									<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;" onclick="likeOnFeedComment(${feedDetails.feedId},<s:property value='commentId' />);"><i class="fa fa-fw fa-thumbs-o-up"></i>${likeCounts} <s:if test="likeCounts>1">Likes</s:if><s:else>Like</s:else></a></li>
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
													<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;" onclick="likeOnFeedComment(${feedDetails.feedId},<s:property value='commentId' />);"><i class="fa fa-fw fa-thumbs-o-up"></i>${likeCounts} <s:if test="likeCounts>1">Likes</s:if><s:else>Like</s:else></a></li>
												</s:else>
												</ul>
											  </div>
											</div>
										  </li>
										  </s:iterator>
										  </s:if>						  
										  <li class="comment-form">
											<div class="media-left">
												   <a href="javaScript:;" onclick="personalProfile(${teacherloginDetail.userId});">
												   	<s:if test="#session.teacherloginDetail.profilePhotoFileName !=null && #session.teacherloginDetail.profilePhotoFileName !=''">
														   <img src="${sessionScope.teacherloginDetail.profilePhotoFileName}" class="media-object img-circle width-20">
														   </s:if>
														   <s:else>
														   	<img src="view/helper/images/people/50/guy-6.jpg" class="media-object img-circle width-20">
														   </s:else>
													</a>
												</div>
												<div class="media-body">
												<input type="text" placeholder="Write a reply..." class="form-control comment_box_r" onkeydown="if (event.keyCode == 13) commentOnFeedComment(${feedDetails.feedId},<s:property value='commentId' />,this.value  );">
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
							   <a href="javaScript:;" onclick="personalProfile(${teacherloginDetail.userId});" class="">
								  <s:if test="#session.teacherloginDetail.profilePhotoFileName !=null && #session.teacherloginDetail.profilePhotoFileName !=''">
								  	 <img src="${sessionScope.teacherloginDetail.profilePhotoFileName}" class="media-object img-circle width-30">
								   </s:if>
								   <s:else>
								   	<img src="view/helper/images/people/50/guy-6.jpg" class="media-object img-circle width-30">
								   </s:else>
								</a>
							</span>
							<input type="text" class="form-control comment_box_m"  placeholder="Write a comment..." onkeydown="if (event.keyCode == 13) commentOnFeed(${feedDetails.feedId},this.value  );">
						</div>
                      </li>
                    </ul>
                    
