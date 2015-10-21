<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="col-md-5">
	 <div class="panel panel-default" data-toggle="panel-collapse" data-open="true">
                        <div class="panel-heading panel-collapse-trigger pad_modal">
			<h5 class="h5_color">Recent Updates</h5>
		</div>
		<div class="panel-body list-group pad_0">
			<ul class="list-group relative paper-shadow" data-hover-z="0.5"
				data-animated>
				<s:if test="#session.feedList!=null && #session.feedList.size()>0">
				<s:iterator value="#session.feedList">
					<li class="list-group-item paper-shadow">
						<div class="media v-middle">
							<div class="media-left">
							<div class="width-60">
											<span style="font-size:9px;" class="text-caption text-light"><s:property
													value="feedOn" /> </span>
										</div>
								<a href="javaScript:;"
									onclick="personalProfile(<s:property value="user.userId" />);">
									<s:if
										test="user.profilePhotoFileName !=null && user.profilePhotoFileName!=''">
										
										<img src='<s:property value="user.profilePhotoFileName" />'
											class="media-object img-circle width-40">
									</s:if> <s:else>
										<img src='view/helper/images/people/50/guy-6.jpg'
											class="media-object img-circle width-40">
									</s:else> </a>
							</div>
							<div class="media-body">
								<%-- <h6 class="text-subhead link-text-color"> <s:property value="user.firstName"/></h6> --%>
								<div class="text-light">
									<s:text name="feedText" />
								</div>

							</div>

						</div></li>
				</s:iterator>
				</s:if>
				<s:else>
				<span style="margin-left: 41%;"> There is no Update</span>
				
				</s:else>

			</ul>
		</div>
	</div>
</div>