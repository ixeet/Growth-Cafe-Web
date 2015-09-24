package com.slms.app.domain.vo;

import java.util.ArrayList;

public class CoursesVo {
	
	private String startedOn;
	private String completedOn;
	private String uploadedDate;
	private String completedPerStatus;
	private int courseId;
	private String courseName;
	private int moduleId;
	private String moduleName;
	private int resourceId;
	private int commentId;
	private boolean likeStatus;
	private String resourceName;
	private String resourceDesc;
	private String resourceUrl;
	private String authorName;
	private int likeCounts;
	private int commentCounts;
	private int timeDuration;
	private String authorImg;
	private String thumbImg;
	private ArrayList<CoursesVo> modulesList;
	private ArrayList<CoursesVo> resourceList;
	private ArrayList<CommentVo> commentList;
	private ArrayList<CoursesVo> relatedVideoList;
	/**
	 * @return the startedOn
	 */
	public String getStartedOn() {
		return startedOn;
	}
	/**
	 * @param startedOn the startedOn to set
	 */
	public void setStartedOn(String startedOn) {
		this.startedOn = startedOn;
	}
	/**
	 * @return the completedPerStatus
	 */
	public String getCompletedPerStatus() {
		return completedPerStatus;
	}
	/**
	 * @param completedPerStatus the completedPerStatus to set
	 */
	public void setCompletedPerStatus(String completedPerStatus) {
		this.completedPerStatus = completedPerStatus;
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
	 * @return the modulesList
	 */
	public ArrayList<CoursesVo> getModulesList() {
		return modulesList;
	}
	/**
	 * @param modulesList the modulesList to set
	 */
	public void setModulesList(ArrayList<CoursesVo> modulesList) {
		this.modulesList = modulesList;
	}
	/**
	 * @return the resourceId
	 */
	public int getResourceId() {
		return resourceId;
	}
	/**
	 * @param resourceId the resourceId to set
	 */
	public void setResourceId(int resourceId) {
		this.resourceId = resourceId;
	}
	/**
	 * @return the resourceDesc
	 */
	public String getResourceDesc() {
		return resourceDesc;
	}
	/**
	 * @param resourceDesc the resourceDesc to set
	 */
	public void setResourceDesc(String resourceDesc) {
		this.resourceDesc = resourceDesc;
	}
	/**
	 * @return the resourceUrl
	 */
	public String getResourceUrl() {
		return resourceUrl;
	}
	/**
	 * @param resourceUrl the resourceUrl to set
	 */
	public void setResourceUrl(String resourceUrl) {
		this.resourceUrl = resourceUrl;
	}
	/**
	 * @return the authorName
	 */
	public String getAuthorName() {
		return authorName;
	}
	/**
	 * @param authorName the authorName to set
	 */
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	/**
	 * @return the resourceList
	 */
	public ArrayList<CoursesVo> getResourceList() {
		return resourceList;
	}
	/**
	 * @param resourceList the resourceList to set
	 */
	public void setResourceList(ArrayList<CoursesVo> resourceList) {
		this.resourceList = resourceList;
	}
	/**
	 * @return the completedOn
	 */
	public String getCompletedOn() {
		return completedOn;
	}
	/**
	 * @param completedOn the completedOn to set
	 */
	public void setCompletedOn(String completedOn) {
		this.completedOn = completedOn;
	}
	/**
	 * @return the uploadedDate
	 */
	public String getUploadedDate() {
		return uploadedDate;
	}
	/**
	 * @param uploadedDate the uploadedDate to set
	 */
	public void setUploadedDate(String uploadedDate) {
		this.uploadedDate = uploadedDate;
	}
	/**
	 * @return the resourceName
	 */
	public String getResourceName() {
		return resourceName;
	}
	/**
	 * @param resourceName the resourceName to set
	 */
	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}
	/**
	 * @return the likeCounts
	 */
	public int getLikeCounts() {
		return likeCounts;
	}
	/**
	 * @param likeCounts the likeCounts to set
	 */
	public void setLikeCounts(int likeCounts) {
		this.likeCounts = likeCounts;
	}
	
	/**
	 * @return the authorImg
	 */
	public String getAuthorImg() {
		return authorImg;
	}
	/**
	 * @param authorImg the authorImg to set
	 */
	public void setAuthorImg(String authorImg) {
		this.authorImg = authorImg;
	}
	/**
	 * @return the thumbImg
	 */
	public String getThumbImg() {
		return thumbImg;
	}
	/**
	 * @param thumbImg the thumbImg to set
	 */
	public void setThumbImg(String thumbImg) {
		this.thumbImg = thumbImg;
	}
	
	/**
	 * @return the commentList
	 */
	public ArrayList<CommentVo> getCommentList() {
		return commentList;
	}
	/**
	 * @param commentList the commentList to set
	 */
	public void setCommentList(ArrayList<CommentVo> commentList) {
		this.commentList = commentList;
	}
	/**
	 * @return the commentCounts
	 */
	public int getCommentCounts() {
		return commentCounts;
	}
	/**
	 * @param commentCounts the commentCounts to set
	 */
	public void setCommentCounts(int commentCounts) {
		this.commentCounts = commentCounts;
	}
	/**
	 * @return the relatedVideoList
	 */
	public ArrayList<CoursesVo> getRelatedVideoList() {
		return relatedVideoList;
	}
	/**
	 * @param relatedVideoList the relatedVideoList to set
	 */
	public void setRelatedVideoList(ArrayList<CoursesVo> relatedVideoList) {
		this.relatedVideoList = relatedVideoList;
	}
	/**
	 * @return the timeDuration
	 */
	public int getTimeDuration() {
		return timeDuration;
	}
	/**
	 * @param timeDuration the timeDuration to set
	 */
	public void setTimeDuration(int timeDuration) {
		this.timeDuration = timeDuration;
	}
	/**
	 * @return the commentId
	 */
	public int getCommentId() {
		return commentId;
	}
	/**
	 * @param commentId the commentId to set
	 */
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public boolean isLikeStatus() {
		return likeStatus;
	}
	public void setLikeStatus(boolean likeStatus) {
		this.likeStatus = likeStatus;
	}

}
