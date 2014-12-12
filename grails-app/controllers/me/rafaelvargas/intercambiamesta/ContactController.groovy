package me.rafaelvargas.intercambiamesta

import grails.plugin.springsecurity.annotation.Secured
import org.grails.mandrill.MandrillMessage
import org.grails.mandrill.MandrillRecipient

@Secured(['ROLE_USER'])
class ContactController {
	
	static allowedMethods = [index: ['GET','POST']]
	
	def springSecurityService
	def mandrillService
	def grailsApplication
	
	def index() {
		if(request.method == 'POST') {
			User userInstance = springSecurityService.currentUser
			
			if(params.message) {
				
				List recpts = [new MandrillRecipient(name:"Admin", email:grailsApplication.config.contactmail.admin)]
				MandrillMessage message = new MandrillMessage(text:params.message, 
					subject:"Correo de contacto de ${userInstance.username}",
					from_email:userInstance.username, 
					to:recpts)
				
				mandrillService.send(message)
				
				flash.message = "Mensaje enviado"
			}
			else {
				flash.error = "Mensaje vacío"
			}
			
			redirect action:'index'
		}
	}
}
