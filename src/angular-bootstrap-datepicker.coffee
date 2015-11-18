dp = angular.module('ng-bootstrap-datepicker', [])

dp.directive 'ngDatepicker', ->
  restrict: 'A'
  replace: true
  scope:
    oiOptions: '='
    ngModel: '='
  template: """
            <div class="input-append date">
              <input type="text"><span class="add-on"><i class="icon-th"></i></span>
            </div>
            """
  link: (scope, element)->
    scope.inputHasFocus = false

    element.datepicker(scope.oiOptions).on('changeDate', (e)->

      defaultFormat = $.fn.datepicker.defaults.format
      format = scope.oiOptions.format || defaultFormat
      defaultLanguage = $.fn.datepicker.defaults.language
      language = scope.oiOptions.language || defaultLanguage

      scope.$apply -> scope.ngModel = $.fn.datepicker.DPGlobal.formatDate(e.date, format, language)
    )

    element.find('input').on('focus', ->
      scope.inputHasFocus = true
    ).on('blur', ->
      scope.inputHasFocus = false
    )

    scope.$watch 'ngModel', (newValue)->
      if not scope.inputHasFocus
        element.datepicker('update', newValue)
