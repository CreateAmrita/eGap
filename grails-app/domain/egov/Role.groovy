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

class Role {
	String authority		// Name of the role
	Integer hierarchy		// Hierarchy level of the role
	String createdBy
	Date createdDate
	Date modifiedDate

	static mapping = {
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
		hierarchy(nullable:true)
		createdBy(nullable:true)
		createdDate(nullable:true)
		modifiedDate(nullable:true)
	}
	
	def beforeInsert(){
		createdDate =  new Date()
		modifiedDate = new Date()
	}

	def beforeUpdate(){
		modifiedDate = new Date()
	}
}
