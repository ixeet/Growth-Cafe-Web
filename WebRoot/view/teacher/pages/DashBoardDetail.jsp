<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="row outLine">
	<div class="col-md-6">
		
		<ul class="list-group">
		<li class="list-group-item active">Course Progress Status</li>
			<s:iterator value="dashBoardReportList">
				<li class="list-group-item outLine">
					<p>
						<s:property value="schoolName" />
					</p>
					<p>
						Class :
						<s:property value="className" />
						, Home Room :
						<s:property value="homeRoomName" />
					</p>
					<p>
						Sales Course :
						<s:property value="salesCourse" />
					</p>
					
						<p>
						<s:if test="view == 0">
						 <b style="float: right; font-size: 20px; color: #BA0032;"><s:property value="status" />.</b>
						 </s:if>
						
						<s:elseif test="view == 1">
						 <b style="float: right; font-size: 20px; color: green;"><s:property value="status" />.</b>
						 </s:elseif>
					</p>
					
					<p>
						Module :
						<b><s:property value="moduleName" /></b></p>
					</li>
			</s:iterator>
		</ul>
	</div>
	
	<div class="col-md-6">
		<div id="recentAssignmentDetailId">
		<s:include value="RecentAssignmentDetail.jsp"/>
	</div>
	</div>
</div>