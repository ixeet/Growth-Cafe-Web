<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Detail</h4>
			</div>
			<div class="modal-body">
				<s:if test="viewList!= null">
					<s:iterator value="viewList">
						<p style="width: 100%;"></p>
						<div class="row">
							<div>
								<div class="col-md-8">
									<div class="inner-div" style="border: 1px solid gray;">
										<p align="center" style="font-weight: bold; margin: 10px;">
											<s:property value="moduleName" />
											(
											<s:property value="status" />
											)
										</p>
										<hr>
										<p style="padding: 10px; align:justify;">I'm not sure why this doesn't
											work in my case. I have the same demo code in my page, and I
											coded the submit button as above. However, when I click the
											submit, the modal window flashes fast and is gone. I have to
											click the browser 'back' button to return the page.</p>
									</div>
								</div>

								<div class="col-md-4">
									<ul class="list-group">
										<li class="list-group-item">Start Date : <s:property
												value="startAssDate" />
										</li>
										<li class="list-group-item">Target Date : <s:property
												value="endAssDate" />
										</li>
										<s:if test="id == 1">
											<li class="list-group-item">Completed Date : <s:property
													value="submissionDate" />
											</li>
										</s:if>

										<li class="list-group-item">Assignment : Yes</li>
										<li class="list-group-item">Video : Yes</li>
										<li class="list-group-item">Course Author Arthur kadi</li>
									</ul>
									<input type="button" value="Marks As Completed"
										style="margin-left: 25px; " class="btn btn-default btn-sm"
										onclick="">
								</div>
							</div>


						</div>

						<p
							style="width: 100%; height: 2px; background-color: rgb(194, 194, 194); margin-top: 15px;"></p>

					</s:iterator>
				</s:if>
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>



