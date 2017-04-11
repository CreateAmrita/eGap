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

class StudentCoschoScore {

	PartSubpartIndicatorRel part
	PartSubpartIndicatorRel subPart
	Integer totalScore
	Double gradePoint
	String grade
	User student
	School school
	AcademicYear academicYr
	ClassMaster className
	SchoolClassDivision division
	String createdBy
	Date createdDate
	Date modifiedDate

    static constraints = {
		part(nullable:false)
		subPart(nullable:true)
		student(nullable:false)
		totalScore(nullable:false)
		gradePoint(nullable:false)
		grade(nullable:false)
		student(nullable:false)
		school(nullable:false)
		academicYr(nullable:false)
		className(nullable:false)
		division(nullable:false)
    }
	
	static mapping = {
		part column: "part_id"
		subPart column: "sub_part_id"
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
