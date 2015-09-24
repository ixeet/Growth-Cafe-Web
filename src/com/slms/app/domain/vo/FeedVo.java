package com.slms.app.domain.vo;

import java.util.ArrayList;

public class FeedVo {
	
	private String statusMessage;
	private int feedId;
	private int likeCounts;
	private int commentCounts;
	private boolean likeStatus;
	private String feedText;
	private String feedTextPost;
	public String getFeedTextPost() {
		return feedTextPost;
	}
	public void setFeedTextPost(String feedTextPost) {
		this.feedTextPost = feedTextPost;
	}
	private String feedOn;
	public String getFeedOn() {
		return feedOn;
	}
	public void setFeedOn(String feedOn) {
		this.feedOn = feedOn;
	}
	private RegistrationVo user;
	private CoursesVo resource;
	private ArrayList<CommentVo> commentList;
	/**
	 * @return the statusMessage
	 */
	public String getStatusMessage() {
		return statusMessage;
	}
	/**
	 * @param statusMessage the statusMessage to set
	 */
	public void setStatusMessage(String statusMessage) {
		this.statusMessage = statusMessage;
	}
	/**
	 * @return the feedId
	 */
	public int getFeedId() {
		return feedId;
	}
	/**
	 * @param feedId the feedId to set
	 */
	public void setFeedId(int feedId) {
		this.feedId = feedId;
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
	 * @return the feedText
	 */
	public String getFeedText() {
		return feedText;
	}
	/**
	 * @param feedText the feedText to set
	 */
	public void setFeedText(String feedText) {
		this.feedText = feedText;
	}
	/**
	 * @return the user
	 */
	public RegistrationVo getUser() {
		return user;
	}
	/**
	 * @param user the user to set
	 */
	public void setUser(RegistrationVo user) {
		this.user = user;
	}
	/**
	 * @return the resource
	 */
	public CoursesVo getResource() {
		return resource;
	}
	/**
	 * @param resource the resource to set
	 */
	public void setResource(CoursesVo resource) {
		this.resource = resource;
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
	public boolean isLikeStatus() {
		return likeStatus;
	}
	public void setLikeStatus(boolean likeStatus) {
		this.likeStatus = likeStatus;
	}
	
}
