<%@ taglib prefix="s" uri="/struts-tags"%>

<% int row=1; %>
<div>&nbsp;</div>
<div class="table-responsive">
	<table class="table table-bordered">
		<thead>
			<tr id="thead">
				<th width="5%">S.No</th>
				<th width="30%">Student Name</th>
				<th width="20%">Social Share</th>
				<th width="20%">Assignments</th>
				<!-- <th width="15%">Attendance</th> -->
				<th width="15%">Total Points</th>
				<th width="10%">Rank</th>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="leaderBoardReportList">
				<tr id="tbody">
					<td><%= row++%></td>
					<td><s:property value="studentName" />
					</td>
					<td><s:property value="socialShare" />
					</td>
					<td><s:property value="assignments" />
					</td>
					<%-- <td><s:property value="attendance" />
					</td> --%>
					<td><s:property value="totalPoints" />
					</td>
					<td><a href="#"><s:property value="detailView" />
					</a>
					</td>
				</tr>
			</s:iterator>

		</tbody>
	</table>
</div>