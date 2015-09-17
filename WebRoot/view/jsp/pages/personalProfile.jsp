 <%@ taglib prefix="s" uri="/struts-tags"%>

<%-- <div class="parallax overflow-hidden  page-section third margin-section">
        <div class="container parallax-layer" data-opacity="true" style="opacity: 1; transform: translate3d(0px, 0px, 0px);">
            <div class="media v-middle">
                
                <div class="media-body">
                    <h5 class="text-black margin-v-0"><a class="transf" href="#">Profile </a> / ${firstName } ${lastName }</h5>
					
                  
                </div>
               
            </div>
        </div>
    </div> --%>
   <div class="container margin_topm22">
        <div class="page-section">
            <div class="row">
                <div class="col-md-9">
                    <!-- Tabbable Widget -->
                    <div class="panel panel-default" >
                        <div class="panel-heading ">
                            <h5 class="h5_color">Personal Profile </h5>
                        </div>
					
                        <div class="panel-body list-group">
							<div class="col-md-9">
                           <ul class="list-group relative paper-shadow" data-hover-z="0.5" data-animated>
									<li class="list-group-item paper-shadow">
                                        <div class="media v-middle">
                                            
                                            <div class="media-body">
                                               <h5 style="color:#ba0032">Full Name :  <a href="#" class="text-subhead link-text-color">${firstName } ${lastName }</a></h5>
                                                
                                            </div>
                                           
                                        </div>
                                    </li>
									<li class="list-group-item paper-shadow">
                                        <div class="media v-middle">
                                            
                                            <div class="media-body">
                                               <h5 style="color:#ba0032">Email :  <a href="#" class="text-subhead link-text-color">${emailId }</a></h5>
                                                
                                            </div>
                                           
                                        </div>
                                    </li>
									
                                    <li class="list-group-item paper-shadow">
                                        <div class="media v-middle">
                                            
                                            <div class="media-body">
                                               <h5 style="color:#ba0032">Organization :  <a href="#" class="text-subhead link-text-color">${schoolName }</a></h5>
                                                
                                            </div>
                                           
                                        </div>
                                    </li>
                                    <li class="list-group-item paper-shadow">
                                        <div class="media v-middle">
                                            
                                            <div class="media-body">
                                                <h5 style="color:#ba0032">Department :  <a href="#" class="text-subhead link-text-color">${className }</a></h5>
                                                
                                            </div>
                                           
                                        </div>
                                    </li>
									<li class="list-group-item paper-shadow">
                                        <div class="media v-middle">
                                            
                                            <div class="media-body">
                                                <h5 style="color:#ba0032">Group :  <a href="#" class="text-subhead link-text-color">${homeRoomName }</a></h5>
                                                
                                            </div>
                                           
                                        </div>
                                    </li>
									
                                </ul>
                        </div><!-- div left closed-->
						
						<div class="col-md-3">
						<s:if test="profilePhotoFileName !=null && profilePhotoFileName !=''">
							<img src="${profilePhotoFileName }" alt="person" class="img-circle width-140">
							</s:if>
							<s:else>
								<img src="view/helper/images/people/50/guy-6.jpg" alt="person" class="img-circle width-140">
							</s:else>
						</div> <!-- div right pic closed-->		
					</div>
						
						
					
                    </div>
                    <br/>
                    <br/>
                </div>
				
				<!-- Recent Updates Jsp Included -->
		              			<s:include value="recentUpdates.jsp"></s:include>
		              <!-- Recent Updates Jsp Included -->              

        </div>
		                                        
										              
								                    
								                 </div>
								            </div>