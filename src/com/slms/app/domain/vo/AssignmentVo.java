package com.slms.app.domain.vo;

import java.io.File;
import java.util.ArrayList;

public class AssignmentVo {
	
	private int assignmentId;
	private int courseId;
	private int moduleId;
	private int key;
	private String value;
	private String courseName;
	private String moduleName;
	private String assignmentName;
	private String assignmentDesc;
	private String assignmentLink;
	private File 	assignmentRes;
	private String 	assignmentResFileName;
	private String 	assignmentResContentType;
	private int assignmentStatus;
	private String assignmentSubmittedDate;
	private String assignmentDueDate;
	private String assignmentSubmittedBy;
	private ArrayList<CoursesVo> resourcesList;
	
	private ArrayList<AssignmentVo> ratingParameter;
	private ArrayList<AssignmentVo> ratingChildParameter;
	
	/**
	 * @return the assignmentSubmittedBy
	 */
	public String getAssignmentSubmittedBy() {
		return assignmentSubmittedBy;
	}
	/**
	 * @param assignmentSubmittedBy the assignmentSubmittedBy to set
	 */
	public void setAssignmentSubmittedBy(String assignmentSubmittedBy) {
		this.assignmentSubmittedBy = assignmentSubmittedBy;
	}
	/**
	 * @return the assignmentId
	 */
	public int getAssignmentId() {
		return assignmentId;
	}
	/**
	 * @param assignmentId the assignmentId to set
	 */
	public void setAssignmentId(int assignmentId) {
		this.assignmentId = assignmentId;
	}
	/**
	 * @return the assignmentName
	 */
	public String getAssignmentName() {
		return assignmentName;
	}
	/**
	 * @param assignmentName the assignmentName to set
	 */
	public void setAssignmentName(String assignmentName) {
		this.assignmentName = assignmentName;
	}
	
	/**
	 * @return the assignmentSubmittedDate
	 */
	public String getAssignmentSubmittedDate() {
		return assignmentSubmittedDate;
	}
	/**
	 * @param assignmentSubmittedDate the assignmentSubmittedDate to set
	 */
	public void setAssignmentSubmittedDate(String assignmentSubmittedDate) {
		this.assignmentSubmittedDate = assignmentSubmittedDate;
	}
	/**
	 * @return the courseId
	 */
	public int getCourseId() {
		return courseId;
	}
	/**
	 * @param courseId the courseId to set
	 */
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	/**
	 * @return the moduleId
	 */
	public int getModuleId() {
		return moduleId;
	}
	/**
	 * @param moduleId the moduleId to set
	 */
	public void setModuleId(int moduleId) {
		this.moduleId = moduleId;
	}
	/**
	 * @return the courseName
	 */
	public String getCourseName() {
		return courseName;
	}
	/**
	 * @param courseName the courseName to set
	 */
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	/**
	 * @return the moduleName
	 */
	public String getModuleName() {
		return moduleName;
	}
	/**
	 * @param moduleName the moduleName to set
	 */
	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}
	/**
	 * @return the assignmentStatus
	 */
	public int getAssignmentStatus() {
		return assignmentStatus;
	}
	/**
	 * @param assignmentStatus the assignmentStatus to set
	 */
	public void setAssignmentStatus(int assignmentStatus) {
		this.assignmentStatus = assignmentStatus;
	}
	/**
	 * @return the resourcesList
	 */
	public ArrayList<CoursesVo> getResourcesList() {
		return resourcesList;
	}
	/**
	 * @param resourcesList the resourcesList to set
	 */
	public void setResourcesList(ArrayList<CoursesVo> resourcesList) {
		this.resourcesList = resourcesList;
	}
	public String getAssignmentDesc() {
		return assignmentDesc;
	}
	public void setAssignmentDesc(String assignmentDesc) {
		this.assignmentDesc = assignmentDesc;
	}
	public String getAssignmentLink() {
		return assignmentLink;
	}
	public void setAssignmentLink(String assignmentLink) {
		this.assignmentLink = assignmentLink;
	}
	public File getAssignmentRes() {
		return assignmentRes;
	}
	public void setAssignmentRes(File assignmentRes) {
		this.assignmentRes = assignmentRes;
	}
	public String getAssignmentResFileName() {
		return assignmentResFileName;
	}
	public void setAssignmentResFileName(String assignmentResFileName) {
		this.assignmentResFileName = assignmentResFileName;
	}
	public String getAssignmentResContentType() {
		return assignmentResContentType;
	}
	public void setAssignmentResContentType(String assignmentResContentType) {
		this.assignmentResContentType = assignmentResContentType;
	}
	public String getAssignmentDueDate() {
		return assignmentDueDate;
	}
	public void setAssignmentDueDate(String assignmentDueDate) {
		this.assignmentDueDate = assignmentDueDate;
	}
	public int getKey() {
		return key;
	}
	public void setKey(int key) {
		this.key = key;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public ArrayList<AssignmentVo> getRatingParameter() {
		return ratingParameter;
	}
	public void setRatingParameter(ArrayList<AssignmentVo> ratingParameter) {
		this.ratingParameter = ratingParameter;
	}
	public ArrayList<AssignmentVo> getRatingChildParameter() {
		return ratingChildParameter;
	}
	public void setRatingChildParameter(ArrayList<AssignmentVo> ratingChildParameter) {
		this.ratingChildParameter = ratingChildParameter;
	}
	 

}
