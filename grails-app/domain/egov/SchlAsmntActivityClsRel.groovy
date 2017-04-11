/**
 *
 *
 * @author CREATE@Amrita,Amrita Vishwa Vidyapeetham.
 *
 *
 *
 */
package egov

import java.sql.Date;
import java.sql.Timestamp;

class SchlAsmntActivityClsRel {
	
	SchoolAssessments schoolAssessment		// FA assessments
	SchoolClassRel schoolClass
	SchoolClassDivision schlClsDiv
	Integer activityScore
	AssessmentActivities assmntActivity		// id of AssessmentActivities table for the Activity being conducted for FA assessments
	String activityMode						// Online for quiz or Classroom for others
	String status							// Active for open items and Complete for closed items
	//QnPaper questionPaper					// id of the question paper in QnPaper table linked to the assessment
	Date startDate
	Date endDate
	Timestamp startTime
	Timestamp endTime
	String createdBy
	Date createdDate
	Date modifiedDate

	static constraints = {
		schoolAssessment(nullable:false)
		schoolClass(nullable:false)
		schlClsDiv(nullable:false)
		assmntActivity(nullable:false)
		activityMode(nullable:false)
	//	questionPaper(nullable:true)
		createdBy(nullable:false)
		createdDate(nullable:false)
		modifiedDate(nullable:false)
		activityScore(nullable:true)
		startDate(nullable:true)
		endDate(nullable:true)
		startTime(nullable:true)
		endTime(nullable:true)
		
	}
	
	static mapping = {
	}

}
