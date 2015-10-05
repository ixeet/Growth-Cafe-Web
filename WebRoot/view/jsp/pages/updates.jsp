<%@ taglib prefix="s" uri="/struts-tags"%>
<div id="fb-root"></div>

<script>
window.fbAsyncInit = function() {
FB.init({
appId : '1658101907755550',
status : true, // check login status
cookie : true, // enable cookies to allow the server to access the session
xfbml : true // parse XFBML
});
};
 
(function() {
var e = document.createElement('script');
e.src = document.location.protocol + '//connect.facebook.net/en_US/all.js';
e.async = true;
document.getElementById('fb-root').appendChild(e);
}());
</script>



<script type="text/javascript">

var eventStatus=true;
 $(function () {
             var $win = $(window);
			var lastScrollTop = 0;
             $win.scroll(function (event) {
             jQuery.support.cors = true;
                 var st = $win.scrollTop();
  				 if (st > lastScrollTop){
                 if ($win.height() + $win.scrollTop()
                                > Math.round(($(document).height()*.9)) && eventStatus) {
                               /*  $("#paginationContentId").append("<img src='view/helper/images/animatedLoading.gif' style='margin-left: 50%;' alt='loading please wait' id='loadingUpdateImgId'>"); */
                                eventStatus=false;
                                $("#loader").append("<div id='top'><img  style='margin:252px 0 0 259px;' width='160px' height='120px' src='view/helper/images/animatedLoading.gif'/></div>");
                                $.ajax({
									url : "paginationUpdates",
									data :{"offset":1},
									type: "POST",
									beforeSend :function(){
									},
									success : function(result){
									$("#noMoreUpdateDivId").remove();
										$("#paginationContentId").append(result);
										/* $("#loadingUpdateImgId").remove(); */
										eventStatus=true;
										$("#top").remove();
									},
						        });
                 }
                }
                lastScrollTop = st;
             });
             
         });


function getModules(courseId){
	window.location="getModules?courseId="+courseId;
}

function moduleDescription(moduleId,courseId){
	window.location="moduleDescription?moduleId="+moduleId+"&courseId="+courseId;
	}


var commentStaus=true;

function commentOnFeed(feedId, commentTxt){
	
	if(commentTxt!="" && commentStaus){
	commentStaus=false;
		$.ajax({
				url : "commentOnFeed",
				type :"post",
				data :{"feedId":feedId,"commentTxt":commentTxt},
				beforeSend :function(){
					$(this).val("");
				},
				success : function(data){
				commentStaus=true;
				$("#feedCommentJspDivId"+feedId).html(data);
				},
	        });
	        }
      /*   var commentDiv='<li class="media">'+
                        '<div class="media-left">'+
                          '<a href="">'+
                            '<img src="view/helper/images/people/50/guy-5.jpg" class="media-object  width-30">'+
                         '</a>'+
                        '</div>'+
                        '<div class="media-body">'+
                          
                          '<a href="" class="comment-author pull-left">${commentBy}&nbsp;</a>'+
                          '<span>${commentTxt}</span>'+
                          '<div class="comment-date">'+commentTxt+'</div>'+
        				'</div>'+
                      '</li>';
                      $('#feedCommentJspDivId').find(' > li:nth-last-child(1)').before(commentDiv);
        return false;   */
}

function commentOnFeedComment(feedId,commentId,commentTxt){
	if(commentTxt!="" && commentStaus){
	 commentStaus=false;
	$.ajax({
			url : "commentOnFeedComment",
			type :"post",
			data :{"feedId":feedId,"commentTxt":commentTxt,"commentId":commentId},
			beforeSend :function(){
			$(this).val("");
				//showErrorMessage("looading");
			},
			success : function(data){
			 commentStaus=true;
			$("#feedCommentJspDivId"+feedId).html(data);
			},
        });
        return false; 
        } 
}

var likeStaus=true;

function likeOnFeed(feedId){
	if(likeStaus){
	likeStaus=false;
	$.ajax({
			url : "likeOnFeed",
			type :"post",
			data :{"feedId":feedId},
			beforeSend :function(){
				//showErrorMessage("looading");
			},
			success : function(data){
			likeStaus=true;
			$("#feedCommentJspDivId"+feedId).html(data);
			},
        });
        }
        return false;  
}

function likeOnFeedComment(feedId,commentId){
	if(likeStaus){
	likeStaus=false;
	$.ajax({
			url : "likeOnFeedComment",
			type :"post",
			data :{"feedId":feedId,"commentId":commentId},
			beforeSend :function(){
				//showErrorMessage("looading");
			},
			success : function(data){
			likeStaus=true;
			$("#feedCommentJspDivId"+feedId).html(data);
			},
        });
       }
        return false;  
}

function viewAllComments(feedId){
	$("#twoCommentsDivId"+feedId).remove();
	$("#allCommentDivId"+feedId).show();
}

function showSubComment(commentId){
	$("#subCommentDivId"+commentId).show();
}

</script>

    
    
    <div class="container margin_topm22">
        <div class="page-section">
            <div class="row">
            
             <div class="col-xs-12 col-md-7 col-lg-7">
              <div class="row" data-toggle="isotope">
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
             
             
    <style type="text/css">
    	#top {
		  position: fixed;
		  top: 0;
		  left: 0;
		  z-index: 999;
		  width: 57%;
		  height: 95%;
		  background-color: white;
		}
    </style>        
             
             
             
              <div class="col-xs-12 col-md-12 col-lg-12">
				
                <div class="timeline-block">
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
              
              </div>
              <div class="row" data-toggle="isotope">
              <div  id="paginationContentId">
              	
              	</div>
              	</div>
              </div>
              
            
			<!-- update course started -->
			<div class="col-xs-12 col-md-5 col-lg-5">
			 <div class="row update_row1" data-toggle="isotope">
			<div class="col-xs-12 col-md-12 col-lg-12">
                    <div class="panel panel-default" data-toggle="panel-collapse" data-open="true">
                        <div class="panel-heading panel-collapse-trigger pad_modal">
                            <h5 class="h5_color">Courses</h5>
                        </div>
                        <div class="panel-body list-group pad_0">
                           <ul class="list-group relative paper-shadow" data-hover-z="0.5" data-animated>
                           <s:if test="#session.courseList != null && #session.courseList.size()>3">
                           		<s:iterator value="#session.courseList" begin="0" end="2">
                                    <li class="list-group-item paper-shadow">
                                        <div class="media v-middle">
												<div class="left width_60p">
													<a href="javaScript:;" onclick="getModules(<s:property value="courseId"/>)">
													<h6 class=" color_blue bold link-text-color"><s:property value="courseName"/></h6></a>
													</div>
												<s:if test="completedPerStatus == 100">
												<div class="right">
												<div class="progress_n">
														    <span class="progress-val_n"><s:property value="completedPerStatus"/>%</span>
														    <span class="progress-bar_n"><span class="progress-in_n" style="width:<s:property value="completedPerStatus"/>%;"></span></span>
														  </div>
														 </div>
												</s:if>
												<s:else>
													<div class="right">
														
													
													<div class="progress_n">
														    <span class="progress-val_n"><s:property value="completedPerStatus"/>%</span>
														    <span class="progress-bar_n"><span class="progress-in_n" style="width:<s:property value="completedPerStatus"/>%;"></span></span>
														  </div>
												
													</div>
												</s:else>



												
												</div>
                                       
                                    </li>
                                  </s:iterator>
                                </s:if>
                                <s:else>
                                <s:iterator value="#session.courseList">
                                    <li class="list-group-item paper-shadow">
                                        <div class="media v-middle">
												<div class="left width_60p">
													<a href="javaScript:;" onclick="getModules(<s:property value="courseId"/>)">
													<h6 class=" color_blue bold link-text-color"><s:property value="courseName"/></h6></a>
													</div>
												<s:if test="completedPerStatus == 100">
												<div class="right">
												<div class="progress_n">
														    <span class="progress-val_n"><s:property value="completedPerStatus"/>%</span>
														    <span class="progress-bar_n"><span class="progress-in_n" style="width:<s:property value="completedPerStatus"/>%;"></span></span>
														  </div>
														 </div>
												</s:if>
												<s:else>
													<div class="right">
														
													
													<div class="progress_n">
														    <span class="progress-val_n"><s:property value="completedPerStatus"/>%</span>
														    <span class="progress-bar_n"><span class="progress-in_n" style="width:<s:property value="completedPerStatus"/>%;"></span></span>
														  </div>
												
													</div>
												</s:else>



												
												</div>
                                       
                                    </li>
                                  </s:iterator>
                                </s:else>
                                	<s:if test="#session.courseList.size()>0">
									<li class="list-group-item paper-shadow">
                                        <div class="media v-middle">
												<a class="btn-pad normalbutton btn-height margin_bot1" href="courses" >View All</a>
                                        </div>
                                    </li>
									</s:if>
									<s:else>
										There is no course
									</s:else>
                                </ul>
                        </div>
                    </div>
            </div> <!-- clsoed all course module -->
            </div>
			
			<!-- assignments started -->
			 <div class="row update_row2" data-toggle="isotope">
			<div class="col-xs-12 col-md-12 col-lg-12">
                    <div class="panel panel-default" data-toggle="panel-collapse" data-open="true">
                        <div class="panel-heading panel-collapse-trigger pad_modal">
                            <h5 class="h5_color">Assignments</h5>
                        </div>
                        <div class="panel-body list-group pad_0">
                           <ul class="list-group relative paper-shadow" data-hover-z="0.5" data-animated>
                           		<s:if test="#session.assignmentList !=null && #session.assignmentList.size()>3"  >
                           		<s:iterator value="#session.assignmentList" begin="0" end="2">
                                    <li class="list-group-item paper-shadow">
                                        <div class="media v-middle">
												<div class="width_100p margin_bot4m">
												<h5 class="line_height20 margin_tb4"><span class="">
												${assignmentName}</span> for <span class="color_blue"><a class="color_blue bold" href="javaScript:;" onclick="moduleDescription(<s:property value="moduleId"/>,<s:property value="courseId"/>)"> ${moduleName} </a> </span> -
												<span class="color_blue"><a class="color_blue bold" href="javaScript:;" onclick="getModules(<s:property value="courseId"/>)"> ${courseName}</a></span> 
												<s:if test="assignmentStatus ==1">
															is open for submission. 
														</s:if>
														<s:elseif test="assignmentStatus ==4">
															is now over due for submission. 
														</s:elseif>
														<s:elseif test="assignmentStatus ==2">
															submitted on &nbsp;<span class="color_black">${assignmentSubmittedDate}.</span>
														</s:elseif>
														<s:elseif test="assignmentStatus ==3">
															 reviewed.
														</s:elseif>
												</h5>
												
												<div class="media-left width_160p">
														<s:if test="assignmentStatus ==1">
															<h5 ><span class="text-black">Status: </span>Open for submission</h5>
														</s:if>
														<s:elseif test="assignmentStatus ==4">
															<h5 class="color_red"><span class="text-black">Status: </span>Overdue</h5>
														</s:elseif>
														<s:elseif test="assignmentStatus ==2">
														<h5 class="green"><span class="text-black">Status: </span>Submitted</h5>
														</s:elseif>
														<s:elseif test="assignmentStatus ==3">
														<h5 class="green"><span class="text-black">Status: </span>Reviewed</h5>
															<!-- <h4 class="green">
																<i data-toggle="tooltip" title="Reviewed by teacher"
																	class="margin_top10 fa fa-check-square-o fa-fw"></i>Reviewed
															</h4> -->
														</s:elseif>
													</div>
													
												<div class="media-body width_330p">
												<s:if test="assignmentDueDate !=null">
												<h5 class="color_black line_height20">Due Date :
												<span class="color_black">${assignmentDueDate}</span></h5>
												</s:if>
												</div>

													<div class="media-right">
														
														<s:if test="assignmentStatus ==1">
															<a class="btn-pad normalbutton left btn-height margin_bot1" href="submitAssignment?assignmentId=<s:property value="assignmentId"/>" >Submit</a>
														</s:if>
														<s:elseif test="assignmentStatus ==4">
															<a class="btn-pad normalbutton btn-height margin_bot1" href="submitAssignment?assignmentId=<s:property value="assignmentId"/>" >Submit</a>
														</s:elseif>
														<s:elseif test="assignmentStatus ==2">
															
															<a class="btn-pad normalbutton btn-height margin_bot1" href="viewAssignment?assignmentId=<s:property value="assignmentId"/>" >View</a>
														</s:elseif>
														<s:elseif test="assignmentStatus ==3">
														<a class="btn-pad normalbutton btn-height margin_bot1" href="viewAssignment?assignmentId=<s:property value="assignmentId"/>" >View</a>
															<!-- <h4 class="green">
																<i data-toggle="tooltip" title="Reviewed by teacher"
																	class="margin_top10 fa fa-check-square-o fa-fw"></i>Reviewed
															</h4> -->
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
															 submitted on &nbsp;<span class="color_blue">${assignmentSubmittedDate}</span>
														</s:elseif>
														<s:elseif test="assignmentStatus ==3">
															 reviewed.
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
									<s:if test="#session.assignmentList.size()>0">
										<li class="list-group-item paper-shadow">
	                                        <div class="media v-middle">
													<a class="btn-pad normalbutton btn-height" href="assignments" >View All</a>
	                                        </div>
	                                    </li>
									</s:if>
									<s:else>
											There is no assignment
									</s:else>
                                </ul>
                        </div>
                    </div>
            </div> <!-- assignments closed-->
            </div>
			
            </div> 
            </div>
		</div>
	</div>
	<div id="loader"></div>
	
	