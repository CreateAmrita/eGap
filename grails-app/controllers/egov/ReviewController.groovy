package egov

import grails.plugins.springsecurity.Secured

class ReviewController {
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def index() { }

	@Secured(['IS_AUTHENTICATED_FULLY'])
    def ratingIndex = { 
		def school = EgovSchoolDetails.executeQuery("from EgovSchoolDetails where rating BETWEEN 8 AND 10 order by rating desc limit 6",[offset:0, max:10]);
		["school":school]
		
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def randReviews = {
		def schools = EgovSchoolDetails.list()
		schools.each { x->
			def sch = EgovSchoolDetails.findById(x.id)
			Random random = new Random();
			def review = random.nextInt(500 - 100) + 42
			sch.review = review.toInteger()
			sch.save(flush:true)
		}
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def rate = {
		def school = EgovSchoolDetails.get(params.id);
		["school":school]
	
	}
	
}
