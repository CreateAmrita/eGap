package egov

class HomeController {

    def index() { 
		
		def schools = EgovSchoolDetails.executeQuery("from EgovSchoolDetails where rating BETWEEN 8 AND 10 order by rating desc limit 6",[offset:0, max:9]);
		["topSchools":schools]
		
	}
}
