/**
 *
 *
 * @author CREATE@Amrita,Amrita Vishwa Vidyapeetham.
 *
 *
 *
 */
package egov

import java.sql.Date;

class BloodGrpMaster {
	
	String bloodGrp
	Date createdDate
	Date modifiedDate
	

    static constraints = {
		bloodGrp(nullable:false)
	}
	
	def beforeInsert(){
		createdDate =  new Date()
		modifiedDate = new Date()
	}

	def beforeUpdate(){
		modifiedDate = new Date()
	}
}
