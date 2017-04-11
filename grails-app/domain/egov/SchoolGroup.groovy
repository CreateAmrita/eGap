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

class SchoolGroup {

	String groupName
	String headquarters
	Address address
	String website
	String status
	String createdBy
	Date createdDate
	Date modifiedDate

    static constraints = {
		groupName(nullable:false)
		headquarters(nullable:true)
		address(nullable:true)
		website(nullable:true)
		status(nullable:false)
    }
	
	static mapping = {
		address column: "address_id"
	}
	
	def beforeInsert(){
		createdDate =  new Date()
		modifiedDate = new Date()
	}

	def beforeUpdate(){
		modifiedDate = new Date()
	}
}
