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

class SchoolClassRel {

	School school
	ClassMaster className
	Integer classVal
	AcademicYear academicYr
	String createdBy
	Date createdDate
	Date modifiedDate
	Integer totWorkingDays
	Integer totPresentDays
	
	

    static constraints = {
		school(nullable:false)
		className(nullable:false)
		academicYr(nullable:false)
		classVal(nullable:false)
		createdBy(nullable:true)
		totWorkingDays(nullable:true)
		totPresentDays(nullable:true)
		
    }
	
	static mapping = {
		school column: "school_id"
		className column: "class_master_id"
		academicYr column: "academic_year_id"
	}
	
	def beforeInsert(){
		createdDate =  new Date()
		modifiedDate = new Date()
	}

	def beforeUpdate(){
		modifiedDate = new Date()
	}
}
