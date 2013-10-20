// Karma configuration
// Generated on Fri Oct 18 2013 00:13:18 GMT-0400 (Eastern Daylight Time)

module.exports = function(config) {
  config.set({

    // base path, that will be used to resolve files and exclude
    basePath: '..',


    // frameworks to use
    frameworks: ['jasmine'],


    // list of files / patterns to load in the browser
    files: [
        'bower_components/jquery/jquery.js',
        'bower_components/angular/angular.js',
        'bower_components/angular-mocks/angular-mocks.js',
        'bower_components/jasmine-jquery/lib/jasmine-jquery.js',
        'bower_components/bootstrap/docs/assets/js/bootstrap.js',
        'bower_components/bootstrap-datepicker/js/bootstrap-datepicker.js',

        'js/*.js',

        'test/unit/**/*.spec.coffee'
    ],


    // generates js files from coffeescript files and html template
    preprocessors: {
      'test/**/*.coffee': 'coffee'
    },


    // list of files to exclude
    exclude: [
      
    ],


    // test results reporter to use
    // possible values: 'dots', 'progress', 'junit', 'growl', 'coverage'
    reporters: ['progress'],


    // web server port
    port: 9876,


    // enable / disable colors in the output (reporters and logs)
    colors: true,


    // level of logging
    // possible values: config.LOG_DISABLE || config.LOG_ERROR || config.LOG_WARN || config.LOG_INFO || config.LOG_DEBUG
    logLevel: config.LOG_INFO,


    // enable / disable watching file and executing tests whenever any file changes
    autoWatch: true,


    // Start these browsers, currently available:
    // - Chrome
    // - ChromeCanary
    // - Firefox
    // - Opera
    // - Safari (only Mac)
    // - PhantomJS
    // - IE (only Windows)
    browsers: [],


    // If browser does not capture in given timeout [ms], kill it
    captureTimeout: 60000,


    // Continuous Integration mode
    // if true, it capture browsers, run tests and exit
    singleRun: false
  });
};
