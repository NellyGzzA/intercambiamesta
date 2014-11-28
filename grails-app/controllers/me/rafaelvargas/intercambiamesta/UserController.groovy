package me.rafaelvargas.intercambiamesta

class UserController {
	
	def userService
	def springSecurityService
	
	static allowedMethods = [register: 'GET', save: 'POST']
	
	def register() {
	}
	
	def save() {
		
		User userInstance = User.findByUsername(params.username)?:new User()
		
		if(userInstance?.id && userInstance?.enabled) {
			flash.error = 'Tu correo ya está registrado, intenta de nuevo'
			redirect action:'register'
			return
		}
		else if(userInstance?.id) {
			bindData(userInstance, params, [include: ['fullname', 'password']])
		}
		else{
			bindData(userInstance, params, [include: ['username', 'fullname', 'password']])
			if(!userInstance.validate()) {
				chain action: 'register', model: [userInstance: userInstance]
				return
			}
		}
		userService.register(userInstance)
		springSecurityService.reauthenticate(userInstance.username,params.password)
		redirect(uri:'/')
	}
}
