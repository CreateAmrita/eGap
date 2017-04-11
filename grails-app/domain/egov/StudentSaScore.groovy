/**
 *
 *
 * @author CREATE@Amrita,Amrita Vishwa Vidyapeetham.
 *
 *
 *
 */
package egov

import java.util.Date;

class StudentSaScore {

	SummativeAssessments summativeAssessment
	AcademicYear academicYr
	AcademicTerms academicTerm
	ClassMaster className
	SchoolClassDivision division
	SubjectMaster subject
	User student
	String assessmentName
	Double marksObtained
	Double saScorea
	Double saScoreb
	Double percentage
	School school
	String createdBy
	Date createdDate
	Date modifiedDate
	
    static constraints = {
		summativeAssessment(nullable:false)
		student(nullable:false)
		marksObtained(nullable:false)
		saScorea(nullable:false)
		saScoreb(nullable:false)
		percentage(nullable:false)
		school(nullable:false)
		academicYr(nullable:false)
		academicTerm(nullable:false)
		className(nullable:false)
		division(nullable:false)
		subject(nullable:false)
		createdBy(nullable:false)
		createdDate(nullable:false)
		modifiedDate(nullable:false)
    }
	static mapping = {
		className column: "class_master_id"
	}
}
