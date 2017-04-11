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

class Assessments {
	AssessmentTypes assessmentType  //Formative or Summative
	ClassMaster className
	SubjectMaster subject
	AcademicYear academicYr
	AcademicTerms term
	String assessmentName
	Integer weightage 				//in percentage
	String status					// A or D
	String createdBy
	Date createdDate
	Date modifiedDate
	
    static constraints = {
		assessmentType(nullable:false)
		weightage(nullable:false)
		className(nullable:false)
		academicYr(nullable:false)
		term(nullable:false)
    }
	
	static mapping = {
		assessmentType column: "assessment_type_id"
		className column: "class_master_id"
		academicYr column: "academic_year_id"
		term column: "academic_term_id"
		}
}
