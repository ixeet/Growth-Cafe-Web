<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="col-md-3">
                    <div class="panel panel-default" data-toggle="panel-collapse" data-open="true">
                        <div class="panel-heading bgntext panel-collapse-trigger">
                            <h4 class="text-white">Recent Updates</h4>
                        </div>
                        <div class="panel-body list-group pad_0">
                           <ul class="list-group relative paper-shadow" data-hover-z="0.5" data-animated>
                           		<s:iterator value="#session.feedList">
                                    <li class="list-group-item paper-shadow">
                                        <div class="media v-middle">
                                            <div class="media-left">
                                                <a href="javaScript:;" onclick="personalProfile(<s:property value="user.userId" />);">
                                                    <img src="view/helper/images/people/50/guy-6.jpg" alt="person" class="img-circle width-40" />
                                                </a>
                                            </div>
                                            <div class="media-body">
												<%-- <h6 class="text-subhead link-text-color"> <s:property value="user.firstName"/></h6> --%>
                                                <div class="text-light">
                                                     <s:text name="feedText"/>
                                                </div>
                                                
                                            </div>
                                            <div class="media-right">
                                                <div class="width-60 text-right">
                                                    <span class="text-caption text-light"><s:property value="feedOn" /> </span>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    </s:iterator>
                                    
                                </ul>
                        </div>
                    </div>
            </div>