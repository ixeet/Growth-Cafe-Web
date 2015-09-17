 <%@ taglib prefix="s" uri="/struts-tags"%>
 
   <div class="container margin_topm22">
            <div class="row">
                <div class="col-md-7">
                    <!-- Tabbable Widget -->
                    <div class="panel panel-default" >
                         <div class="panel-heading">
                          <h5 class="h5_color">Personal Profile </h5>
                        </div>
					
                        <div class="panel-body list-group">
							<div class="col-md-9 col-xs-9 col-sm-9">
                           <ul class="list-group relative paper-shadow" data-hover-z="0.5" data-animated>
									<li class="list-group-item paper-shadow">
                                        <div class="media v-middle">
                                            
                                            <div class="media-body">
                                               <h5 style="color:#ba0032">Full Name :  <a href="javaScript:;" class="link-text-color">${firstName } ${lastName }</a></h5>
                                                
                                            </div>
                                           
                                        </div>
                                    </li>
									<li class="list-group-item paper-shadow">
                                        <div class="media v-middle">
                                            
                                            <div class="media-body">
                                               <h5 style="color:#ba0032">Email :  <a href="javaScript:;" class="link-text-color">${emailId }</a></h5>
                                                
                                            </div>
                                           
                                        </div>
                                    </li>
									
                                    <li class="list-group-item paper-shadow">
                                        <div class="media v-middle">
                                            
                                            <div class="media-body">
                                               <h5 style="color:#ba0032">Organization :  <a href="javaScript:;" class="link-text-color">${schoolName }</a></h5>
                                                
                                            </div>
                                           
                                        </div>
                                    </li>
                                    <li class="list-group-item paper-shadow">
                                        <div class="media v-middle">
                                            
                                            <div class="media-body">
                                                <h5 style="color:#ba0032">Department :  <a href="javaScript:;" class="link-text-color">${className }</a></h5>
                                                
                                            </div>
                                           
                                        </div>
                                    </li>
									<li class="list-group-item paper-shadow">
                                        <div class="media v-middle">
                                            <div class="media-body">
                                                <h5 style="color:#ba0032">Group :  <a href="javaScript:;" class="link-text-color">${homeRoomName }</a></h5>
                                                
                                            </div>
                                           
                                        </div>
                                    </li>
									
                                </ul>
                        </div><!-- div left closed-->
						<div class="col-md-3">
						<s:if test="profilePhotoFileName !=null && profilePhotoFileName !=''">
							<img src="${profilePhotoFileName}" alt="person" class="img-circle profile_img100">
							</s:if>
							<s:else>
								<img src="view/helper/images/people/50/guy-6.jpg" alt="person" class="img-circle profile_img100">
							</s:else>
						</div> <!-- div right pic closed-->		
						
						
						
						
						
						
					</div>
						
						
					
                    </div>
                    <br/>
                </div>
				
				<!-- Recent Updates Jsp Included -->
		              			<s:include value="teacherRecentUpdates.jsp"/>
		              <!-- Recent Updates Jsp Included -->              

        </div>
		                                        
										              
								                    
								                 </div>
