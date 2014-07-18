module.exports = (grunt) ->

  grunt.initConfig

    pkg: grunt.file.readJSON('package.json')

    emberTemplates:
      options:
        templateName: (name) ->
          name = name.replace 'tmp/templates/', ''
      compile:
        files:
          "public/assets/js/templates.js": "tmp/templates/**/*.hbs"

    bower_concat:
      all:
        dest: 'public/assets/js/vendor.js',

    coffee:
      compile:
        files:
          "public/assets/js/app.js" : ['app/js/**/*.coffee']

    watch:
      app:
        files: [
          'tmp/templates/**/*.hbs'
          'app/js/**/*.coffee'
        ]
        tasks: [
          'emberTemplates'
          'coffee'
        ]
        options:
          debounceDelay: 100

    connect:
      server:
        options:
          base: 'public'
          port: 8000
          hostname: '*'

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-ember-templates'
  grunt.loadNpmTasks 'grunt-ember-handlebars'
  grunt.loadNpmTasks 'grunt-modernizr'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-bower-concat'
  grunt.loadNpmTasks 'grunt-contrib-connect'

  grunt.registerTask 'default', ['bower_concat', 'emberTemplates', 'coffee', 'connect', 'watch']

  return