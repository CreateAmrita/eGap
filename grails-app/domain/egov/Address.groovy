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

class Address {
	String addr1
	String addr2
	String district
	String state
	String country
	String pincode
	String type //PA or CA
	String createdBy
	Date createdDate
	Date modifiedDate
	
    static constraints = {
		addr1(nullable:true)
		addr2(nullable:true)
		district(nullable:true)
		state(nullable:true)
		country(nullable:true)
		pincode(nullable:true)
		createdBy(nullable:true)
    }
	
	def beforeInsert(){
		createdDate =  new Date()
		modifiedDate = new Date()
	}

	def beforeUpdate(){
		modifiedDate = new Date()
	}
}
