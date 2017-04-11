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

class TeacherSubjectAssign {

	School school
	ClassMaster className
	AcademicYear academicYr
	SubjectMaster subject
	SchoolClassDivision classDivision
	User teacher
	String createdBy
	Date createdDate
	Date modifiedDate

	static constraints = {
		school(nullable:false)
		className(nullable:false)
		academicYr(nullable:false)
		subject(nullable:true)
		classDivision(nullable:true)
		teacher(nullable:false)
		createdBy(nullable:false)
	}
	
	static mapping = {
		school column: "school_id"
		className column: "class_master_id"
		teacher column: "teacher_id"
		subject column: "subject_master_id"
		classDivision column: "schl_cls_div_id"
		academicYr  column: "academic_year_id"
	}
	
	def beforeInsert(){
		createdDate =  new Date()
		modifiedDate = new Date()
	}

	def beforeUpdate(){
		modifiedDate = new Date()
	}
}
