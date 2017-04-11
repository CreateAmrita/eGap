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


class UserDetails {
	User user
	String firstName
	String middleName
	String lastname
	Date dateOfBirth
	String gender
	String nationality
	String religion
	String community
	String communityName
	Address permenantAddr
	Address communicationAddr
	//Date dateOfRegistration
	String specification //for teachers
	Integer yearsOfExp //for teachers
	String occupation //for parent
	String phone
	String mobile
	String relationship //for parent
	Date modifiedDate
	Integer annualIncome
	Boolean tetQualified
	Boolean isOnlyChild
	BloodGrpMaster bloodGrp

    static constraints = {
		user(nullable:false)
		firstName(nullable:true)
		middleName(nullable:true)
		lastname(nullable:true)
		gender(nullable:true)
		dateOfBirth(nullable:true)
		nationality(nullable:true)
		religion(nullable : true)
		community(nullable : true)
		communityName(nullable:true)
		permenantAddr(nullable:true)
		communicationAddr(nullable:true)
	//	dateOfRegistration(nullable:false)
		specification(nullable:true)
		yearsOfExp(nullable:true)
		occupation(nullable:true)
		modifiedDate(nullable:true)
		phone(nullable:true)
		mobile(nullable:true)
		relationship(nullable:true)
		annualIncome(nullable:true)
		tetQualified(nullable:true)
		isOnlyChild(nullable:true)
		bloodGrp(nullable:true)
	
    }
	
	static mapping = {
		user column:"user_id"
		permenantAddr column: "pa_details_id"
		communicationAddr column: "ca_details_id"
	}
	
	def beforeInsert() {
//		dateOfRegistration = new Date()
		modifiedDate = new Date()
	}

	def beforeUpdate() {
		modifiedDate = new Date()
	}


}
