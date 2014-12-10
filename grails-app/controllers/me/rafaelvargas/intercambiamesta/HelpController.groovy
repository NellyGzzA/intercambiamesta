package me.rafaelvargas.intercambiamesta

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER'])
class HelpController {

    def index() { }
}
