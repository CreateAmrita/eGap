/**
 *
 *
 * @author CREATE@Amrita,Amrita Vishwa Vidyapeetham.
 *
 *
 *
 */
package egov

class SchoolLevelDetails {
	
	String levelName		// primary, upper primary/ high school/ higher secondary
	Integer minLevel
	Integer maxLevel
	
	static constraints = {
		levelName(nullable:false)
		minLevel(nullable:false)
		maxLevel(nullable:false)
    }
}
