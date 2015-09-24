package com.slms.app.domain.vo;

import java.io.File;
import java.util.ArrayList;

public class RegistrationVo {
	
	private int userId;
	private String userName;
	private String firstName;
	private String lastName;
	private String emailId;
	private int schoolId;
	private String schoolName;
	private String address;
	private int classId;
	private String className;
	private int homeRoomId;
	private String homeRoomName;
	private String adminEmailId;
	private String userPassword;
	private String userNewPassword;
	private String title;
	private String userFbId;
	private File profilePhoto;
	private String profilePhotoContentType;
	private String profilePhotoFileName;
	private String statusMessage;
	private int userType;
	private ArrayList<RegistrationVo> schoolList;
	private ArrayList<RegistrationVo> classList;
	private ArrayList<RegistrationVo> homeList;
	
	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}
	
	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	/**
	 * @return the firstName
	 */
	public String getFirstName() {
		return firstName;
	}
	/**
	 * @param firstName the firstName to set
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	/**
	 * @return the lastName
	 */
	public String getLastName() {
		return lastName;
	}
	/**
	 * @param lastName the lastName to set
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	/**
	 * @return the emailId
	 */
	public String getEmailId() {
		return emailId;
	}
	/**
	 * @param emailId the emailId to set
	 */
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	/**
	 * @return the schoolName
	 */
	public String getSchoolName() {
		return schoolName;
	}
	/**
	 * @param schoolName the schoolName to set
	 */
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}
	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}
	/**
	 * @return the className
	 */
	public String getClassName() {
		return className;
	}
	/**
	 * @param className the className to set
	 */
	public void setClassName(String className) {
		this.className = className;
	}
	/**
	 * @return the homeRoomName
	 */
	public String getHomeRoomName() {
		return homeRoomName;
	}
	/**
	 * @param homeRoomName the homeRoomName to set
	 */
	public void setHomeRoomName(String homeRoomName) {
		this.homeRoomName = homeRoomName;
	}
	/**
	 * @return the adminEmailId
	 */
	public String getAdminEmailId() {
		return adminEmailId;
	}
	/**
	 * @param adminEmailId the adminEmailId to set
	 */
	public void setAdminEmailId(String adminEmailId) {
		this.adminEmailId = adminEmailId;
	}

	/**
	 * @return the userPassword
	 */
	public String getUserPassword() {
		return userPassword;
	}

	/**
	 * @param userPassword the userPassword to set
	 */
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * @return the schoolId
	 */
	public int getSchoolId() {
		return schoolId;
	}

	/**
	 * @param schoolId the schoolId to set
	 */
	public void setSchoolId(int schoolId) {
		this.schoolId = schoolId;
	}

	/**
	 * @return the classId
	 */
	public int getClassId() {
		return classId;
	}

	/**
	 * @param classId the classId to set
	 */
	public void setClassId(int classId) {
		this.classId = classId;
	}

	/**
	 * @return the homeRoomId
	 */
	public int getHomeRoomId() {
		return homeRoomId;
	}

	/**
	 * @param homeRoomId the homeRoomId to set
	 */
	public void setHomeRoomId(int homeRoomId) {
		this.homeRoomId = homeRoomId;
	}

	/**
	 * @return the userId
	 */
	public int getUserId() {
		return userId;
	}

	/**
	 * @param userId the userId to set
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}

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
	 * @return the userFbId
	 */
	public String getUserFbId() {
		return userFbId;
	}

	/**
	 * @param userFbId the userFbId to set
	 */
	public void setUserFbId(String userFbId) {
		this.userFbId = userFbId;
	}

	/**
	 * @return the userNewPassword
	 */
	public String getUserNewPassword() {
		return userNewPassword;
	}

	/**
	 * @param userNewPassword the userNewPassword to set
	 */
	public void setUserNewPassword(String userNewPassword) {
		this.userNewPassword = userNewPassword;
	}

	/**
	 * @return the schoolList
	 */
	public ArrayList<RegistrationVo> getSchoolList() {
		return schoolList;
	}

	/**
	 * @param schoolList the schoolList to set
	 */
	public void setSchoolList(ArrayList<RegistrationVo> schoolList) {
		this.schoolList = schoolList;
	}

	/**
	 * @return the classList
	 */
	public ArrayList<RegistrationVo> getClassList() {
		return classList;
	}

	/**
	 * @param classList the classList to set
	 */
	public void setClassList(ArrayList<RegistrationVo> classList) {
		this.classList = classList;
	}

	/**
	 * @return the homeList
	 */
	public ArrayList<RegistrationVo> getHomeList() {
		return homeList;
	}

	/**
	 * @param homeList the homeList to set
	 */
	public void setHomeList(ArrayList<RegistrationVo> homeList) {
		this.homeList = homeList;
	}

	/**
	 * @return the profilePhoto
	 */
	public File getProfilePhoto() {
		return profilePhoto;
	}

	/**
	 * @param profilePhoto the profilePhoto to set
	 */
	public void setProfilePhoto(File profilePhoto) {
		this.profilePhoto = profilePhoto;
	}

	/**
	 * @return the profilePhotoContentType
	 */
	public String getProfilePhotoContentType() {
		return profilePhotoContentType;
	}

	/**
	 * @param profilePhotoContentType the profilePhotoContentType to set
	 */
	public void setProfilePhotoContentType(String profilePhotoContentType) {
		this.profilePhotoContentType = profilePhotoContentType;
	}

	/**
	 * @return the profilePhotoFileName
	 */
	public String getProfilePhotoFileName() {
		return profilePhotoFileName;
	}

	/**
	 * @param profilePhotoFileName the profilePhotoFileName to set
	 */
	public void setProfilePhotoFileName(String profilePhotoFileName) {
		this.profilePhotoFileName = profilePhotoFileName;
	}

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	

}
