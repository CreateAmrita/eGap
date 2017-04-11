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

class SchoolMgmntType {
	String schoolMgmntName		// whether it is boys or girls or co-education
		

	static constraints = {
		schoolMgmntName(nullable:false)
	}
	
	
}
