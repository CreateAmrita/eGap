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

class SubjectMaster {
	
	String subject
	String description
	ClassMaster className
	//AcademicYear academicYr
	String subjectIdentifier //given by CBSE
	String required //Y/N if Y compulsory, else optional subject
	String status
	String subjectType
	String createdBy
	Date createdDate
	Date modifiedDate
	

    static constraints = {
		subject(nullable:false)
		description(size:0..2147483646,nullable:false)
		subjectIdentifier(nullable:false)
		className(nullable:false)
		//academicYr(nullable:false)
		subjectIdentifier(nullable:false)
		required(nullable:false)
		createdBy(nullable:false)
		}
	
	static mapping = {
		description type: 'text'
		className column: "class_master_id"
	}
}
