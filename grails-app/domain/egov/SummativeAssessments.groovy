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

class SummativeAssessments {

	School school
	ClassMaster className
	Assessments assessment
	String assessmentName
	String status
//	QnPaper questionPaper
	Integer totalScoreSa 			//total score given for summative
	Integer saScore1
	Integer saScore2
	String questionPaper
	Date startDate
	Date endDate
	Timestamp startTime
	Timestamp endTime
	String createdBy
	Date createdDate
	Date modifiedDate

     static constraints = {
		school(nullable:false)
		className(nullable:false)
		assessment(nullable:false)
		assessmentName(nullable:false)
		status(nullable:false)
		totalScoreSa(nullable:false)
		saScore1(nullable:false)
		saScore2(nullable:false)
		questionPaper(nullable:true)
		startDate(nullable:true)
		endDate(nullable:true)
		startTime(nullable:true)
		endTime(nullable:true)
		createdBy(nullable:false)
		createdDate(nullable:false)
		modifiedDate(nullable:false)
    }
	
	static mapping = {
		className column: "class_master_id"
	}
}
