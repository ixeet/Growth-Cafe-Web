<%@ taglib prefix="s" uri="/struts-tags"%>


<s:iterator value="feedList">
             
              <div class="col-xs-12 col-md-12 col-lg-12"  style=' cursor: pointer; cursor: hand;'  onclick="getNotificationDetail(<s:property value="feedId"/>);">
				
                <div class="timeline-block">
                  <div class="panel panel-default " style="padding: 8px;">

                    <div class="panel-heading">
                      <div class="media">
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
						
                            <span><h6 class=" color_blue bold link-text-color"> <s:text name="feedTextPost"/></h6> &nbsp;</span>
							<br><i><s:property value="feedOn" /> </i>
                        </div>
                      </div>
                    </div>
                </div>
				</div>
              </div>
                </s:iterator>