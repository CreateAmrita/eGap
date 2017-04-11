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

class StdSchoActivityPerform {

	StdScholActivityScore activityScore
	String indicatorList
	User student
	String createdBy
	Date createdDate
	Date modifiedDate
    static constraints = {
		activityScore(nullable:false)
		indicatorList(nullable:false)
		student(nullable:false)
		createdBy(nullable:false)
		createdDate(nullable:false)
		modifiedDate(nullable:false)
    }
}
