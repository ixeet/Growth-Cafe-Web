package com.slms.domain.vo;

import java.util.ArrayList;

public class DashBoardReportVo {

	private String schoolName;
	private String homeRoomName;
	private String className;
	private int classId;
	private String salesCourse;
	private int moduleId;
	private String moduleName;
	private String moduleDesc;
	private int schoolId;
	private int homeRoomId;
	private int courseId;
	private String courseName;
	private String status; 
	private String studentName; 
	private String submissionDate;
	private String view;
	private int statusCode;
	private int detailView;
	private int socialShare;
	private int assignments;
	private int attendance;
	private int totalPoints;
	private int id;
	private int userId;
	private int tcsMainId;
	private String userName;
	private String firstName;
	private String startAssDate;
	private String endAssDate;
	private int resourceId;
	private String uploadedDate;
	private String resourceUrl;
	private String resourseName;
	private String resourseDesc;
	private String thumbImg;
	private String authorName;
	private String startedOn;
	private String completedOn;
	private int completedStatus;
	private int resourceSize;
	private String authorImage;
	private int moduleSessionId;
	private int resourceSessionId;
	private int statusId;
	private String completedPerStatus;
	private int moduleStatuId;
	private int assignmentId;
	private int assignmentStatus;
	private String assignmentSubmittedDate;
	private int assignmentsunmittedPercent;
	private int assignmentSubmittedById;
	private String assignmentName;
	private String assignmentDesc;
	private String assignmentDueDate;
	private String value;
	private int key;
	
	private int courseComplete;
	private int courseProgress;
	private int courseNotStarted;
	private int assignmentComplete;
	private int assignmentOpen;
	private int assignmentNotEnabled;
	
	
	
 
	
	
	private String tempKey;
	private String tempValue;
	private int assignmentResourceTxnId;
	private ArrayList<DashBoardReportVo> modulesList;
	private ArrayList<DashBoardReportVo> resourceList;
	private ArrayList<DashBoardReportVo> assignmentList;
	private ArrayList<DashBoardReportVo> courseList;
	private ArrayList<DashBoardReportVo> schoolList;
	private ArrayList<DashBoardReportVo> assignmentSubmitList;
	private ArrayList<DashBoardReportVo> assigNotSubmitList;
	private ArrayList<DashBoardReportVo> attachedResources;
	private ArrayList<DashBoardReportVo> classList;
	private ArrayList<DashBoardReportVo> homeRoomList;
	private ArrayList<DashBoardReportVo> ratingParameters;
	private ArrayList<DashBoardReportVo> childs;
	private ArrayList<DashBoardReportVo> percentage;
	
	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	 

	public String getHomeRoomName() {
		return homeRoomName;
	}

	public void setHomeRoomName(String homeRoomName) {
		this.homeRoomName = homeRoomName;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getSalesCourse() {
		return salesCourse;
	}

	public void setSalesCourse(String salesCourse) {
		this.salesCourse = salesCourse;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public int getSocialShare() {
		return socialShare;
	}

	public void setSocialShare(int socialShare) {
		this.socialShare = socialShare;
	}

	public int getAssignments() {
		return assignments;
	}

	public void setAssignments(int assignments) {
		this.assignments = assignments;
	}

	public int getAttendance() {
		return attendance;
	}

	public void setAttendance(int attendance) {
		this.attendance = attendance;
	}

	public int getTotalPoints() {
		return totalPoints;
	}

	public void setTotalPoints(int totalPoints) {
		this.totalPoints = totalPoints;
	}

	public String getSubmissionDate() {
		return submissionDate;
	}

	public void setSubmissionDate(String submissionDate) {
		this.submissionDate = submissionDate;
	}

	public int getDetailView() {
		return detailView;
	}

	public void setDetailView(int detailView) {
		this.detailView = detailView;
	}

	public int getSchoolId() {
		return schoolId;
	}

	public void setSchoolId(int schoolId) {
		this.schoolId = schoolId;
	}

	public int getClassId() {
		return classId;
	}

	public void setClassId(int classId) {
		this.classId = classId;
	}

	public int getHomeRoomId() {
		return homeRoomId;
	}

	public void setHomeRoomId(int homeRoomId) {
		this.homeRoomId = homeRoomId;
	}

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public int getModuleId() {
		return moduleId;
	}

	public void setModuleId(int moduleId) {
		this.moduleId = moduleId;
	}

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStartAssDate() {
		return startAssDate;
	}

	public void setStartAssDate(String startAssDate) {
		this.startAssDate = startAssDate;
	}

	public String getEndAssDate() {
		return endAssDate;
	}

	public void setEndAssDate(String endAssDate) {
		this.endAssDate = endAssDate;
	}

	public String getView() {
		return view;
	}

	public void setView(String view) {
		this.view = view;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public int getTcsMainId() {
		return tcsMainId;
	}

	public void setTcsMainId(int tcsMainId) {
		this.tcsMainId = tcsMainId;
	}

	public String getModuleDesc() {
		return moduleDesc;
	}

	public void setModuleDesc(String moduleDesc) {
		this.moduleDesc = moduleDesc;
	}

	public String getResourseName() {
		return resourseName;
	}

	public void setResourseName(String resourseName) {
		this.resourseName = resourseName;
	}

	public String getResourseDesc() {
		return resourseDesc;
	}

	public void setResourseDesc(String resourseDesc) {
		this.resourseDesc = resourseDesc;
	}

	public int getResourceId() {
		return resourceId;
	}

	public void setResourceId(int resourceId) {
		this.resourceId = resourceId;
	}

	public String getResourceUrl() {
		return resourceUrl;
	}

	public void setResourceUrl(String resourceUrl) {
		this.resourceUrl = resourceUrl;
	}

	public String getThumbImg() {
		return thumbImg;
	}

	public void setThumbImg(String thumbImg) {
		this.thumbImg = thumbImg;
	}

	public int getStatusId() {
		return statusId;
	}

	public void setStatusId(int statusId) {
		this.statusId = statusId;
	}

	public String getCompletedPerStatus() {
		return completedPerStatus;
	}

	public void setCompletedPerStatus(String completedPerStatus) {
		this.completedPerStatus = completedPerStatus;
	}

	public int getModuleStatuId() {
		return moduleStatuId;
	}

	public void setModuleStatuId(int moduleStatuId) {
		this.moduleStatuId = moduleStatuId;
	}

	public ArrayList<DashBoardReportVo> getModulesList() {
		return modulesList;
	}

	public void setModulesList(ArrayList<DashBoardReportVo> modulesList) {
		this.modulesList = modulesList;
	}

	public ArrayList<DashBoardReportVo> getResourceList() {
		return resourceList;
	}

	public void setResourceList(ArrayList<DashBoardReportVo> resourceList) {
		this.resourceList = resourceList;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public String getStartedOn() {
		return startedOn;
	}

	public void setStartedOn(String startedOn) {
		this.startedOn = startedOn;
	}
 

	public String getAuthorImage() {
		return authorImage;
	}

	public void setAuthorImage(String authorImage) {
		this.authorImage = authorImage;
	}

	public String getCompletedOn() {
		return completedOn;
	}

	public void setCompletedOn(String completedOn) {
		this.completedOn = completedOn;
	}

	public int getCompletedStatus() {
		return completedStatus;
	}

	public void setCompletedStatus(int completedStatus) {
		this.completedStatus = completedStatus;
	}

	public int getResourceSize() {
		return resourceSize;
	}

	public void setResourceSize(int resourceSize) {
		this.resourceSize = resourceSize;
	}

	public ArrayList<DashBoardReportVo> getAssignmentList() {
		return assignmentList;
	}

	public void setAssignmentList(ArrayList<DashBoardReportVo> assignmentList) {
		this.assignmentList = assignmentList;
	}

	public int getModuleSessionId() {
		return moduleSessionId;
	}

	public void setModuleSessionId(int moduleSessionId) {
		this.moduleSessionId = moduleSessionId;
	}

	public int getResourceSessionId() {
		return resourceSessionId;
	}

	public void setResourceSessionId(int resourceSessionId) {
		this.resourceSessionId = resourceSessionId;
	}

	public int getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}

	public ArrayList<DashBoardReportVo> getSchoolList() {
		return schoolList;
	}

	public void setSchoolList(ArrayList<DashBoardReportVo> schoolList) {
		this.schoolList = schoolList;
	}

	public ArrayList<DashBoardReportVo> getCourseList() {
		return courseList;
	}

	public void setCourseList(ArrayList<DashBoardReportVo> courseList) {
		this.courseList = courseList;
	}

	public int getAssignmentId() {
		return assignmentId;
	}

	public void setAssignmentId(int assignmentId) {
		this.assignmentId = assignmentId;
	}

	public int getAssignmentStatus() {
		return assignmentStatus;
	}

	public void setAssignmentStatus(int assignmentStatus) {
		this.assignmentStatus = assignmentStatus;
	}

	public String getAssignmentSubmittedDate() {
		return assignmentSubmittedDate;
	}

	public void setAssignmentSubmittedDate(String assignmentSubmittedDate) {
		this.assignmentSubmittedDate = assignmentSubmittedDate;
	}

	public ArrayList<DashBoardReportVo> getAssignmentSubmitList() {
		return assignmentSubmitList;
	}

	public void setAssignmentSubmitList(
			ArrayList<DashBoardReportVo> assignmentSubmitList) {
		this.assignmentSubmitList = assignmentSubmitList;
	}

	public ArrayList<DashBoardReportVo> getAssigNotSubmitList() {
		return assigNotSubmitList;
	}

	public void setAssigNotSubmitList(
			ArrayList<DashBoardReportVo> assigNotSubmitList) {
		this.assigNotSubmitList = assigNotSubmitList;
	}

	public int getAssignmentsunmittedPercent() {
		return assignmentsunmittedPercent;
	}

	public void setAssignmentsunmittedPercent(int assignmentsunmittedPercent) {
		this.assignmentsunmittedPercent = assignmentsunmittedPercent;
	}

	public int getAssignmentSubmittedById() {
		return assignmentSubmittedById;
	}

	public void setAssignmentSubmittedById(int assignmentSubmittedById) {
		this.assignmentSubmittedById = assignmentSubmittedById;
	}

	public ArrayList<DashBoardReportVo> getAttachedResources() {
		return attachedResources;
	}

	public void setAttachedResources(ArrayList<DashBoardReportVo> attachedResources) {
		this.attachedResources = attachedResources;
	}

	public String getUploadedDate() {
		return uploadedDate;
	}

	public void setUploadedDate(String uploadedDate) {
		this.uploadedDate = uploadedDate;
	}

	public String getAssignmentName() {
		return assignmentName;
	}

	public void setAssignmentName(String assignmentName) {
		this.assignmentName = assignmentName;
	}

	public String getAssignmentDesc() {
		return assignmentDesc;
	}

	public void setAssignmentDesc(String assignmentDesc) {
		this.assignmentDesc = assignmentDesc;
	}

	public String getAssignmentDueDate() {
		return assignmentDueDate;
	}

	public void setAssignmentDueDate(String assignmentDueDate) {
		this.assignmentDueDate = assignmentDueDate;
	}

	public ArrayList<DashBoardReportVo> getClassList() {
		return classList;
	}

	public void setClassList(ArrayList<DashBoardReportVo> classList) {
		this.classList = classList;
	}

	public ArrayList<DashBoardReportVo> getHomeRoomList() {
		return homeRoomList;
	}

	public void setHomeRoomList(ArrayList<DashBoardReportVo> homeRoomList) {
		this.homeRoomList = homeRoomList;
	}

	public ArrayList<DashBoardReportVo> getRatingParameters() {
		return ratingParameters;
	}

	public void setRatingParameters(ArrayList<DashBoardReportVo> ratingParameters) {
		this.ratingParameters = ratingParameters;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public int getKey() {
		return key;
	}

	public void setKey(int key) {
		this.key = key;
	}

	public ArrayList<DashBoardReportVo> getChilds() {
		return childs;
	}

	public void setChilds(ArrayList<DashBoardReportVo> childs) {
		this.childs = childs;
	}

	public int getAssignmentResourceTxnId() {
		return assignmentResourceTxnId;
	}

	public void setAssignmentResourceTxnId(int assignmentResourceTxnId) {
		this.assignmentResourceTxnId = assignmentResourceTxnId;
	}

	public String getTempKey() {
		return tempKey;
	}

	public void setTempKey(String tempKey) {
		this.tempKey = tempKey;
	}

	public String getTempValue() {
		return tempValue;
	}

	public void setTempValue(String tempValue) {
		this.tempValue = tempValue;
	}

	public int getCourseComplete() {
		return courseComplete;
	}

	public void setCourseComplete(int courseComplete) {
		this.courseComplete = courseComplete;
	}

	public int getCourseProgress() {
		return courseProgress;
	}

	public void setCourseProgress(int courseProgress) {
		this.courseProgress = courseProgress;
	}

	public int getCourseNotStarted() {
		return courseNotStarted;
	}

	public void setCourseNotStarted(int courseNotStarted) {
		this.courseNotStarted = courseNotStarted;
	}

	public ArrayList<DashBoardReportVo> getPercentage() {
		return percentage;
	}

	public void setPercentage(ArrayList<DashBoardReportVo> percentage) {
		this.percentage = percentage;
	}

	public int getAssignmentComplete() {
		return assignmentComplete;
	}

	public void setAssignmentComplete(int assignmentComplete) {
		this.assignmentComplete = assignmentComplete;
	}

	public int getAssignmentOpen() {
		return assignmentOpen;
	}

	public void setAssignmentOpen(int assignmentOpen) {
		this.assignmentOpen = assignmentOpen;
	}

	public int getAssignmentNotEnabled() {
		return assignmentNotEnabled;
	}

	public void setAssignmentNotEnabled(int assignmentNotEnabled) {
		this.assignmentNotEnabled = assignmentNotEnabled;
	}

 
 

}
