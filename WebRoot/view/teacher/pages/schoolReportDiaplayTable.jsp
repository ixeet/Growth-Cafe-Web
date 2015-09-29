<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="container">
			<div class="page-section pad_0">
<s:if test="schoolNameList!=null  && schoolNameList.size()!=0">
	<s:iterator value="schoolNameList" var="parent">
	
	<!--Organisation block start  -->
		
		<div class="col-lg-4 col-sm-4col-md-6 col-xs-12">
        <div class="panel panel-default paper-shadow" data-z="0.5" data-hover-z="1" data-animated="">
		 <div class="panel-heading ">
		<h5 class="h5_color auto_dots235"><s:property value="schoolName"/> </h5>
		</div>
		<div class="panel-body pad_l14">
						<h5 class="center">
										<img src="view/helper/images/logo3.png" alt="" class="img-circle width-100" />
						</h5>
						<h5>
										<strong>Website : </strong> <a href="http://www.google.com/" target="blank">  www.stephenschools.com </a>
						</h5>
						<h5>
										<strong>Course engaged : </strong><s:property value="resourceSize"/>
						</h5>
						<ul>
						<s:if test="classList!=null  && classList.size()!=0">
							<s:iterator value="classList" var="child">
							 <s:if test="homeRoomList!=null  && homeRoomList.size()!=0">
							<s:iterator value="homeRoomList" var="smallchild">
								<s:iterator value="courseList">
								<li style="list-style:initial"><s:property value="courseName"/> </li>
								</s:iterator>
							</s:iterator>
							</s:if>
							</s:iterator>
						</s:if>
						</ul>
						
						
		</div>
		<hr class="margin-none">


</div>
</div>
		
		<!--Organisation block end -->
	
	
	 <%-- <s:if test="classList!=null  && classList.size()!=0">
				<s:iterator value="classList" var="child">
				 <s:if test="homeRoomList!=null  && homeRoomList.size()!=0">
				<s:iterator value="homeRoomList" var="smallchild">
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
		</s:if> --%>
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