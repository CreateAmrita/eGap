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

class StdScholSaActivityScore {

    SummAsmntActivityClsRel assmntActivity		// Summative 
	User student	
	Double marksObtained
	String grade
	School school
	AcademicYear academicYr
	ClassMaster className
	SchoolClassDivision division
	String createdBy
	Date createdDate
	Date modifiedDate

	static constraints = {
		assmntActivity(nullable:false)
		student(nullable:false)
		marksObtained(nullable:false)
		grade(nullable:true)
		school(nullable:false)
		academicYr(nullable:false)
		className(nullable:false)
	}
	
	static mapping = {
		assmntActivity column: "assmnt_activity_class_rel_id"
		student column: "student_id"
		school column: "school_id"
		academicYr column: "academic_year_id"
		className column: "class_master_id"
	}
	
	def beforeInsert(){
		createdDate =  new Date()
		modifiedDate = new Date()
	}

	def beforeUpdate(){
		modifiedDate = new Date()
	}
}
