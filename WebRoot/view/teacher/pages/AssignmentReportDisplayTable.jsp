<%@ taglib prefix="s" uri="/struts-tags"%>

      <% int row=1; %>
      <div>&nbsp;</div>
		<div class="table-responsive">
                      <table class="table table-bordered">
                            <thead>
                                <tr id="thead">
                                    <th width="5%">S.No</th>
                                    <th width="20%">Student Name</th>
                                    <th width="15%">Course</th>
                                    <th width="20%">Module</th>
                                    <th width="15%">Assignment Status</th>
                                	<th width="15%">Submission Date</th>
                                	<th width="10%">Detail View</th>
                                </tr>
                            </thead>
                            <tbody>
                             <s:iterator value="assignmentReportList">
                                <tr id="tbody">
                                    <td> <%= row++%></td>
                                      <td><s:property value="studentName" /></td>
                                    <td><s:property value="courseName" /></td>
                                    <td> <s:property value="moduleName" /></td>
                                    <td><s:property value="status" /></td>
                                    <td><a href="#"><s:property value="submissionDate"/></a></td>
                                    <td><a href="#" id="<s:property value="detailView"/>">View</a></td>
                                    
                                </tr>
                               </s:iterator>
                               
                            </tbody>
                        </table>
</div>