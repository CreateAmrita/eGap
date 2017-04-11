
<!-- 
 * 
 * @author CREATE@Amrita,Amrita Vishwa Vidyapeetham.
 *  
 -->
 <g:if test="${students}">
	<table id="container listStud reportTable" class="table table-striped table-bordered table-hover responsive " width="100%" border="0"cellspacing="0">
			<tr>
				<th width="5%"></th>
				<th>Student ID</th>
				<th>Student Name</th>
				<th>Transferred School</th>
				<th>Reason</th>
				<th>Date Of Application</th>
			</tr>
			<g:each in="${students}" var="i" status="ik">
				<tr>
					<td width="5%">${ik+1}</td>
					<td>${i.value.studentId}</td>
					<td>${i.value.studentName}</td>
					<g:if test="${i.value.toSchool}">
						<td>
							${i.value.toSchool}
						</td>
					</g:if>
					<g:else>
						<td>
							-
						</td>
					</g:else>
					<td>${i.value.reason}</td>
					<td>${i.value.issueDate}</td>
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
