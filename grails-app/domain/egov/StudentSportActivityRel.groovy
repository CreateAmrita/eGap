/**
 *
 *
 * @author CREATE@Amrita,Amrita Vishwa Vidyapeetham.
 *
 *
 *
 */
package egov


class StudentSportActivityRel {

	AcademicYear academicYr
	School school
	ClassMaster classMaster
	User student
	SportsMaster sport
	

    static constraints = {
		school(nullable:false)
		classMaster(nullable:false)
		academicYr(nullable:false)
		sport(nullable:true)
    }
	
	static mapping = {
		school column: "school_id"
		academicYr column: "academic_year_id"
	}
	
//	def beforeInsert(){
//		createdDate =  new Date()
//		modifiedDate = new Date()
//	}
//
//	def beforeUpdate(){
//		modifiedDate = new Date()
//	}
}
