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
				<th>Class Division</th>
				
			</tr>
		<g:each in="${students}" var="i" status="ik">
			<tr style="color:black; cursor: pointer;" onmouseover="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);"  onclick="showGraph(${i.value.stdId},'${i.value.stdName}')">
				<td width="5%" class="centerFields">
					${ik+1}
				</td>
				<td>
					${i.value.stdId}
				</td>
				<td>
					${i.value.stdName}
				</td>
				<td>
					${i.value.stdDivision}
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
