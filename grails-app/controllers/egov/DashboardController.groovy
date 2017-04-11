package egov

import grails.converters.JSON
import grails.plugins.springsecurity.Secured

class DashboardController {

	@Secured(['IS_AUTHENTICATED_FULLY'])
    def index() { 
		def widgets = Egov_widgets.list()
		["name":"Student_1 ","widgets":widgets]
		
	}

	@Secured(['IS_AUTHENTICATED_FULLY'])
	def cgpaValues(){
		def cgpaValues = []
		def values = CgpaValues.getAll()
		if(values){
			values.each{v->
				cgpaValues.add(v.cgpa)
			}
		}
		return cgpaValues
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def cwidget(){
		def stime = System.currentTimeMillis()
		Egov_widgets egovWidgets = null
		egovWidgets = new Egov_widgets(title:params.title,link:params.link,data:params.wdata,type:params.type,height:params.height)
		if(egovWidgets.save(flush:true)){
			render(template:'/widget/widgetContainer',model:["title":egovWidgets.title,"link":egovWidgets.link,"data":egovWidgets.data,"type":egovWidgets.type,"height":egovWidgets.height,"wid":egovWidgets.id])
		}
		else{
			render(template:'/widget/widgetContainer',model:["title":params.title,"link":params.link,"data":params.wdata,"type":params.type,"time":stime,"height":params.height])
		}
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def dwidget(){
		def egovWidgets = Egov_widgets.findById(params.wid)
		def res = [:]
		egovWidgets.delete(flush:true)
		res.status = true
		render res as JSON
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def lwidget(){
		def widgets = Egov_widgets.list()
		
	}
}
