<%@ taglib prefix="s" uri="/struts-tags"%>
<% int row=1; %>
<div>&nbsp;</div>

<div class="table-responsive">
	<table class="table table-bordered ">
		<thead>
			<tr id="thead">
				<th width="4%">S.No</th>
				<th width="32%">Course Name</th>
				<th width="32%">Module</th>
				<th width="32%">Status</th>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="schoolReportList">
				<tr id="tbody">
					<td><%= row++%></td>
					<td><s:property value="courseName" />
					</td>
					<td><s:property value="moduleName" />
					</td>
					<td><s:property value="status" />
					</td>
				</tr>
			</s:iterator>

		</tbody>
	</table>
</div>