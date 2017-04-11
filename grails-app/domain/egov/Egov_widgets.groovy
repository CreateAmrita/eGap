package egov

import java.util.Date;

class Egov_widgets {
	
	String title
	String link	
	String data
	String type
	String height
	
    static constraints = {
		title(nullable:true)
		link(nullable:true)
		data(nullable:true)
		type(nullable:true)
		height(nullable:true)
    }
}
