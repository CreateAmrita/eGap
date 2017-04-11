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

class SchoolLibraryDetails {
	AcademicYear academicYear
	School school
	Integer noOfBooks
	Integer periodicals
	Integer dailies
	Integer refBooks
	Integer magazine
	String createdBy
	Date createdDate
	Date modifiedDate
		

	static constraints = {
		noOfBooks(nullable:false)
		periodicals(nullable:false)
		dailies(nullable:false)
		refBooks(nullable:false)
		magazine(nullable:false)
	}
	
	
}
