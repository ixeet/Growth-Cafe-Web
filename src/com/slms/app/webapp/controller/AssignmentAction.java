package com.slms.app.webapp.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.io.FileUtils;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.json.JSONArray;
import org.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.slms.app.domain.utility.MultipartFileUploader;
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
								if(assignment.getAssignmentStatus()==1 && assignment.getAssignmentSubmittedDate() !=null){
									int status = Utility.checkDateIsPreDate(assignment.getAssignmentSubmittedDate());
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
				e.printStackTrace();
			}
		getServletRequest().getSession().setAttribute("selectedTab","assignmentsTabId");
		return SUCCESS;
	}
	
	public String submitAssignment() {
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
			e.printStackTrace();
		}
		getServletRequest().getSession().setAttribute("selectedTab","assignmentsTabId");
		return SUCCESS;
	}
	
	public void uploadAssignment() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		RegistrationVo loginDetail = (RegistrationVo) request.getSession().getAttribute("loginDetail");
		
		if(loginDetail !=null){
		 CloseableHttpClient httpclient = HttpClients.createDefault();
	        try {
	        		if(assignmentVo.getAssignmentRes() != null){
			        File fileToCreate = new File("E:/", assignmentVo.getAssignmentResFileName());  
			        FileUtils.copyFile(assignmentVo.getAssignmentRes(), fileToCreate);
			        HttpPost httppost = new HttpPost("http://191.239.57.54:8080/SLMS/rest/course/uploadResourceDetail");
			        FileBody fileName = new FileBody(new File("E:/"+assignmentVo.getAssignmentResFileName()));
		            StringBody resourceName = new StringBody(assignmentVo.getAssignmentName(), ContentType.TEXT_PLAIN);
		            StringBody resourceAuthor = new StringBody(loginDetail.getFirstName()+" "+loginDetail.getLastName(), ContentType.TEXT_PLAIN);
		            StringBody userName = new StringBody(loginDetail.getUserName(), ContentType.TEXT_PLAIN);
		            StringBody uploadedUrl = new StringBody(assignmentVo.getAssignmentLink(), ContentType.TEXT_PLAIN);
		            StringBody assignmentId = new StringBody(""+assignmentVo.getAssignmentId(), ContentType.TEXT_PLAIN);
		            StringBody descTxt = new StringBody(""+assignmentVo.getAssignmentDesc(), ContentType.TEXT_PLAIN);
		            HttpEntity reqEntity = MultipartEntityBuilder.create()
	                    .addPart("fileName", fileName) //File
	                    .addPart("resourceName", resourceName)
	                    .addPart("resourceAuthor", resourceAuthor)
	                    .addPart("userName", userName)
	                    .addPart("uploadedUrl", uploadedUrl)
	                    .addPart("assignmentId", assignmentId)
	                    .addPart("descTxt", descTxt)
	                    .build();
		            	httppost.setEntity(reqEntity);
		            System.out.println("executing request " + httppost.getRequestLine());
		            CloseableHttpResponse serverResponse = httpclient.execute(httppost);
	            try {
/*	                System.out.println("----------------------------------------");
	                System.out.println(serverResponse.getStatusLine());
*/	                HttpEntity resEntity = serverResponse.getEntity();
	                if (resEntity != null) {
	                    BufferedReader reader = new BufferedReader(new InputStreamReader(resEntity.getContent()));
	                    StringBuilder out = new StringBuilder();
	                    String line;
	                    while ((line = reader.readLine()) != null) {
	                        out.append(line);
	                    }
	                    response = out.toString();   //Prints the string content read from input stream
	                    reader.close();
	                }
	                EntityUtils.consume(resEntity);
	            } finally {
	            	serverResponse.close();
	            }
	          }
	        	}catch (Exception e) {
					e.printStackTrace();
				}
		       finally {
		            httpclient.close();
		        }
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
		getServletRequest().getSession().setAttribute("selectedTab","assignmentsTabId");
	}
	
	public String viewAssignment() {
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
			e.printStackTrace();
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
