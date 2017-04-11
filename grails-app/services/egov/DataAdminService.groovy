package egov

import java.text.SimpleDateFormat

import java.util.Date
import java.util.Map

import javax.servlet.http.HttpServletRequest

import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap
import org.springframework.web.servlet.tags.ParamTag;

import sun.swing.FilePane.DetailsTableCellEditor;


class DataAdminService {

	def utilService
	def userService

	static transactional = true

	def serviceMethod() {
	}

	def getSessionCount(Map param){
		User user = User.get(param.userId)
		UserLoginDetails usrLogDet = UserLoginDetails.findByUser(user)
		return usrLogDet
	}

}
