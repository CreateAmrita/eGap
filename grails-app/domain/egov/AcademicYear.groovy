/**
 *
 *
 * @author CREATE@Amrita,Amrita Vishwa Vidyapeetham.
 *
 *
 *
 */
package egov

class AcademicYear {
	String startYear
	String endYear
	String status  			//a for active d for de-active / deleted
	Boolean current 		//denotes the current academic year
	
	static constraints = {
		startYear(nullable:false)
		endYear(nullable:false)
		status(nullable:false)
		current(nullable:false)
	}

}
