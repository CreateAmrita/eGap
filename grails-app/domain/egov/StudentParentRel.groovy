/**
 *
 *
 * @author CREATE@Amrita,Amrita Vishwa Vidyapeetham.
 *
 *
 *
 */
package egov

class StudentParentRel {

	User student
	User parent
	String relationship
	
    static constraints = {
		student(nullable:false)
		parent(nullable:false)
	}
	
	static mapping = {
		student column: "student_id"
		parent column: "parent_id"
	}
}
