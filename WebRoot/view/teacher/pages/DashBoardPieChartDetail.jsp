<%@ taglib prefix="s" uri="/struts-tags"%>

<!-- <input type="text" id="courseCompleteId" value="30">
<input type="text" id="courseProgressId" value="40">
<input type="text" id="courseNotStartedId" value="30"> 

<input type="text" id="assignmentCompleteId" value="40">
<input type="text" id="assignmentOpenId" value="40">
<input type="text" id="assignmentNotEnabledId" value="20"> 

 -->


<input style="display:none;" type="text" id="courseCompleteId" value=" ${dashBoardReportVo.courseComplete}">
<input style="display:none;" type="text" id="courseProgressId" value="${dashBoardReportVo.courseProgress}">
<input style="display:none;" type="text" id="courseNotStartedId" value="${dashBoardReportVo.courseNotStarted}"> 

<input style="display:none;" type="text" id="assignmentCompleteId" value="${dashBoardReportVo.assignmentComplete}">
<input style="display:none;" type="text" id="assignmentOpenId" value="${dashBoardReportVo.assignmentOpen}">
<input style="display:none;" type="text" id="assignmentNotEnabledId" value="${dashBoardReportVo.assignmentNotEnabled}"> 
