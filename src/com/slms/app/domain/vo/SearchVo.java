package com.slms.app.domain.vo;

public class SearchVo {
	private String category;
	private String searchText;
	private int offset;
	private int noOfRecord;
	private String title;
	private String description;
	
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public int getNoOfRecord() {
		return noOfRecord;
	}
	public void setNoOfRecord(int noOfRecord) {
		this.noOfRecord = noOfRecord;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
