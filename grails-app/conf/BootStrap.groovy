import me.rafaelvargas.intercambiamesta.User
import me.rafaelvargas.intercambiamesta.Role
import me.rafaelvargas.intercambiamesta.UserRole

class BootStrap {

	def init = { servletContext ->
		if(!Role.count()) {
			
			new Role(authority: 'ROLE_USER').save(flush: true)
			new Role(authority: 'ROLE_ADMIN').save(flush: true)
			
			assert Role.count() == 2
		}
	}
	def destroy = {
	
	}
}
