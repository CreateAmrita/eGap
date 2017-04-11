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

class StudentFaScore {
	
	SchoolAssessments schoolAssmnt
	String assessmentName
	User student
	Double marksObtained
	Double percentage
	School school
	AcademicYear academicYr
	AcademicTerms academicTerm
	ClassMaster className
	SchoolClassDivision division
	SubjectMaster subject
	String createdBy
	Date createdDate
	Date modifiedDate
	
    static constraints = {
		schoolAssmnt(nullable:false)
		student(nullable:false)
		marksObtained(nullable:false)
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
