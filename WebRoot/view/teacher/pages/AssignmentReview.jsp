<%@ taglib prefix="s" uri="/struts-tags"%>
<s:if test="assignmentStatus == 2">
<%-- <input type="text" name="assignmentResourceTxnId" value="<s:property value="assignmentResourceTxnId" />" > --%>
	<s:form id="submitAtudentStatusId">
	<input style="display: none;"  type="text" name="assignmentResourceTxnId" value="<s:property value="assignmentResourceTxnId" />" >
	<input  style="display: none;"  type="text" name="courseId" value="<s:property value="#parent.courseId" />" >
	<input  style="display: none;"  type="text" name="HomeRoomId" value="<s:property value="#parent.HomeRoomId" />" >
	<input  style="display: none;"  type="text" name="SchoolId" value="<s:property value="#parent.SchoolId" />" >
	<input  style="display: none;"  type="text" name="classId" value="<s:property value="#parent.classId" />" >
	<input  style="display: none;"  type="text" name="moduleId" value="<s:property value="#child.moduleId" />" >
	<input  style="display: none;"  type="text" name="assignmentSubmittedById" value="<s:property value="#subchild.assignmentSubmittedById" />" >
	
	
		<s:if test="ratingParameters!=null">
			<s:iterator value="ratingParameters" var="parent">
				<b  style="font-size: 12px;"><s:property value="#parent.value" /></b>
				<input style="display: none;" type="text" name="tempKey" value="<s:property value="#parent.key" />" >
				<s:if test="childs!=null">
					<select class="form-control panel-default bgsize pad_6" name="tempValue">
					<s:iterator value="childs" var="child">
					<option value="<s:property value="#child.key" />"><s:property value="#child.value" /></option>
					</s:iterator>
					</select>
					</br>
				 </s:if>
			</s:iterator>
		</s:if>
	<a href="javaScript:;" class="btn-pad normalbutton btn-height" onclick="return submitResponzeByTeacher();">Submit</a>
	
	</s:form>
</s:if>

<s:if test="assignmentStatus == 3">
	<div class="pad_l14">
		<h5> <strong>Accuracy </strong>: Excellent</h5>
		<h5> <strong>Ingenuity </strong>: Need More Work</h5>
		<h5> <strong>Timely Submission </strong>: On Time</h5>
	</div>
</s:if>
