module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    clean: ['bower_components', 'node_modules']

    coffee:
      compile:
        files:
          'js/src.js': ['src/**/*.coffee']
        options:
          bare: true
          sourceMap: false

    concat:
      js:
        src: ['bower_components/bootstrap-datepicker/js/bootstrap-datepicker.js',
              'bower_components/bootstrap-datepicker/js/locales/*.js',
              'js/src.js']

        dest: 'dist/angular-bootstrap-datepicker.js'
      css:
        src: ['bower_components/bootstrap-datepicker/css/datepicker.css']
        dest: 'dist/angular-bootstrap-datepicker.css'

    uglify:
      options:
        mangle: false
      main:
        files:
          'dist/angular-bootstrap-datepicker.min.js': ['dist/angular-bootstrap-datepicker.js']

    watch:
      options:
        livereload: true
        spawn: false
        debounceDelay: 50
        atBegin: true
      coffee:
        files: 'src/**/*.coffee'
        tasks: ['coffee:compile', 'concat', 'uglify:main']


  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
