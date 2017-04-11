// locations to search for config files that get merged into the main config;
// config files can be ConfigSlurper scripts, Java properties files, or classes
// in the classpath in ConfigSlurper format

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }
import org.springframework.stereotype.Controller

import grails.plugins.springsecurity.SecurityConfigType
grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [
    all:           '*/*',
    atom:          'application/atom+xml',
    css:           'text/css',
    csv:           'text/csv',
    form:          'application/x-www-form-urlencoded',
    html:          ['text/html','application/xhtml+xml'],
    js:            'text/javascript',
    json:          ['application/json', 'text/json'],
    multipartForm: 'multipart/form-data',
    rss:           'application/rss+xml',
    text:          'text/plain',
    xml:           ['text/xml', 'application/xml']
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
//grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*']

// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false

environments {
    development {
        grails.logging.jul.usebridge = true
		grails.serverURL = "http://localhost:8080"
    }
    production {
        grails.logging.jul.usebridge = false
//      grails.serverURL = "http://cce.amritacreate.org/${appName}"
//		grails.serverURL = "http://192.168.171.206:8080"
//		grails.serverURL = "http://localhost:8080"
		grails.serverURL = "http://schoolgov.in"
    }
}

// log4j configuration
log4j = {
    // Example of changing the log pattern for the default console appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}

    error  'org.codehaus.groovy.grails.web.servlet',        // controllers
           'org.codehaus.groovy.grails.web.pages',          // GSP
           'org.codehaus.groovy.grails.web.sitemesh',       // layouts
           'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
           'org.codehaus.groovy.grails.web.mapping',        // URL mapping
           'org.codehaus.groovy.grails.commons',            // core / classloading
           'org.codehaus.groovy.grails.plugins',            // plugins
           'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
           'org.springframework',
           'org.hibernate',
           'net.sf.ehcache.hibernate'
}

// Added by the Spring Security Core plugin:
grails.plugins.springsecurity.userLookup.userDomainClassName = 'egov.User'
grails.plugins.springsecurity.userLookup.authorityJoinClassName = 'egov.UserRole'
grails.plugins.springsecurity.authority.className = 'egov.Role'
//grails.plugins.springsecurity.successHandler.defaultTargetUrl = '/dashboard.gsp'
grails.plugins.springsecurity.successHandler.defaultTargetUrl = '/login/initialLoginCheck'
grails.plugins.springsecurity.failureHandler.exceptionMappings = [
   'org.springframework.security.authentication.LockedException':             '/user/accountLocked',
   'org.springframework.security.authentication.DisabledException':           '/user/accountDisabled',
   'org.springframework.security.authentication.AccountExpiredException':     '/user/accountExpired',
   'org.springframework.security.authentication.CredentialsExpiredException': '/user/passwordExpired'
]
//grails.plugins.springsecurity.roleHierarchy = '''
//ROLE_CCEADMIN > ROLE_ADMIN
//ROLE_ADMIN > ROLE_TEACHER
//ROLE_TEACHER > ROLE_STUDENT
//ROLE_STUDENT > ROLE_PARENT
//'''

//grails {
//	mail {
//	  host = "smtp.gmail.com"
//	  port = 465
//	  username = ""
//	  password = ""
//	  props = ["mail.smtp.auth":"true",
//			   "mail.smtp.socketFactory.port":"465",
//			   "mail.smtp.socketFactory.class":"javax.net.ssl.SSLSocketFactory",
//			   "mail.smtp.socketFactory.fallback":"false"]
//	}
// }
 
//grails {
//	mail {
//	  host = ""
//	  port = 25
//	  username = ""
//	  password = ""
//	  props = ["mail.smtp.auth":"true",
//			   "mail.smtp.socketFactory.port":"25",
//			   "mail.smtp.socketFactory.class":"javax.net.ssl.SSLSocketFactory",
//			   "mail.smtp.socketFactory.fallback":"false"]
//	}
// }

 grails.mail.disabled = true
 
 //images.UploadLocation = "web-app/resources/images/"
 //images.RefLocation = grails.serverURL + "/resources/images/"
images.RefLocation = grails.serverURL + "/uploads/Image"
 //Configuration Variables for Javascript files.
 jsFileLibrary{ //Configuration for JQuery Files
	 jsSrc="js"
	 jsJQueryBase = "jquery-1.8.2.min.js"
	 jsJQueryUI=""
 }
 
 jsAppLibrary{ //Configuration for Application Javascript Files
	 jsSrc="js"
	 jsFileBrowser="fileBrowser.js"
 }
 
 // Configurations for breadcrumbs
 breadcrumbs{
	 home.url=grails.serverURL + "/dashboard"
	 home.controller="dashboard"
 	 home.action = "index"
 }
  
 //domainName = "${appName}"
 