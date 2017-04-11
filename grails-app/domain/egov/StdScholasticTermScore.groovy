/**
 *
 *
 * @author CREATE@Amrita,Amrita Vishwa Vidyapeetham.
 *
 *
 *
 */
package egov

import java.util.Date

class StdScholasticTermScore {
	User student
	School school
	AcademicYear academicYr
	AcademicTerms academicTerm
	ClassMaster className
	SchoolClassDivision division
	SubjectMaster subject
	Double formativeTermScore	//FA1 + FA2 or FA3 + FA4
	Double summativeTermScore	//SA1 or SA2
	Double marksObtained		//FA1 + FA2 + SA1 or FA3 + FA4 + SA2
	String createdBy
	Date createdDate
	Date modifiedDate

	static constraints = {
		student(nullable:false)
		academicTerm(nullable:false)
		subject(nullable:false)
		marksObtained(nullable:false)
    }
	
	static mapping = {
		student column: "student_id" 
		subject column: "subject_master_id"
	}
	
	def beforeInsert(){
		createdDate =  new Date()
		modifiedDate = new Date()
	}

	def beforeUpdate(){
		modifiedDate = new Date()
	}
}
