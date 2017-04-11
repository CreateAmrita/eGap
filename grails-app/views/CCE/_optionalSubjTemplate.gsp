
<!-- 
 * 
 * @author CREATE@Amrita,Amrita Vishwa Vidyapeetham.
 *  
 -->

<table id="StudentList listStud reportTable" class="table table-striped table-bordered table-hover responsive " width="100%" border="0"cellspacing="0">
<g:if test="${students.toStudents!=0}">
		<tr>
			<th></th>
			<th>Student ID</th>
			<th>Student Name</th>
			<th>Class</th>
			<th>Division</th>
		</tr>
	<g:each in="${students.stds}" var="i" status="ik">
		<tr>
			<td width="10%" class="centerFields">
				${ik+1}
			</td>
			<td width="20%" class="centerFields">
				${i.value.studentId}
			</td>
			<td width="30%" >${i.value.StudentName}</td>
			<td width="20%" class="centerFields">
				${i.value.className}
			</td>
			<td width="20%" class="centerFields">
				${i.value.division}
			</td>
		</tr>
	</g:each>
</g:if>
<g:else>
	<tr class="dataTable_rows" id="">
		<td width="100%" class="centerFields">No Students in the Class.</td>
	</tr>
</g:else>
</table>
<button class="btn btn-primary" type="button" style="float: right; margin-top: 10px; margin-right: 10px;" onclick="goBack()">Go Back</button>




