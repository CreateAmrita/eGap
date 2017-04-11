
<!-- 
 * 
 * @author CREATE@Amrita,Amrita Vishwa Vidyapeetham.
 *  
 -->
 <g:if test="${ret.Students}">
	<table id="container listStud reportTable" class="table table-striped table-bordered table-hover responsive " width="100%" border="0"cellspacing="0">
			<tr>
				<th width="5%"></th>
				<th width="20%">Student ID</th>
				<th width="25%">Student Name</th>
				<th width="20%">Gender</th>
				<th width="10%">Class</th>
				<th width="10%">Division</th>
				<!-- <th width="10%">Cancel TC</th> -->
			</tr>
			<g:each in="${ret.Students}" var="i" status="ik">
				<tr>
					<td width="5%" class="centerFields">
						${ik+1}
					</td>
					<td>
						${i.value.studentId}
					</td>
					<td style="text-transform: capitalize;">
						${i.value.StudentName}
					</td>
						<td>
							${i.value.gender}
						</td>
					<td>
						${i.value.className}
					</td>
					<td>
						${i.value.division}
					</td>
					<!-- <td width="10%" class="centerFields controlFields delete">
						<a class="pointer" onclick="cancelTransfer(${i.value.teacherId})">Cancel</a>
					</td> -->
				</tr>
			</g:each>
	</table>
</g:if>
<g:else>
	<div class="alert alert-success alert-dismissible">
      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
      <h4><i class="icon fa fa-times"></i> No Students Data Available at this Time.</h4>
    </div>
</g:else>
 <button class="btn btn-primary" type="button" style="float: right; margin-top: 10px; margin-right: 10px;" onclick="goBack()">Go Back</button>
