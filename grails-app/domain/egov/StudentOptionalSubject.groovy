/**
 *
 *
 * @author CREATE@Amrita,Amrita Vishwa Vidyapeetham.
 *
 *
 *
 */
package egov

class StudentOptionalSubject {

	User student
	SubjectMaster subject
    AcademicYear academicYr
	School school
	SchoolClassRel schoolClass
	String subjectType
	String status
	Date createdDate
	Date modifiedDate
	
	static constraints = {
		student(nullable:false)
		subject(nullable:false)
		academicYr(nullable:false)
		school(nullable:false)
		schoolClass(nullable:true)
	}
	
	static mapping = {
		student column: "student_id"
		subject column: "subject_master_id"
		academicYr column: "academic_year_id"
		school column: "school_id"
		
	}
}
