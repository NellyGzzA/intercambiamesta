package me.rafaelvargas.intercambiamesta

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER'])
class ContactController {
	
	static allowedMethods = [index: ['GET','POST']]
	
	def springSecurityService
	def grailsApplication
	def emailService
	
	def index() {
		if(request.method == 'POST') {
			User userInstance = springSecurityService.currentUser
			
			if(params.message) {
				emailService.sendMail(userInstance.username,
									  [grailsApplication.config.contactmail.admin],
									  "Correo de contacto de ${userInstance.username}",
									  params.message)
				
				flash.message = "Mensaje enviado"
			}
			else {
				flash.error = "Mensaje vacío"
			}
			
			redirect action:'index'
		}
	}
}
