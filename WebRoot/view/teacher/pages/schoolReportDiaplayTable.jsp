<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="container">
			<div class="page-section pad_0">
<s:if test="schoolNameList!=null  && schoolNameList.size()!=0">
	<s:iterator value="schoolNameList" var="parent">
	 <s:if test="classList!=null  && classList.size()!=0">
				<s:iterator value="classList" var="child">
				 <s:if test="homeRoomList!=null  && homeRoomList.size()!=0">
				<s:iterator value="homeRoomList" var="smallchild">>
				<div class="col-md-12" style="padding: 0px;margin-top: 8px;">
					<div class="panel panel-default paper-shadow"
						data-z="0.5" style="margin-top: -26px;">
						<div class="panel-heading">
							<div class="media">
								<div class="media-body">
									  <p class="col-sm-4 col-xs-4 center">  <i class="fa fa-fw fa-institution"></i></br><span><s:property value="#parent.schoolName"/></span></p>
                                      <p class="col-sm-4 col-xs-4 center"> <i class="fa fa-fw fa-cubes"></i></br><span><s:property value="#child.className"/></span></p>
									  <p class="col-sm-4 col-xs-4 center">  <i class="fa fa-fw fa-group"></i></br><span><s:property value="#smallchild.homeRoomName"/></span> </p>
								</div>
							</div>
						</div>
					</div>
				</div>
			
		</s:iterator>
		</s:if>
		</s:iterator>
		</s:if>
	</s:iterator>
</s:if>

<%-- 
<s:else>
	<div class="panel panel-default curriculum paper-shadow" data-z="0.5"  style="margin-top: 27px;">
		<div class="panel-heading">
			<div class="media">

				<div class="media-body">

					<div class="col-md-12">
						<p align="center">
							<span > No Data Found </span>
						</p>
					</div>

				</div>
			</div>
		</div>
	</div>

</s:else> --%>
</div>
		</div>