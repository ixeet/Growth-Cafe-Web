 <%@ taglib prefix="s" uri="/struts-tags"%>

<div class="parallax overflow-hidden  page-section third margin-section">
        <div class="container parallax-layer" data-opacity="true" style="opacity: 1; transform: translate3d(0px, 0px, 0px);">
            <div class="media v-middle">
                
                <div class="media-body">
                    <h3 class="text-black margin-v-0"><a class="transf" href="#">Profile </a> / ${firstName } ${lastName }</h3>
					
                  
                </div>
               
            </div>
        </div>
    </div>
   <div class="container">
        <div class="page-section">
            <div class="row">
                <div class="col-md-9">
                    <!-- Tabbable Widget -->
                    <div class="panel panel-default" >
                        <div class="panel-heading bgntext ">
                            <h4 class="text-white">Personal Profile </h4>
                        </div>
					
                        <div class="panel-body list-group">
							<div class="col-md-10">
                           <ul class="list-group relative paper-shadow" data-hover-z="0.5" data-animated>
									<li class="list-group-item paper-shadow">
                                        <div class="media v-middle">
                                            
                                            <div class="media-body">
                                               <h4 style="color:#ba0032">Full Name :  <a href="#" class="text-subhead link-text-color">${firstName } ${lastName }</a></h4>
                                                
                                            </div>
                                           
                                        </div>
                                    </li>
									<li class="list-group-item paper-shadow">
                                        <div class="media v-middle">
                                            
                                            <div class="media-body">
                                               <h4 style="color:#ba0032">Email :  <a href="#" class="text-subhead link-text-color">${emailId }</a></h4>
                                                
                                            </div>
                                           
                                        </div>
                                    </li>
									
                                    <li class="list-group-item paper-shadow">
                                        <div class="media v-middle">
                                            
                                            <div class="media-body">
                                               <h4 style="color:#ba0032">School :  <a href="#" class="text-subhead link-text-color">${schoolName }</a></h4>
                                                
                                            </div>
                                           
                                        </div>
                                    </li>
                                    <li class="list-group-item paper-shadow">
                                        <div class="media v-middle">
                                            
                                            <div class="media-body">
                                                <h4 style="color:#ba0032">Class :  <a href="#" class="text-subhead link-text-color">${className }</a></h4>
                                                
                                            </div>
                                           
                                        </div>
                                    </li>
									<li class="list-group-item paper-shadow">
                                        <div class="media v-middle">
                                            
                                            <div class="media-body">
                                                <h4 style="color:#ba0032">Home Room :  <a href="#" class="text-subhead link-text-color">${homeRoomName }</a></h4>
                                                
                                            </div>
                                           
                                        </div>
                                    </li>
									
                                </ul>
                        </div><!-- div left closed-->
						
						<div class="col-md-2">
					<img src="view/helper/images/people/50/guy-6.jpg" alt="person" class="img-circle width-130">
					
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