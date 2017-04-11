package egov

import org.grails.datastore.gorm.finders.MethodExpression.IsNull;

class RatingMaster {
	int rating
	String ratingName
    static constraints = {
		rating(nullable:false)
    }
}
