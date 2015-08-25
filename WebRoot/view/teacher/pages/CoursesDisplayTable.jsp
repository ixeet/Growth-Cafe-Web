<%@ taglib prefix="s" uri="/struts-tags"%>

<% int row=1; %>
<div>&nbsp;</div>
<div class="table-responsive">
	<table class="table table-bordered">
		<thead>
			<tr id="thead">
				<th width="5%">S.No</th>
				<th width="20%">School Name</th>
				<th width="20%">Class</th>
				<th width="15%">Home</th>
				<th width="20%">Module Name</th>
				<th width="10%">Status</th>
				<th width="10%">Detail View</th>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="courseReportList">
				<tr id="tbody">
					<td><%= row++%></td>
					<td><s:property value="schoolName" /></td>
					<td><s:property value="className" /></td>
					<td><s:property value="homeRoomName" /></td>
					<td><s:property value="moduleName" /></td>
					<td><s:property value="status" /></td>
					<td><a href="#" onclick="viewDetail('<s:property value="id" />','<s:property value="view" />')">view</a></td>
				</tr>
			</s:iterator>

		</tbody>
	</table>
</div>