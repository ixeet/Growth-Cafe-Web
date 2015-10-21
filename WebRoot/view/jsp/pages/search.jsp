<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">

	$(document).ready(function(){
	 var tabId ='${searchTextStudent}';
		$("#studentSearchTextId").val(tabId);
		var tabId1 ='${selectedTab}';
		$("#"+tabId1).parent().removeClass("active");
	});
	
	var counter = 5;
	var assignmentCounter=5;
	var courseCounter=5;
	var profileCounter=5;
	
	function viewMoreData(totalSize){
	//alert(counter);
	var url="getMoreUpdatesStudents";
	$.ajax({
		type		:	"POST",
			url			:	url,
			data		:	{"offset":counter},
			dataType	:	"json",
			beforeSend		:	function(){
					},
		success	:	function(result){
		for(var i=0; i<result.length; i++){ 
			$("#updatesId").before("<div class='col-xs-12 col-md-12 col-lg-12'  style=' cursor: pointer; cursor: hand;'  onclick='getNotificationDetail("+result[i].feedId+");'>"+
					               "<div class='timeline-block1' >"+
					                "<div class='panel panel-default ' style='padding: 8px;'>"+
					                   
					                       " <div class='media-left'>"+
					                      " <a  href='javaScript:;' onclick='personalProfile("+result[i].userId+");'>"+
					                           " <img src='"+result[i].profilePhotoFileName+"' class='media-object width-50 height-50'>"+
					                         " </a>"+
					                         " </div>"+
					                       " <div class='media-body'>"+
					                           " <span><h6 class='color_blue1  link-text-color'> "+result[i].feedText+"</h6> &nbsp;</span>"+
												"<br><i>"+result[i].feedOn+"</i>"+
					                       " </div>"+
					                   
					               " </div>"+
									"</div>"+
					              "</div>");
			}
					   counter+=5;  
		},
		complete	:	function(){
		
		}
	});
} 


function viewMoreAssignment(){
var url="getMoreAssignmentStudent";
	$.ajax({
		type		:	"POST",
			url			:	url,
			data		:	{"offset":assignmentCounter},
			dataType	:	"json",
			beforeSend		:	function(){
			
		},
		success	:	function(result){
		
		
		for(var i=0; i<result.length; i++){ 
			$("#assignmentId").before("<div class='media'>"+
                                 "<div class='media-right'>"+
                                    	"<iframe width='160' height='120' src='https://www.youtube.com/embed/r2H2CcM3NuI' frameborder='0' allowfullscreen></iframe>"+
                                  "</div>"+
                                  "<div class='media-body'>"+
                                    "<h4 class='media-heading'> "+result[i].assignmentName+"</h4>"+
                                    "<p>"+result[i].assignmentDesc+"</p>"+
                                  "</div>"+
                                "</div>");
			}
					   assignmentCounter+=5;  
		},
		complete	:	function(){
		
		}
	});

}

function viewMoreCourse(){
var url="getMoreCourseStudent";
	$.ajax({
		type		:	"POST",
			url			:	url,
			data		:	{"offset":profileCounter},
			dataType	:	"json",
			beforeSend		:	function(){
			
		},
		success	:	function(result){
		
		for(var i=0; i<result.length; i++){ 
			$("#courseIdDiv").before("<div class='media'> "+                                
                                 " <div class='media-body'>"+ 
                                    "<h4 class='media-heading'>"+result[i].courseName+"</h4>"+ 
                                   " <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. </p>"+ 
                                    "<div class='panel-default'>"+ 
                                    "<div class='row'>"+ 
                                    	"<div class='col-sm-3'>"+ 
                                    	"<i class='fa fa-calendar'></i> Start Date : 10/09/2015"+ 
                                        "</div>"+ 
                                       " <div class='col-sm-3'>"+ 
                                    	"<i class='fa fa-calendar'></i> End Date : 10/15/2015"+ 
                                       " </div>"+ 
                                       " </div>"+ 
                                   " </div>"+ 
                                    
                                 " </div>"+ 
                              "  </div>");
			}
					   profileCounter+=5;  
		},
		complete	:	function(){
		
		}
	});

}


function viewMoreprofile(aa){
var url="getMoreProfileStudent";
	$.ajax({
		type		:	"POST",
			url			:	url,
			data		:	{"offset":assignmentCounter},
			dataType	:	"json",
			beforeSend		:	function(){
			
		},
		success	:	function(result){
		
		for(var i=0; i<result.length; i++){ 
			$("#profileId").before("<div class='media'>"+
                                 " <div class='media-left'>"+
                                  "  <a href='javaScript:;'>"+
                                     " <img class='media-object' src='"+result[i].profileImage+"' alt='...'>"+
                                   " </a>"+
                                 " </div>"+
                                 " <div class='media-body'>"+
                                    "<div class='table-responsive'>"+
                                    	"<table class='table table-condensed'>"+
                                        	"<tbody>"+
                                            	"<tr>"+
                                                	"<td width='20%'>Name </td>"+
                                                  "  <td width='80%'> "+result[i].userName+"</td>"+
                                              "  </tr>"+
                                              "  <tr>"+
                                                	"<td>Organization</td>"+
                                                  "  <td>ABCD</td>"+
                                               " </tr>"+
                                                
                                               " <tr>"+
                                                	"<td>Department</td>"+
                                                   " <td>ABCD</td>"+
                                               " </tr>"+
                                                
                                           " </tbody>"+
                                      "  </table>"+
                                   " </div>"+
                                 " </div>"+
                                "</div>"+
                              "  </div>");
			}
					   profileCounter+=5;  
		},
		complete	:	function(){
		
		}
	});

}

</script>


<div class="container margin_topm22">
 <div class="page-section">
            <div class="row">
              
              <div class="col-md-8">
              		<div id="sresult">

                      <!-- Nav tabs -->
                      <ul class="nav nav-tabs" role="tablist">
                      	<li role="presentation" class="active"><a href="#updateId" aria-controls="updateId" role="tab" data-toggle="tab">Update</a></li>
                        <li role="presentation"><a href="#assignmentId" aria-controls="assignmentId" role="tab" data-toggle="tab">Assignment</a></li>
                        <li role="presentation"><a href="#courseId" aria-controls="courseId" role="tab" data-toggle="tab">Course </a></li>
                        <li role="presentation"><a href="#PeopleId" aria-controls="PeopleId" role="tab" data-toggle="tab">People</a></li>
                      </ul>
                    
                      <!-- Tab panes -->
                      <div class="tab-content">
                        
                        
                        <div role="tabpanel" class="tab-pane" id="assignmentId">
                        	
                            <s:if test="assignmentList !=null && assignmentList.size()>0">
                            <s:iterator value="assignmentList">
                            <div class="media">
                                  <div class="media-right">
                                    	<iframe width="160" height="120" src="https://www.youtube.com/embed/r2H2CcM3NuI" frameborder="0" allowfullscreen></iframe>
                                  </div>
                                  <div class="media-body">
                                    <h4 class="media-heading"><s:property value="assignmentName"/> </h4>
                                    <p><s:property value="assignmentDesc"/> </p>
                                  </div>
                                </div>
                               </s:iterator>
                                <input id="assignmentId" type="button" value="view more"   onclick="viewMoreAssignment();" />
                              </s:if>
                        </div>
                        
                        
                        
                        <div role="tabpanel" class="tab-pane" id="courseId">
                        <s:if test="coursesList !=null && coursesList.size()>0">
                        	<s:iterator value="coursesList">
                        	<div class="media">                                  
                                  <div class="media-body">
                                    <h4 class="media-heading"><s:property value="courseName"/> </h4>
                                    <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. </p>
                                    <div class="panel-default">
                                    <div class="row">
                                    	<div class="col-sm-3">
                                    	<i class="fa fa-calendar"></i> Start Date : 10/09/2015
                                        </div>
                                        <div class="col-sm-3">
                                    	<i class="fa fa-calendar"></i> End Date : 10/15/2015
                                        </div>
                                        </div>
                                    </div>
                                    
                                  </div>
                                </div>
                                </s:iterator>
                                 <input id="courseIdDiv" type="button" value="view more"   onclick="viewMoreCourse();" />
                              </s:if>
                            
                        </div>
                        <div role="tabpanel" class="tab-pane  active" id="updateId">
                        <s:if test="updateList !=null && updateList.size()>0">
                            <s:iterator value="updateList" status="counter">
                            	<div class="col-xs-12 col-md-12 col-lg-12"  style=' cursor: pointer; cursor: hand;'  onclick="getNotificationDetail(<s:property value="feedId"/>);">
				
					                <div class="timeline-block1" >
					                  <div class="panel panel-default " style="padding: 8px;">
					
					                     
					                        <div class="media-left">
					                          <a  href="javaScript:;" onclick="personalProfile(${user.userId});">
					                          	<s:if test="user.profilePhotoFileName !=null && user.profilePhotoFileName!=''">
					                            <img src='<s:property value="user.profilePhotoFileName" />' class="media-object width-50 height-50">
					                            </s:if>
					                            <s:else>
					                            	<img src='view/helper/images/people/50/guy-6.jpg' class="media-object width-50 height-50">
					                            </s:else>
					                          </a>
					                        </div>
					                        <div class="media-body">
											
					                            <span><h6 class="color_blue1  link-text-color"> <s:text name="feedText"/></h6></span>
												<br><i><s:property value="feedOn" /> </i>
					                        </div>
					                     
					                </div>
									</div>
					              </div>
					              
					               
                            </s:iterator>
                            <input id="updatesId" type="button" value="view more"   onclick="viewMoreData('<s:property value="updateList.size"/>');" />
                            </s:if>

						</div>
                        <div role="tabpanel" class="tab-pane" id="PeopleId">
                        <s:if test="profileList !=null && profileList.size()>0">
                            <s:iterator value="profileList">
                        	<div class="media">
                                  <div class="media-left">
                                    <a href="#">
                                      <img class="media-object" src="<s:property value="profilePhotoFileName"/>" alt="...">
                                    </a>
                                  </div>
                                  <div class="media-body">
                                    <div class="table-responsive">
                                    	<table class="table table-condensed">
                                        	<tbody>
                                            	<tr>
                                                	<td width="20%">Name </td>
                                                    <td width="80%"><s:property value="userName"/></td>
                                                </tr>
                                                <tr>
                                                	<td>Organization</td>
                                                    <td>ABCD</td>
                                                </tr>
                                                
                                                <tr>
                                                	<td>Department</td>
                                                    <td>ABCD</td>
                                                </tr>
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                  </div>
                                </div>
                                </s:iterator>
                                  <input id="profileId" type="button" value="view more" onclick="viewMoreprofile('<s:property value="updateList.size"/>');" />
                                </s:if>
                                
                        </div>
                      </div>
                    
                    </div>
              </div>  
              </div>
        </div>
</div>