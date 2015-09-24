package com.slms.app.webapp.controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.slms.app.domain.utility.Utility;
import com.slms.app.domain.vo.AssignmentVo;
import com.slms.app.domain.vo.CoursesVo;
import com.slms.app.domain.vo.RegistrationVo;
import com.slms.app.service.iface.AssignmentServiceIface;
import com.slms.app.service.impl.AssignmentServiceImpl;

public class AssignmentAction extends ActionSupport implements ModelDriven<AssignmentVo>, ServletRequestAware,ServletResponseAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Logger logger = LoggerFactory.getLogger(AssignmentAction.class);
	HttpServletRequest servletRequest;
	AssignmentVo assignmentVo;
	CoursesVo moduleDetail;
	String response;
	ArrayList<AssignmentVo> assignmentList;
	HttpServletResponse servletResponse;
	
	@Override
	public AssignmentVo getModel() {
		assignmentVo = new AssignmentVo();
		return assignmentVo;
	}
	
	
	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		servletResponse=arg0;
	}
	
	/**
	 * @return the servletResponse
	 */
	public HttpServletResponse getServletResponse() {
		return servletResponse;
	}
	
	public String  execute() {
		HttpServletRequest request = ServletActionContext.getRequest();
		logger.debug("AssignmentAction method:-execute ");
		try {
				RegistrationVo loginDetail = (RegistrationVo) request.getSession().getAttribute("loginDetail");
				if(loginDetail !=null){
					AssignmentServiceIface assignmentServiceIface = new AssignmentServiceImpl();
					response = assignmentServiceIface.assignments(loginDetail);
					JSONObject jsonResponseObj = new JSONObject(response);
					if(jsonResponseObj.getString("statusMessage").equalsIgnoreCase("success")){
						if(jsonResponseObj.has("assignmentList")){
							JSONArray jsonAssignmentArr = jsonResponseObj.getJSONArray("assignmentList");
							assignmentList = new ArrayList<AssignmentVo>();
							for(int k=0;k<jsonAssignmentArr.length();k++){
								JSONObject jsonAssignmentObj = jsonAssignmentArr.getJSONObject(k);
								AssignmentVo assignment = new AssignmentVo();
								assignment.setCourseId(jsonAssignmentObj.getInt("courseId"));
								assignment.setCourseName(jsonAssignmentObj.getString("courseName"));
								assignment.setModuleId(jsonAssignmentObj.getInt("moduleId"));
								assignment.setModuleName(jsonAssignmentObj.getString("moduleName"));
								assignment.setAssignmentId(jsonAssignmentObj.getInt("assignmentId"));
								assignment.setAssignmentDesc(jsonAssignmentObj.getString("assignmentDesc"));
								assignment.setAssignmentName(jsonAssignmentObj.getString("assignmentName"));
								assignment.setAssignmentStatus(Integer.parseInt(jsonAssignmentObj.getString("assignmentStatus")));
								if(jsonAssignmentObj.has("assignmentSubmittedDate")){
								assignment.setAssignmentSubmittedDate(Utility.getDisplayDate(jsonAssignmentObj.getString("assignmentSubmittedDate")));
								}
								if(jsonAssignmentObj.has("assignmentDueDate")){
									assignment.setAssignmentDueDate((Utility.getDisplayDate(jsonAssignmentObj.getString("assignmentDueDate"))));
									}
								if(assignment.getAssignmentStatus()==1 && assignment.getAssignmentDueDate() !=null){
									int status = Utility.checkDateIsPreDate(assignment.getAssignmentDueDate());
									assignment.setAssignmentStatus(status);
								}
								if(jsonAssignmentObj.has("attachedResources")){
									JSONArray attachedResourcesArr = jsonAssignmentObj.getJSONArray("attachedResources");
									ArrayList<CoursesVo> resourceList = new ArrayList<CoursesVo>();
									for(int j=0;j<attachedResourcesArr.length();j++){
										JSONObject jsonResourceObj = attachedResourcesArr.getJSONObject(j);
										CoursesVo resource = new CoursesVo();
										resource.setResourceId(jsonResourceObj.getInt("resourceId"));
										resource.setResourceName(jsonResourceObj.getString("resourceName"));
										resource.setResourceDesc(jsonResourceObj.getString("resourceDesc"));
										resource.setResourceUrl(jsonResourceObj.getString("resourceUrl"));
										resource.setAuthorName(jsonResourceObj.getString("authorName"));
										resource.setAuthorImg(jsonResourceObj.getString("authorImg"));
										resource.setThumbImg(jsonResourceObj.getString("thumbImg"));
										resourceList.add(resource);
									}
									assignment.setResourcesList(resourceList);
								}
								assignmentList.add(assignment);
								request.getSession().setAttribute("assignmentList",assignmentList);
							}
							
							}
							
						}
				}
			}catch (Exception e) {
				logger.error("AssignmentAction method:-execute "+e.getMessage());
			}
		getServletRequest().getSession().setAttribute("selectedTab","assignmentsTabId");
		return SUCCESS;
	}
	
	public String submitAssignment() {
		logger.debug("AssignmentAction method:-submitAssignment ");
		HttpServletRequest request = ServletActionContext.getRequest();
		try {
			ArrayList<AssignmentVo> assignments = (ArrayList<AssignmentVo>) request.getSession().getAttribute("assignmentList");
			for(AssignmentVo assignmentObj : assignments){
				if(assignmentObj.getAssignmentId()==assignmentVo.getAssignmentId()){
					ArrayList<CoursesVo> coursesList = (ArrayList<CoursesVo>) request.getSession().getAttribute("courseList");
					if(coursesList !=null){
						for(CoursesVo course :coursesList){
							if(course.getCourseId() == assignmentObj.getCourseId()){
								if(course.getModulesList() !=null && course.getModulesList().size()>0){
									for(CoursesVo module :course.getModulesList()){
										if(module.getModuleId()==assignmentObj.getModuleId()){
											moduleDetail =module;
											break;
										}
									}
									break;
								}
							}
							
						}
						
					}
					assignmentVo=assignmentObj;
					break;
				}
			}
			} catch (Exception e) {
				logger.error("AssignmentAction method:-submitAssignment "+e.getMessage());
		}
		getServletRequest().getSession().setAttribute("selectedTab","assignmentsTabId");
		return SUCCESS;
	}
	
	public void uploadAssignment() throws IOException {
		logger.debug("AssignmentAction method:-uploadAssignment ");
		HttpServletRequest request = ServletActionContext.getRequest();
		RegistrationVo loginDetail = (RegistrationVo) request.getSession().getAttribute("loginDetail");
		try{
		if(loginDetail !=null){
			AssignmentServiceIface assignmentServiceIface = new AssignmentServiceImpl();
			response = assignmentServiceIface.uploadAssignment(assignmentVo,loginDetail);
		
	        }
		if(response !=null){
		JSONObject jsonResponse = new JSONObject(response);
		if(jsonResponse.getString("statusMessage").equalsIgnoreCase("success")){
			jsonResponse.put("message", "Assignment submitted successfully");
			this.getServletResponse().getWriter().print(jsonResponse);
			}else{
				jsonResponse = new JSONObject();
				jsonResponse.put("message", "Assignmenet not submitted");
				this.getServletResponse().getWriter().print(jsonResponse);
			}
		}
		}catch (Exception e) {
			logger.error("AssignmentAction method:-uploadAssignment "+e.getMessage());
		}
		getServletRequest().getSession().setAttribute("selectedTab","assignmentsTabId");
	}
	
	
	
	
	public String viewAssignment() {
		HttpServletRequest request = ServletActionContext.getRequest();
		logger.debug("AssignmentAction method:-viewAssignment ");
		try {
		ArrayList<AssignmentVo> assignments = (ArrayList<AssignmentVo>) request.getSession().getAttribute("assignmentList");
		for(AssignmentVo assignmentObj : assignments){
			if(assignmentObj.getAssignmentId()==assignmentVo.getAssignmentId()){
				ArrayList<CoursesVo> coursesList = (ArrayList<CoursesVo>) request.getSession().getAttribute("courseList");
				if(coursesList !=null){
					for(CoursesVo course :coursesList){
						if(course.getCourseId() == assignmentObj.getCourseId()){
							if(course.getModulesList() !=null && course.getModulesList().size()>0){
								for(CoursesVo module :course.getModulesList()){
									if(module.getModuleId()==assignmentObj.getModuleId()){
										moduleDetail =module;
										break;
									}
								}
								break;
							}
						}
						
					}
					
				}
				assignmentVo=assignmentObj;
				break;
			}
		}
		} catch (Exception e) {
			logger.error("AssignmentAction method:-viewAssignment "+e.getMessage());
		}
		getServletRequest().getSession().setAttribute("selectedTab","assignmentsTabId");
		return SUCCESS;
	}
	

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		servletRequest = arg0;
	}

	/**
	 * @return the servletRequest
	 */
	public HttpServletRequest getServletRequest() {
		return servletRequest;
	}


	/**
	 * @return the assignmentList
	 */
	public ArrayList<AssignmentVo> getAssignmentList() {
		return assignmentList;
	}


	/**
	 * @param assignmentList the assignmentList to set
	 */
	public void setAssignmentList(ArrayList<AssignmentVo> assignmentList) {
		this.assignmentList = assignmentList;
	}

	public AssignmentVo getAssignmentVo() {
		return assignmentVo;
	}

	public void setAssignmentVo(AssignmentVo assignmentVo) {
		this.assignmentVo = assignmentVo;
	}

	public CoursesVo getModuleDetail() {
		return moduleDetail;
	}

	public void setModuleDetail(CoursesVo moduleDetail) {
		this.moduleDetail = moduleDetail;
	}



}
