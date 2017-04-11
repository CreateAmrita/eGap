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

class User {

	transient springSecurityService
	static transients = ['pass']
//	static hasMany = [authority: Role]
	//static belongsTo = Role
	
	String username
	String password
	String activationCode
	School school
	SchoolGroup schoolGroup
	String emailId
	String studentId
	String stdRollNo
	Date dateOfRegistration
	String status
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	boolean firstTimeLogin
	
	static constraints = {
		username blank: false, unique: true
		password blank: false
		activationCode(nullable:true, unique:true)
		emailId(nullable:true)
		school(nullable:true)
		schoolGroup(nullable:true)
		studentId(nullable:true)
		stdRollNo(nullable:true)
		emailId(nullable:true, unique:true)
		dateOfRegistration(nullable:false)
		status(nullable : true)
	}

	static mapping = {
		password column: "password"
		school column: "school_id"
		schoolGroup column:"school_group_id"
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}
	
	def enableUser() {
		enabled=true
		accountLocked=false
		accountExpired=false
		passwordExpired=false
	}

	def beforeInsert() {
		encodePassword()
		dateOfRegistration = new Date()
		passwordExpired=true
		firstTimeLogin=true
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
