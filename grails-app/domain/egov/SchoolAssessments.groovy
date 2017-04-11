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


class SchoolAssessments {

	School school
	ClassMaster className
	Assessments assessment		// Formative or Summative (FA1..4/ SA 1..2)
	String assessmentName		// FA1...N assessments under formative
	Integer totalScore			// Total score under which the school plans to conduct the assessment
	String createdBy
	Date createdDate
	Date modifiedDate

    static constraints = {
		assessment(nullable:false)
		assessmentName(nullable:false)
		totalScore(nullable:false)
		school(nullable:false)
    }
	
	static mapping = {
		className column: "class_master_id"
	}
}
