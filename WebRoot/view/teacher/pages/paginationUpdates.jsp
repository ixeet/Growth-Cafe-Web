<%@ taglib prefix="s" uri="/struts-tags"%>
<s:if test="feedList.size()>0">
<s:iterator value="feedList">
             
             <script type="text/javascript">
					$(document).ready(function(){
					$('#share_button${feedId}').on('click', function(e){
					e.preventDefault();
					FB.ui(
					{
					method: 'feed',
					name: '${feedTextPost}',
					link: '${resource.resourceUrl}',
					picture: '${resource.thumbImg}',
					caption: '',
					description: '${resource.resourceDesc}',
					message: 'message'
					});
					});
					});
			</script>
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
              <div class="col-xs-12 col-md-12 col-lg-12">
				
                <div class="timeline-block1">
                  <div class="panel panel-default " style="padding: 8px;">

                    <div class="panel-heading">
                      <div class="media">
                        <div class="media-left">
                          <a  href="javaScript:;" onclick="personalProfile(${user.userId});">
                          	<s:if test="user.profilePhotoFileName !=null && user.profilePhotoFileName!=''">
                            <img src='<s:property value="user.profilePhotoFileName" />' class="media-object width-50 height-50">
                            </s:if>
                            <s:else>
                            	<img src='view/helper/images/people/50/guy-6.jpg' class="media-object width-50 height-50">
                            </s:else>
                          </a>
                        </div>
                        <div class="media-body">
						
                            <span> <s:text name="feedText"/> &nbsp;</span>
							<br><i><s:property value="feedOn" /> </i>
                        </div>
                      </div>
                    </div>

                    <div class="panel-body list-group" style="text-align: justify;">
                       <span class="font14"><s:property value="resource.resourceDesc"/></span><br/><br/>
                 
                    <!-- 4:3 aspect ratio -->
                    <div class="embed-responsive embed-responsive-4by32">
					
                       <!--  <iframe width="500" height="400" src="${resource.resourceUrl}" frameborder="0" allowfullscreen></iframe> -->
                       <video width="600" height="365" controls="" poster="${resource.thumbImg}">
							 <source src="${resource.resourceUrl}">
						</video>
                    </div>
                   		<!-- Comment Content Start -->
						<div id="feedCommentJspDivId<s:property value='feedId' />">
							
							<hr class="margin_top8">
							 <ul class="mdesc_ul mdesc_pad margin_top15m">
							 	<s:if test="%{likeStatus}">
							 		<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;"><i class="fa fa-fw fa-thumbs-up"></i>${likeCounts} <s:if test="likeCounts>1">Likes</s:if><s:else>Like</s:else></a></li>
								</s:if>
								<s:else>
									<li class="mdesc_li"><a class="color_likes bold" href="javaScript:;" onclick="likeOnFeed(<s:property value='feedId'/>)"><i class="fa fa-fw fa-thumbs-o-up" ></i>${likeCounts} <s:if test="likeCounts>1">Likes</s:if><s:else>Like</s:else></a></li>
								</s:else>
								
								<li id="comments_cl" class="mdesc_li com" ><a class="color_likes bold"  href="javaScript:;"><i class="fa fa-fw fa-comments-o"></i> ${commentCounts} <s:if test="commentCounts>1">Comments</s:if><s:else>Comment</s:else></a></li>
								<li class="mdesc_li"><a class="color_likes bold" href="javaScript:;" id="share_button<s:property value='feedId' />"><i class="fa fa-fw fa-share-square-o"></i>Share</a></li>
								
					</ul></br>
					
				<ul class="comments border_t_likes">
					<s:if test="commentList != null && commentList.size()>0 && commentList.size()<3">
					<s:iterator value="commentList">
                      <li class="media">
                        <div class="media-left">
                          <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);">
                          <s:if test="commentByImg!=null && commentByImg!=''">
                            <img src='<s:property value="commentByImg" />' class="media-object width-30">
							</s:if>
							<s:else>
								<img src="view/helper/images/people/50/guy-6.jpg" class="media-object width-30">	
							</s:else>
                          </a>
                        </div>
                        <div class="media-body">
                          
                          <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);" class="comment-author pull-left color_blue bold ">${commentBy}&nbsp;</a>
                          <span>${commentTxt}</span>
                          <div class="comment-date">${commentDate}</div>
						  
								<ul class="mdesc_ul mdesc_pad">
								<s:if test="%{likeStatus}">
									<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;"><i class="fa fa-fw fa-thumbs-up"></i>${likeCounts} <s:if test="likeCounts>1">Likes</s:if><s:else>Like</s:else> </a></li>
								</s:if>
								<s:else>
									<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;" onclick="likeOnFeedComment(<s:property value='feedId' />,<s:property value='commentId' />);"><i class="fa fa-fw fa-thumbs-o-up"></i>${likeCounts} <s:if test="likeCounts>1">Likes</s:if><s:else>Like</s:else></a></li>
								</s:else>
								<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold"  href="javaScript:;" onclick="showSubComment(<s:property value='commentId'/>);"><i class="fa fa-fw fa-comments-o"></i> ${commentCounts} <s:if test="commentCounts>1">Comments</s:if><s:else>Comment</s:else></a></li>
								
								</ul></br>
										<!-- comment second level -->
									<div id="subCommentDivId<s:property value='commentId'/>" style="display:none;">	
										<ul class="comments">
										<s:if test="subCommentList != null && subCommentList.size()>0">
										<s:iterator value="subCommentList">
										  <li class="media">
											<div class="media-left">
											  <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);">
												<s:if test="commentByImg !=null && commentByImg !=''">
												<img src='<s:property value="commentByImg" />' class="media-object  width-20">
												</s:if>
												<s:else>
													<img src="view/helper/images/people/50/guy-6.jpg" class="media-object width-20">	
												</s:else>
											  </a>
											</div>
											<div class="media-body">
											  
											  <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);" class="comment-author pull-left color_blue bold"><s:property value="commentBy" /> </a>
											  <span>&nbsp;<s:property value="commentTxt" /></span>
											  <div class="comment-date"><s:property value="commentDate" /></div>
											  <ul class="mdesc_ul mdesc_pad">
												<s:if test="%{likeStatus}">
													<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;"><i class="fa fa-fw fa-thumbs-up"></i>${likeCounts} <s:if test="likeCounts>1">Likes</s:if><s:else>Like</s:else></a></li>
												</s:if>
												<s:else>
													<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold"  href="javaScript:;" onclick="likeOnFeedComment(<s:property value='feedId' />,<s:property value='commentId' />);"><i class="fa fa-fw fa-thumbs-o-up"></i>${likeCounts} <s:if test="likeCounts>1">Likes</s:if><s:else>Like</s:else></a></li>
												</s:else>
												</ul>
											</div>
										  </li>
										  </s:iterator>
										  </s:if>						  
										  <li class="comment-form">
											<div class="media-left">
												   <s:if test="#session.loginDetail.profilePhotoFileName !=null && #session.loginDetail.profilePhotoFileName !=''">
													   <a href="javaScript:;" onclick="personalProfile(${loginDetail.userId});" class=""><img src="${sessionScope.loginDetail.profilePhotoFileName}" class="media-object  width-20"></i></a>
													   </s:if>
													   <s:else>
													   	<a href="javaScript:;" onclick="personalProfile(${loginDetail.userId});" class=""><img src="view/helper/images/people/50/guy-6.jpg" class="media-object  width-20"></i></a>
													   </s:else>
												</div>
												<div class="media-body">
												<input type="text" placeholder="Write a reply..." class="form-control comment_box_r" onkeydown="if (event.keyCode == 13) commentOnFeedComment(${feedId},<s:property value='commentId' />,this.value  );">
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
		                      <div class="view_all" id="commentTextId">
									2 of ${commentCounts} comments shown
									<span style="color: #0c80df">
									<a class="color_blue bold"onclick="viewAllComments(<s:property value='feedId' />);" href="javaScript:;">View all comments</a>
									</span>
									</div>
                      <s:iterator value="commentList" begin="0" end="1">
                      <li class="media">
                        <div class="media-left">
                          <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);">
                            <s:if test="commentByImg!=null && commentByImg!=''">
                            <img src='<s:property value="commentByImg" />' class="media-object  width-30">
							</s:if>
							<s:else>
								<img src="view/helper/images/people/50/guy-6.jpg" class="media-object  width-30">	
							</s:else>
                          </a>
                        </div>
                        <div class="media-body">
                          
                          <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);" class="comment-author pull-left color_blue bold">${commentBy}&nbsp;</a>
                          <span>${commentTxt}</span>
                          <div class="comment-date">${commentDate}</div>
						  
								<ul class="mdesc_ul mdesc_pad">
								<s:if test="%{likeStatus}">
									<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;"><i class="fa fa-fw fa-thumbs-up"></i>${likeCounts} <s:if test="likeCounts>1">Likes</s:if><s:else>Like</s:else></a></li>
								</s:if>
								<s:else>
									<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;" onclick="likeOnFeedComment(<s:property value='feedId' />,<s:property value='commentId' />);"><i class="fa fa-fw fa-thumbs-o-up"></i>${likeCounts} <s:if test="likeCounts>1">Likes</s:if><s:else>Like</s:else></a></li>
								</s:else>
								<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;" onclick="showSubComment(<s:property value='commentId'/>);"><i class="fa fa-fw fa-comments-o"></i> ${commentCounts} <s:if test="commentCounts>1">Comments</s:if><s:else>Comment</s:else></a></li>
								
								</ul></br>
										<!-- comment second level -->
										<div id="subCommentDivId<s:property value='commentId'/>" style="display:none;">
										<ul class="comments">
										<s:if test="subCommentList != null && subCommentList.size()>0">
										<s:iterator value="subCommentList">
										  <li class="media">
											<div class="media-left">
											  <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);">
												<s:if test="commentByImg !=null && commentByImg !=''">
												<img src='<s:property value="commentByImg" />' class="media-object  width-20">
												</s:if>
												<s:else>
													<img src="view/helper/images/people/50/guy-6.jpg" class="media-object  width-20">	
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
													<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;" onclick="likeOnFeedComment(<s:property value='feedId' />,<s:property value='commentId' />);"><i class="fa fa-fw fa-thumbs-o-up"></i>${likeCounts} <s:if test="likeCounts>1">Likes</s:if><s:else>Like</s:else></a></li>
												</s:else>
												</ul>
											  </div>
											</div>
										  </li>
										  </s:iterator>
										  </s:if>						  
										  <li class="comment-form">
											<div class="media-left">
												   <s:if test="#session.loginDetail.profilePhotoFileName !=null && #session.loginDetail.profilePhotoFileName !=''">
													   <a href="javaScript:;" onclick="personalProfile(${loginDetail.userId});" class=""><img src="${sessionScope.loginDetail.profilePhotoFileName}" class="media-object  width-20"></i></a>
													   </s:if>
													   <s:else>
													   	<a href="javaScript:;" onclick="personalProfile(${loginDetail.userId});" class=""><img src="view/helper/images/people/50/guy-6.jpg" class="media-object  width-20"></i></a>
													   </s:else>
												</div>
												<div class="media-body">
												<input type="text" placeholder="Write a reply..." class="form-control comment_box_r" onkeydown="if (event.keyCode == 13) commentOnFeedComment(${feedId},<s:property value='commentId' />,this.value  );">
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
                            	<s:if test="commentByImg !=null && commentByImg !=''">
								<img src='<s:property value="commentByImg" />' class="media-object  width-30">
								</s:if>
								<s:else>
									<img src="view/helper/images/people/50/guy-6.jpg" class="media-object width-30">	
								</s:else>
                          </a>
                        </div>
                        <div class="media-body">
                          
                          <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);" class="comment-author pull-left color_blue bold">${commentBy}&nbsp;</a>
                          <span>${commentTxt}</span>
                          <div class="comment-date">${commentDate}</div>
						  
								<ul class="mdesc_ul mdesc_pad">
								<s:if test="%{likeStatus}">
									<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;"><i class="fa fa-fw fa-thumbs-up"></i>${likeCounts} <s:if test="likeCounts>1">Likes</s:if><s:else>Like</s:else></a></li>
								</s:if>
								<s:else>
									<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;" onclick="likeOnFeedComment(<s:property value='feedId' />,<s:property value='commentId' />);"><i class="fa fa-fw fa-thumbs-o-up"></i>${likeCounts} <s:if test="likeCounts>1">Likes</s:if><s:else>Like</s:else></a></li>
								</s:else>
								<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;" onclick="showSubComment(<s:property value='commentId'/>);"><i class="fa fa-fw fa-comments-o"></i> ${commentCounts} <s:if test="commentCounts>1">Comments</s:if><s:else>Comment</s:else></a></li>
								
								</ul></br>
										<!-- comment second level -->
										<div id="subCommentDivId<s:property value='commentId'/>" style="display:none;">
										<ul class="comments">
										<s:if test="subCommentList != null && subCommentList.size()>0">
										<s:iterator value="subCommentList">
										  <li class="media">
											<div class="media-left">
											  <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);">
											  	<s:if test="commentByImg !=null && commentByImg !=''">
												<img src='<s:property value="commentByImg" />' class="media-object width-20">
												</s:if>
												<s:else>
													<img src="view/helper/images/people/50/guy-6.jpg" class="media-object  width-20">	
												</s:else>
											  </a>
											</div>
											<div class="media-body">
											  
											  <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);" class="comment-author pull-left color_blue bold"><s:property value="commentBy" /> </a>
											  <span>&nbsp; <s:property value="commentTxt" /></span>
											  <div class="comment-date"><s:property value="commentDate" />
											  
											  <ul class="mdesc_ul mdesc_pad">
												<s:if test="%{likeStatus}">
													<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;"><i class="fa fa-fw fa-thumbs-up"></i>${likeCounts} <s:if test="likeCounts>1">Likes</s:if><s:else>Like</s:else></a></li>
												</s:if>
												<s:else>
													<li class="mdesc_li pad_0 boder_0"><a class="color_likes bold" href="javaScript:;" onclick="likeOnFeedComment(<s:property value='feedId' />,<s:property value='commentId' />);"><i class="fa fa-fw fa-thumbs-o-up"></i>${likeCounts} <s:if test="likeCounts>1">Likes</s:if><s:else>Like</s:else></a></li>
												</s:else>
												</ul>
											  </div>
											</div>
										  </li>
										  </s:iterator>
										  </s:if>						  
										  <li class="comment-form">
											<div class="media-left">
													<a href="javaScript:;" onclick="personalProfile(${loginDetail.userId});" class="">
													   <s:if test="#session.loginDetail.profilePhotoFileName !=null && #session.loginDetail.profilePhotoFileName !=''">
														   <img src="${sessionScope.loginDetail.profilePhotoFileName}" class="media-object  width-20">
														   </s:if>
														   <s:else>
														   	<img src="view/helper/images/people/50/guy-6.jpg" class="media-object width-20">
														   </s:else>
													   </a>
												</div>
												<div class="media-body">
												<input type="text" placeholder="Write a reply..." class="form-control comment_box_r" onkeydown="if (event.keyCode == 13) commentOnFeedComment(${feedId},<s:property value='commentId' />,this.value  );">
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
							<a href="javaScript:;" onclick="personalProfile(${loginDetail.userId});" class="">
								<s:if test="#session.loginDetail.profilePhotoFileName !=null && #session.loginDetail.profilePhotoFileName !=''">
							  	 <img src="${sessionScope.loginDetail.profilePhotoFileName}" class="media-object  width-30">
							   </s:if>
							   <s:else>
							   	<img src="view/helper/images/people/50/guy-6.jpg" class="media-object  width-30">
							   </s:else>
							   </a>
							</span>
							<input type="text" placeholder="Write a comment..." class="form-control comment_box_m" onkeydown="if (event.keyCode == 13) commentOnFeed(<s:property value='feedId' />,this.value  );">
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
                
              </s:if>
              <s:else>
              <div id="noMoreUpdateDivId">
              There are no more updates
              </div>
              
              </s:else>