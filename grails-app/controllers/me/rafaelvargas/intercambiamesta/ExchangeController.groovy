package me.rafaelvargas.intercambiamesta

import grails.plugin.springsecurity.annotation.Secured


@Secured(['ROLE_USER'])
class ExchangeController {
	
	def exchangeService
	def springSecurityService
	def userService
	
	static allowedMethods = [index: 'GET', create: 'GET', show: 'GET', save: 'POST']
	
	def index() {
		User userInstance = springSecurityService.currentUser
		Date today = new Date().clearTime()
		List actualExchanges = Exchange.findAllByUserAndEndDateGreaterThanEquals(userInstance, today)
		List pastExchanges = Exchange.findAllByUserAndEndDateLessThan(userInstance, today)
		[actualExchanges:actualExchanges, pastExchanges:pastExchanges]
	}
	
	def show() {
		User userInstance = springSecurityService.currentUser
		Exchange exchangeInstance = Exchange.findByUserAndId(userInstance,params.id)
		
		if(!exchangeInstance) {
			flash.error = "Intercambio no encontrado"
			redirect action:'index'
		}
		
		[exchangeInstance:exchangeInstance]
	}
	
	def create() {
	}
	
	def save() {
		User userInstance = springSecurityService.currentUser
		
		Exchange exchangeInstance = new Exchange()
		bindData(exchangeInstance, params, [include: ['name', 'endDate', 'limitAmount', 'theme']])
		exchangeInstance.user = userInstance
		
		if(!exchangeInstance.validate()) {
			chain action: 'create', model: [exchangeInstance: exchangeInstance]
			return
		}
		
		exchangeInstance = exchangeService.save(exchangeInstance)
		
		redirect action:'show',id:exchangeInstance?.id
	}
	
	def update() {
		User userInstance = springSecurityService.currentUser
		Exchange exchangeInstance = Exchange.findByUserAndId(userInstance,params.id)
		if(!exchangeInstance) {
			flash.error = "Intercambio no encontrado"
			redirect action:'index'
		}
		
		bindData(exchangeInstance, params, [include: ['name', 'endDate', 'limitAmount', 'theme']])
		
		if(exchangeInstance.validate()) {
			flash.message = "Datos actualizados"
			exchangeInstance = exchangeService.save(exchangeInstance)
		}
		else {
			flash.error = "Verifica tu información"
		}
		
		redirect action:'show',id:exchangeInstance?.id
	}
	
	def addMe() {
		User userInstance = springSecurityService.currentUser
		Exchange exchangeInstance = Exchange.findByUserAndId(userInstance,params.id)
		if(!exchangeInstance) {
			render ""
			return
		}
		exchangeService.addUser(userInstance,exchangeInstance)
		render template:'users', model:['exchangeInstance':exchangeInstance]
	}
	
	def removeUser() {
		
		User userInstance = springSecurityService.currentUser
		Exchange exchangeInstance = Exchange.findByUserAndId(userInstance,params.id)
		User anotherUser = User.findByUsername(params.username)
		
		if(!exchangeInstance || !anotherUser) {
			render ""
			return
		}
		
		exchangeService.removeUser(anotherUser,exchangeInstance)
		render template:'users', model:['exchangeInstance':exchangeInstance]
	}
	
	def addNewUser() {
		User userInstance = springSecurityService.currentUser
		Exchange exchangeInstance = Exchange.findByUserAndId(userInstance,params.id)
		
		if(!exchangeInstance) {
			render ""
			return
		}
		
		User anotherUser = User.findByUsername(params.username)?:new User()
		
		if(!anotherUser?.id) {
			params.password = 'null'
			bindData(anotherUser, params, [include: ['username', 'fullname', 'password']])
			if(!anotherUser.validate()) {
				render template:'users', model:['exchangeInstance':exchangeInstance, userInstance: anotherUser]
				return
			}
			userService.register(anotherUser,false)
		}
		
		exchangeService.addUser(anotherUser,exchangeInstance)
		render template:'users', model:['exchangeInstance':exchangeInstance]
	}
	
	def generate() {
		User userInstance = springSecurityService.currentUser
		Exchange exchangeInstance = Exchange.findByUserAndId(userInstance,params.id)
		
		if(!exchangeInstance) {
			render ""
			return
		}
		
		List results = UserExchange.findAllByExchangeAndUserToIsNull(exchangeInstance)
		
		if(results.size() < 3) {
			flash.error = "Se requieren al menos 3 usuarios libres para la asignación."
			redirect action:'show',id:exchangeInstance.id
			return
		}
		
		exchangeService.generate(results, exchangeInstance)
		
		flash.message = "Asignación completa"
		redirect action:'show',id:exchangeInstance.id
	}
	
	def forceGenerate() {
		User userInstance = springSecurityService.currentUser
		Exchange exchangeInstance = Exchange.findByUserAndId(userInstance,params.id)
		
		if(!exchangeInstance) {
			render ""
			return
		}
		
		List results = exchangeInstance.users
		
		if(results.size() < 3) {
			flash.error = "Se requieren al menos 3 usuarios para la asignación."
			redirect action:'show',id:exchangeInstance.id
			return
		}
		
		exchangeService.generate(results, exchangeInstance)
		
		flash.message = "Asignación completa"
		redirect action:'show',id:exchangeInstance.id
	}
	
	def sendMails() {
		User userInstance = springSecurityService.currentUser
		Exchange exchangeInstance = Exchange.findByUserAndId(userInstance,params.id)
		
		if(!exchangeInstance) {
			render ""
			return
		}
		
		exchangeService.sendMails(exchangeInstance)
		flash.message = "Correos enviados"
		redirect action:'show',id:exchangeInstance.id 
	}
	
	@Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
	def showOptions() {
		
		Exchange exchangeInstance = Exchange.get(params.id)
		UserExchange userExchange = UserExchange.findByExchangeAndSecret(exchangeInstance,params.secret)
		
		if(!userExchange) {
			redirect uri:'/'
			return
		}
		
		[exchangeInstance:exchangeInstance, userExchange:userExchange]
	}
	
	@Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
	def updateOptions() {
		Exchange exchangeInstance = Exchange.get(params.id)
		UserExchange userExchange = UserExchange.findByExchangeAndSecret(exchangeInstance,params.secret)
		
		if(!userExchange) {
			redirect uri:'/'
			return
		}
		
		bindData(userExchange, params, [include: ['firstOption', 'secondOption', 'thirdOption', 'comments']])
		
		if(!userExchange.validate()) {
			flash.error = "Verifica tus respuestas"
			return
		}
		else {
			flash.message = "Opciones guardadas"
			exchangeService.saveUserExchange(userExchange, exchangeInstance)
		}
		
		redirect action:'showOptions',params:[secret:params.secret,id:exchangeInstance?.id]
	}
}
