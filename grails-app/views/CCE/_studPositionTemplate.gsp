<!-- 
 * 
 * @author CREATE@Amrita,Amrita Vishwa Vidyapeetham.
 *  
 -->
 <g:if test="${students}">
<table id="StudentList listStud reportTable" class="table table-striped table-bordered table-hover responsive " width="100%" border="0" cellspacing="0">
		<tr>
			<th></th>
			<th>Student ID</th>
			<th>Student Name</th>
			<th>Division</th>
			<th>Mark</th>
		</tr>
		<g:each in="${students}" var="i" status="ik">
			<!-- <tr data-href="${createLink(controller:'CCE', action:'studPositionReportGraph')}" style="color:black; cursor: pointer;" onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);" onmousedown="setValues(this,${i.value.studentId},'${i.value.studentName}')"> -->	
			<tr style="color:black; cursor: pointer;" onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);" onclick="setValues(${i.value.studentId},'${i.value.studentName}')">
						<td width="5%" class="centerFields">
							${ik+1}
						</td>
						<td>
							${i.value.studentId}
						</td>
						<td>
							${i.value.studentName}
						</td>
						<td>
							${i.value.studDiv}
						</td>
						<td>
							${i.value.stdTotFinPerc}
						</td>
				</tr>
		</g:each>
</table>
	</g:if>
<g:else>
	<tr class="dataTable_rows" id="">
		<td width="100%" class="centerFields">No Students in the Class.</td>
	</tr>
</g:else>
