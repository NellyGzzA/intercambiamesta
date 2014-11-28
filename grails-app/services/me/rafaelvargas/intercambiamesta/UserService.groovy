package me.rafaelvargas.intercambiamesta

import grails.transaction.Transactional

@Transactional
class UserService {
	
	private final roleUser = 'ROLE_USER'
	
	void updatePermissions(User userInstance) {
		
	}
	
	void register(User userInstance, Boolean enabled = true) {
		userInstance.enabled = enabled
		userInstance.save(flush:true)
		
		if(enabled) {
			Role role = Role.findByAuthority(roleUser)
			UserRole.create userInstance, role, true
		}
	}
}
