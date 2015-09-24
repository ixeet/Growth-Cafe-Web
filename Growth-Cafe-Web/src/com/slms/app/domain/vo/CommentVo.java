package com.slms.app.domain.vo;

import java.util.ArrayList;

public class CommentVo {
	private int commentId;
	private int commentById;
	private int likeCounts;
	private int commentCounts;
	private int shareCounts;
	private int parentCommentId;
	private boolean likeStatus;
	private String commentBy;
	private String commentByImg;
	private String commentTxt;
	private String commentDate;
	private ArrayList<CommentVo> subCommentList;
	
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
	 * @return the shareCounts
	 */
	public int getShareCounts() {
		return shareCounts;
	}
	/**
	 * @param shareCounts the shareCounts to set
	 */
	public void setShareCounts(int shareCounts) {
		this.shareCounts = shareCounts;
	}
	/**
	 * @return the parentCommentId
	 */
	public int getParentCommentId() {
		return parentCommentId;
	}
	/**
	 * @param parentCommentId the parentCommentId to set
	 */
	public void setParentCommentId(int parentCommentId) {
		this.parentCommentId = parentCommentId;
	}
	
	/**
	 * @return the commentBy
	 */
	public String getCommentBy() {
		return commentBy;
	}
	/**
	 * @param commentBy the commentBy to set
	 */
	public void setCommentBy(String commentBy) {
		this.commentBy = commentBy;
	}
	/**
	 * @return the commentByImg
	 */
	public String getCommentByImg() {
		return commentByImg;
	}
	/**
	 * @param commentByImg the commentByImg to set
	 */
	public void setCommentByImg(String commentByImg) {
		this.commentByImg = commentByImg;
	}
	/**
	 * @return the commentTxt
	 */
	public String getCommentTxt() {
		return commentTxt;
	}
	/**
	 * @param commentTxt the commentTxt to set
	 */
	public void setCommentTxt(String commentTxt) {
		this.commentTxt = commentTxt;
	}
	/**
	 * @return the commentDate
	 */
	public String getCommentDate() {
		return commentDate;
	}
	/**
	 * @param commentDate the commentDate to set
	 */
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}

	public ArrayList<CommentVo> getSubCommentList() {
		return subCommentList;
	}
	public void setSubCommentList(ArrayList<CommentVo> subCommentList) {
		this.subCommentList = subCommentList;
	}
	public int getCommentById() {
		return commentById;
	}
	public void setCommentById(int commentById) {
		this.commentById = commentById;
	}
	public int getCommentCounts() {
		return commentCounts;
	}
	public void setCommentCounts(int commentCounts) {
		this.commentCounts = commentCounts;
	}
	public boolean isLikeStatus() {
		return likeStatus;
	}
	public void setLikeStatus(boolean likeStatus) {
		this.likeStatus = likeStatus;
	}
	
}
