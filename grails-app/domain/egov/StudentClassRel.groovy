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

class StudentClassRel {

	AcademicYear academicYr
	School school
	ClassMaster className
	SchoolClassDivision classDivision
	User student
	String createdBy
	Date createdDate
	Date modifiedDate

	static constraints = {
		academicYr(nullable:false)
		school(nullable:false)
		className(nullable:false)
		classDivision(nullable:true)
		student(nullable:false)
	}
	
	static mapping = {
		academicYr column:"academic_year_id"
		school column:"school_id"
		className column:"class_master_id"
		classDivision column: "class_div_id"
		student column: "student_id"
	}
	
	def beforeInsert(){
		createdDate =  new Date()
		modifiedDate = new Date()
	}

	def beforeUpdate(){
		modifiedDate = new Date()
	}
}
