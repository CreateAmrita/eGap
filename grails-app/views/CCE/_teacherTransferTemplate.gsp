
<!-- 
 * 
 * @author CREATE@Amrita,Amrita Vishwa Vidyapeetham.
 *  
 -->
 
<table id="StudentList listStud reportTable" class="table table-striped table-bordered table-hover responsive " width="100%" border="0"cellspacing="0">
	
	<g:if test="${students}">
		<tr>
			<th width="5%"></th>
			<th width="10%">Teacher ID</th>
			<th width="20%">Teacher Name</th>
			<th width="20%">Transferred School</th>
			<th width="25%">Reason</th>
			<th width="10%">Date Of Issue</th>
			<!-- <th width="10%">Cancel TC</th> -->
		</tr>
			
				
	
	<g:each in="${students}" var="i" status="ik">
		<tr>
			<td width="5%" class="centerFields">
				${ik+1}
			</td>
			<td>
				${i.value.teacherId}
			</td>
			<td>
				${i.value.teacherName}
			</td>
			
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
			<td>
				${i.value.reason}
			</td>
			<td>
				${i.value.issueDate}
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
      <h4><i class="icon fa fa-times"></i> No Teachers Transferred in the School.</h4>
    </div>
</g:else>
