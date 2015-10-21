<%@ taglib prefix="s" uri="/struts-tags"%>

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
                              </s:if>
                              
                            <s:if test="updateList !=null && updateList.size()>0">
                            <s:iterator value="updateList">
                            	<div>
                            		<s:text name="feedText"/>
                           		</div>
                            </s:iterator>
                            </s:if>
                            
                            
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
                              </s:if>
                            
                            
                              