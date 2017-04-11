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

class UserTransferDetails {
	
	String acYr
	School fromSchool
	String toSchool
	String fromClass
	String toClass
	User user
	String userRole
	String reasonForTransfer
	String requestStatus
	String tcNo
	String fatherName
	String motherName
	String dobWords
	String admissionClass
	String admissionDate
	String lastAdmissionClass
	String lastAdmissionDate
	String promotionStatus
	String examType
	String examStatus
	String failedNo
	String feeStatus
	String concession
	String lastAttendanceDate
	String rollRemovalDate
	Integer noofWorkingDays
	Integer noOfDaysPresent
	String medium
	String cocurricular
	String scoutsGuides
	String generalConduct
	String remarks
	String applicationDate
	String createdBy
	String issueDate
	String outDate
	String outPlace
	Date createdDate
	Date modifiedDate

	static constraints = {
		fromSchool(nullable:false)
		toSchool(nullable:true)
		fromClass(nullable:true)
		toClass(nullable:true)
		requestStatus(nullable:true)
		tcNo(nullable:true)
		fatherName(nullable:true)
		motherName(nullable:true)
		dobWords(nullable:true)
		admissionClass(nullable:true)
		admissionDate(nullable:true)
		lastAdmissionClass(nullable:true)
		lastAdmissionDate(nullable:true)
		promotionStatus(nullable:true)
		examType(nullable:true)
		examStatus(nullable:true)
		failedNo(nullable:true)
		feeStatus(nullable:true)
		concession(nullable:true)
		lastAttendanceDate(nullable:true)
		rollRemovalDate(nullable:true)
		noofWorkingDays(nullable:true)
		noOfDaysPresent(nullable:true)
		medium(nullable:true)
		cocurricular(nullable:true)
		scoutsGuides(nullable:true)
		generalConduct(nullable:true)
		remarks(nullable:true)
		applicationDate(nullable:true)
		issueDate(nullable:true)
		outDate(nullable:true)
		outPlace(nullable:true)
	}
	
	static mapping = {
		fromSchool column: "from_school_id"
		toSchool column: "to_school_id"
		user column: "user_id"
	}
	
	def beforeInsert(){
		createdDate =  new Date()
		modifiedDate = new Date()
	}

	def beforeUpdate(){
		modifiedDate = new Date()
	}

}
