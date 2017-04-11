/**
 *
 *
 * @author CREATE@Amrita,Amrita Vishwa Vidyapeetham.
 *
 *
 *
 */
package egov

class UserLoginDetails {
	
	User user
	String sessionId
	Integer sessionCount
	Date loginTime
	Integer loginDuration
	String loginIp
	String status
	
    static constraints = {
		loginDuration nullable: true
		sessionCount nullable:true
		
    }
}
