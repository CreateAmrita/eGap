package egov

import grails.converters.JSON


class SchoolController {
	CceReportService cceReportService = new CceReportService()

    def index() { }
	
	def search = {
		def states = EgovSchoolDetails.executeQuery("select distinct e.state from EgovSchoolDetails e")
		[states:states]
	}
	
	def listschool = {
		def state = params.state.toString()
		def schools = EgovSchoolDetails.findAllByState(state)
		render schools as JSON 
	}
	
	def randRate = {
		def schools = EgovSchoolDetails.list()
		schools.each { x->
			def sch = EgovSchoolDetails.findById(x.id)
			Random random = new Random();
			def rating = random.nextInt(10 - 4 + 1) + 4
			sch.rating = rating.toInteger()
			sch.save(flush:true)
		}
		render "Ok"
	}
	
	def view = {
		def school = EgovSchoolDetails.get(params.id);
		["school":school]
	}
	
	def compare = {
		def schools = params.sch
		Map schoolList = [:]
		def schoolSplit = schools.split(":");
		schoolSplit.each { affl -> 
			def sch = EgovSchoolDetails.findBySchoolAfflNo(affl)
			schoolList."${affl}" = sch
		}
		["schools":schoolList]
	}
	
	def autoComplete(){
		def schools = EgovSchoolDetails.list()
		def response = []

		schools.each{
			response = response+["Name":it.schoolName + " " + it.district,"school":it.id]
			//response  << "${it.state}"
		  //  response << "${it.ntts}"
		}
		render response as JSON
	}
	
	/*
	def autoStudComplete(){
		def students = cceReportService.retrieveClassStudents(params)
		def response = []
		if(students){
			students.each{c->
				response = response+["Name":c.value.stdName ,"id":c.value.stdId]
			}
		}
		 render response as JSON
	}
	*/
	
}
