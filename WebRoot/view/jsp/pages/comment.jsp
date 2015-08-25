 <%@ taglib prefix="s" uri="/struts-tags"%>
 
 <script type="text/javascript">
 
 </script>
 
 
 <%-- You,<span style="color: #0c80df"> <a href="#">John</a>, <a href="#">Bill</a> and --%> ${moduleDescription.likeCounts} <%-- </span> --%>like this
							 <hr/>
							 <div id="remainingCommentDivId" style="display: none;">
								<s:if test="moduleDescription.commentList !=null && moduleDescription.commentList.size()>2">
									<!-- comment section -->
									
									<s:iterator value="moduleDescription.commentList" begin="0">
										<div class="media s-container">
											<div class="media-left">
														<a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);">
															<img src="view/helper/images/people/50/guy-6.jpg" alt="people" class="img-circle width-40">
														</a>
											</div>
											<div class="media-body">
												<div class="panel panel-default">
													<div class="panel-body">
														<div class="text-subhead-2">${commentBy} <span class="text-caption text-light">- ${commentDate} </span></div>
														<p>&nbsp;${commentTxt}</p>
														<%-- <ul class="mdesc_ul">
												<li class="mdesc_li"><a href="javaScript:;" onclick="likeOnComment(<s:property value='commentId' />);"><i class="fa fa-fw fa-thumbs-o-up"></i>Like</a></li>
											</ul><br/> --%>
											
											
											
											 <ul class="mdesc_ul mdesc_pad">
											 <s:if test="%{likeStatus}">
											 	<li class="mdesc_li"><a href="javaScript:;"><i class="fa fa-fw fa-thumbs-up" ></i>${likeCounts} Like</a></li>
												</s:if>
												<s:else>
													<li class="mdesc_li"><a href="javaScript:;" onclick="likeOnComment(<s:property value='commentId' />);"><i class="fa fa-fw fa-thumbs-o-up" ></i>${likeCounts} Like</a></li>
												</s:else>
													<li id="comments_cl" class="mdesc_li com" ><a href="javaScript:;"><i class="fa fa-fw fa-comments-o"></i> ${commentCounts} Comment</a></li>
										</ul><br/>
											
											
											
											
											<!-- sub Comment start -->
											<ul class="comments">
										<s:if test="subCommentList != null && subCommentList.size()>0">
										<s:iterator value="subCommentList">
										  <li class="media">
											<div class="media-left">
											  <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);">
												<img src="view/helper/images/people/50/guy-6.jpg" class="img-circle width-30">
											  </a>
											</div>
											<div class="media-body">
											  
											  <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);" class="comment-author pull-left">${commentBy}</a>
											  <span>&nbsp;${commentTxt}</span>
											  <div class="comment-date">${commentDate}
											  	<ul class="mdesc_ul mdesc_pad">
													<s:if test="%{likeStatus}">
													<li class="mdesc_li"><a href="javaScript:;"><i class="fa fa-fw fa-thumbs-up" ></i>${likeCounts} Like</a></li>
												</s:if>
												<s:else>
													<li class="mdesc_li"><a href="javaScript:;" onclick="likeOnComment(<s:property value='commentId' />);"><i class="fa fa-fw fa-thumbs-o-up" ></i>${likeCounts} Like</a></li>
												</s:else>
												</ul><br/>
											  
											  </div>
											</div>
										  </li>
										  </s:iterator>
										  </s:if>
										  								  
										  <li class="comment-form">
											<div class="input-group">
												<div class="media-left">
						                          <a href="javaScript:;" onclick="personalProfile(${loginDetail.userId});" class="btn btn-default"><img src="view/helper/images/people/50/guy-6.jpg" class="media-object img-circle width-30"></a>
						                        </div>
												<input type="text" onkeydown="if (event.keyCode == 13) commentOnComment(<s:property value='commentId' />,this.value );" class="form-control">
											</div>
										  </li>
										</ul>
									
									<!-- sub comment end -->
													</div>
												</div>
											</div>
										</div>
										</s:iterator>
								</s:if>
								</div>
							 <s:if test="moduleDescription.commentList !=null && moduleDescription.commentList.size()>2">
							 <div id="currentCommentDivId">
							 <span id="commentTextId">
							2 of ${moduleDescription.commentCounts} comments shown<span style="color: #0c80df"> <a href="javaScript:;" onclick="moreComments();">View all comments</a></span>
							</span>
							<!-- comment section -->
							
							<s:iterator value="moduleDescription.commentList" begin="0" end="1">
								<div class="media s-container">
									<div class="media-left">
												<a href="">
													<img src="view/helper/images/people/50/guy-6.jpg" alt="people" class="img-circle width-40">
												</a>
									</div>
									<div class="media-body">
										<div class="panel panel-default">
											<div class="panel-body">
												<div class="text-subhead-2">${commentBy} <span class="text-caption text-light">- ${commentDate} </span></div>
												<p>${commentTxt}</p>
												 <ul class="mdesc_ul mdesc_pad">
													<s:if test="%{likeStatus}">
													<li class="mdesc_li"><a href="javaScript:;"><i class="fa fa-fw fa-thumbs-up" ></i>${likeCounts} Like</a></li>
												</s:if>
												<s:else>
													<li class="mdesc_li"><a href="javaScript:;" onclick="likeOnComment(<s:property value='commentId' />);"><i class="fa fa-fw fa-thumbs-o-up" ></i>${likeCounts} Like</a></li>
												</s:else>
													<li id="comments_cl" class="mdesc_li com" ><a href="javaScript:;"><i class="fa fa-fw fa-comments-o"></i> ${commentCounts} Comment</a></li>
										</ul><br/>
											<!-- sub Comment start -->
												<ul class="comments">
										<s:if test="subCommentList != null && subCommentList.size()>0">
										<s:iterator value="subCommentList">
										  <li class="media">
											<div class="media-left">
											  <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);">
												<img src="view/helper/images/people/50/guy-6.jpg" class="img-circle width-30">
											  </a>
											</div>
											<div class="media-body">
											  
											  <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);" class="comment-author pull-left">${commentBy}</a>
											  <span>&nbsp;${commentTxt}</span>
											  <div class="comment-date">${commentDate}
											  	<ul class="mdesc_ul mdesc_pad">
												<s:if test="%{likeStatus}">
													<li class="mdesc_li"><a href="javaScript:;"><i class="fa fa-fw fa-thumbs-up" ></i>${likeCounts} Like</a></li>
												</s:if>
												<s:else>
													<li class="mdesc_li"><a href="javaScript:;" onclick="likeOnComment(<s:property value='commentId' />);"><i class="fa fa-fw fa-thumbs-o-up" ></i>${likeCounts} Like</a></li>
												</s:else>
												</ul><br/>
											  
											  </div>
											</div>
										  </li>
										  </s:iterator>
										  </s:if>
										  								  
										  <li class="comment-form">
											<div class="input-group">
												<div class="media-left">
						                          <a href="javaScript:;" onclick="personalProfile(${loginDetail.userId});" class="btn btn-default"><img src="view/helper/images/people/50/guy-6.jpg" class="media-object img-circle width-30"></a>
						                        </div>
												<input type="text" onkeydown="if (event.keyCode == 13) commentOnComment(<s:property value='commentId' />,this.value );" class="form-control">
											</div>
										  </li>
										</ul>
									
									<!-- sub comment end -->
											</div>
										</div>
									</div>
									
									
									
									
									
								</div>
								</s:iterator>
								</div>
								</s:if>
								<s:else>
									<s:if test="moduleDescription.commentList !=null && moduleDescription.commentList.size()>0">
									${moduleDescription.commentCounts} comments shown <span style="color: #0c80df"></span>
								<!-- comment section -->
								
								<s:iterator value="moduleDescription.commentList" begin="0">
									<div class="media s-container">
										<div class="media-left">
													<a href="">
														<img src="view/helper/images/people/50/guy-6.jpg" alt="people" class="img-circle width-40">
													</a>
										</div>
										<div class="media-body">
											<div class="panel panel-default">
												<div class="panel-body">
													<div class="text-subhead-2">${commentBy} <span class="text-caption text-light">- ${commentDate} </span></div>
													<p>${commentTxt}</p>
												 <ul class="mdesc_ul mdesc_pad">
													<s:if test="%{likeStatus}">
													<li class="mdesc_li"><a href="javaScript:;"><i class="fa fa-fw fa-thumbs-up" ></i>${likeCounts} Like</a></li>
												</s:if>
												<s:else>
													<li class="mdesc_li"><a href="javaScript:;" onclick="likeOnComment(<s:property value='commentId' />);"><i class="fa fa-fw fa-thumbs-o-up" ></i>${likeCounts} Like</a></li>
												</s:else>
													<li id="comments_cl" class="mdesc_li com" ><a href="javaScript:;"><i class="fa fa-fw fa-comments-o"></i> ${commentCounts} Comment</a></li>
												</ul><br/>
											<!-- sub Comment start -->
												<ul class="comments">
										<s:if test="subCommentList != null && subCommentList.size()>0">
										<s:iterator value="subCommentList">
										  <li class="media">
											<div class="media-left">
											  <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);">
												<img src="view/helper/images/people/50/guy-6.jpg" class="img-circle width-30">
											  </a>
											</div>
											<div class="media-body">
											  
											  <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);" class="comment-author pull-left">${commentBy}</a>
											  <span>&nbsp;${commentTxt}</span>
											  <div class="comment-date">${commentDate}
											  	<ul class="mdesc_ul mdesc_pad">
													<s:if test="%{likeStatus}">
													<li class="mdesc_li"><a href="javaScript:;"><i class="fa fa-fw fa-thumbs-up" ></i>${likeCounts} Like</a></li>
												</s:if>
												<s:else>
													<li class="mdesc_li"><a href="javaScript:;" onclick="likeOnComment(<s:property value='commentId' />);"><i class="fa fa-fw fa-thumbs-o-up" ></i>${likeCounts} Like</a></li>
												</s:else>
												</ul><br/>
											  
											  </div>
											</div>
										  </li>
										  </s:iterator>
										  </s:if>
										  								  
										  <li class="comment-form">
											<div class="input-group">
												<div class="media-left">
						                          <a href="javaScript:;" onclick="personalProfile(${loginDetail.userId});" class="btn btn-default"><img src="view/helper/images/people/50/guy-6.jpg" class="media-object img-circle width-30"></a>
						                        </div>
												<input type="text" onkeydown="if (event.keyCode == 13) commentOnComment(<s:property value='commentId' />,this.value );" class="form-control">
											</div>
										  </li>
										</ul>
									
									<!-- sub comment end -->
												</div>
											</div>
										</div>
									</div>



									</s:iterator>
									</s:if>
								
								</s:else>
								
								<div class="media s-container">
									<div class="media-left">
												<a href="">
													<img src="view/helper/images/people/50/guy-6.jpg" alt="people" class="img-circle width-40">
												</a>
									</div>
									<div class="media-body">
										<div class="panel panel-default">
											<div class="panel-body">
												<input type="text" onkeydown="if (event.keyCode == 13){commentOnResource(this.value);}" id="commentTextFieldId" class="form-control" placeholder="Write a comment.." />
											</div>
										</div>
									</div>
								</div>
								
					<%-- <ul class="comments">
                      <li class="media">
                        <div class="media-left">
                          <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);">
                            <img src="view/helper/images/people/50/guy-6.jpg" class="img-circle width-40">
                          </a>
                        </div>
                        <div class="media-body">
                          
                          <a href="" class="comment-author pull-left">${commentBy}</a>
                          <span>&nbsp;${commentTxt}</span>
                          <div class="comment-date">${commentDate}</div>
												<ul class="mdesc_ul mdesc_pad">
												<s:if test="%{likeStatus}">
													<li class="mdesc_li pad_0 boder_0"><a href="javaScript:;"><i class="fa fa-fw fa-thumbs-o-up"></i>${likeCounts} Like</a></li>
												</s:if>
												<s:else>
													<li class="mdesc_li pad_0 boder_0"><a href="javaScript:;"><i class="fa fa-fw fa-thumbs-o-up"></i>${likeCounts} Like</a></li>
												</s:else>
												<li class="mdesc_li pad_0 boder_0"><a href="#"><i class="fa fa-fw fa-comments-o"></i> ${commentCounts} Comment</a></li>
												</ul><br/>
										<!-- subcomment started -->
										<ul class="comments">
										<s:if test="subCommentList != null && subCommentList.size()>0">
										<s:iterator value="subCommentList">
										  <li class="media">
											<div class="media-left">
											  <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);">
												<img src="view/helper/images/people/50/guy-6.jpg" class="img-circle width-30">
											  </a>
											</div>
											<div class="media-body">
											  
											  <a href="javaScript:;" onclick="personalProfile(<s:property value="commentById" />);" class="comment-author pull-left">${commentBy}</a>
											  <span>&nbsp;${commentTxt}</span>
											  <div class="comment-date">${commentDate}
											  	<ul class="mdesc_ul mdesc_pad">
													<s:if test="%{likeStatus}">
													<li class="mdesc_li"><a href="javaScript:;" onclick="likeOnComment(<s:property value='commentId' />);"><i class="fa fa-fw fa-thumbs-o-up" ></i>${likeCounts} Like</a></li>
												</s:if>
												<s:else>
													<li class="mdesc_li"><a href="javaScript:;"><i class="fa fa-fw fa-thumbs-up" ></i>${likeCounts} Like</a></li>
												</s:else>
												</ul><br/>
											  
											  </div>
											</div>
										  </li>
										  </s:iterator>
										  </s:if>
										  								  
										  <li class="comment-form">
											<div class="input-group">
												<div class="media-left">
						                          <a href="javaScript:;" onclick="personalProfile(${loginDetail.userId});" class="btn btn-default"><img src="view/helper/images/people/50/guy-6.jpg" class="media-object img-circle width-30"></a>
						                        </div>
												<input type="text" onkeydown="if (event.keyCode == 13) commentOnComment(<s:property value='commentId' />,this.value );" class="form-control">
											</div>
										  </li>
										</ul>
										<!-- subcomment end -->
                        </div>
                      </li>
                      <li class="comment-form">
                        <div class="input-group">
							<div class="media-left">
                          <a href="javaScript:;" onclick="personalProfile(${loginDetail.userId});" class="btn btn-default"><img src="view/helper/images/people/50/guy-6.jpg" class="media-object img-circle width-40"></a>
                        </div>
							<input type="text" onkeydown="if (event.keyCode == 13) commentOnResource(this.value );" id="commentTextFieldId" class="form-control">
						</div>
                      </li>
                    </ul> --%>
								