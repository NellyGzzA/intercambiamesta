package me.rafaelvargas.intercambiamesta

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER'])
class HomeController {

    def index() {
        render(view: 'index')
    }
}
