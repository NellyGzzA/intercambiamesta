I N T E R C A M B I A M E S T A
===========

Requirements
-------

+ [JDK 1.7](http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html)
+ [Grails 2.4.4](https://grails.org/download)

Installation
-------

+ Clone the repository

```
git clone git@github.com:rvargas/intercambiamesta.git && cd intercambiamesta
```

+ Get dependencies

```
grails compile --non-interactive --refresh-dependencies
```

+ Setup database (read [DataSource file](grails-app/conf/DataSource.groovy))
+ Run
```
grails run-app
```
+ Enjoy

You don't want to install Grails?
-------
Well, you can use Grails wrapper. Give execution permissions to [grailsw](grailsw) and instead of using `grails` command, use `./grailsw`.