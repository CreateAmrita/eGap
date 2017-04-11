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

class SchoolClassDivision {

	SchoolClassRel schoolClass		// id of the school class in SchoolClassRel table
	String division
	User classTeacher				// id of the teacher in User table
	String createdBy
	Date createdDate
	Date modifiedDate

	static constraints = {
		schoolClass(nullable:false)
		division(nullable:false)
		classTeacher(nullable:true)
	}
	
	static mapping = {
		schoolClass column: "school_class_rel_id"
		classTeacher column: "class_teacher_id"
	}
}
