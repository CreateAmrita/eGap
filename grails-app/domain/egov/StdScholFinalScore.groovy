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

class StdScholFinalScore {
	User student
	School school
	AcademicYear academicYr
	ClassMaster className
	SchoolClassDivision division
	SubjectMaster subject
	Double formativeAssmt 	//FA1 + FA2 + FA3 + FA4
	Double summativeAssmt	//SA1 + SA2
	Double finalScore		//FA1 + FA2 + FA3 + FA4 + SA1 + SA2 
	Double gradePoint
	String grade
	String createdBy
	Date createdDate
	Date modifiedDate

    static constraints = {
		student(nullable:false)
		school(nullable:false)
		academicYr(nullable:false)
		className(nullable:false)
		division(nullable:false)
		subject(nullable:false)
		formativeAssmt(nullable:false)
		summativeAssmt(nullable:false)
		finalScore(nullable:false)
    }
	
	static mapping = {
		student column:"student_id"
		subject column:"subject_master_id"
	}
	
	def beforeInsert(){
		createdDate =  new Date()
		modifiedDate = new Date()
	}

	def beforeUpdate(){
		modifiedDate = new Date()
	}
}
