/**
 *
 *
 * @author CREATE@Amrita,Amrita Vishwa Vidyapeetham. *
 *
 *
 */
package egov

import java.util.Date;

class CbseZone {
	String zoneName
	String createdBy
	Date createdDate
	Date modifiedDate
	
	static constraints = {
		zoneName(nullable:false)
	}
	
	def beforeInsert(){
		createdDate =  new Date()
		modifiedDate = new Date()
	}

	def beforeUpdate(){
		modifiedDate = new Date()
	}
    
}
