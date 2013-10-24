dp = angular.module('ng-bootstrap-datepicker', [])

dp.directive 'ngDatepicker', ->
  restrict: 'A'
  replace: true
  scope:
    ngOptions: '='
    ngModel: '='
  template: """
            <div class="input-append date">
              <input type="text"><span class="add-on"><i class="icon-th"></i></span>
            </div>
            """
  link: (scope, element)->
    scope.canChangeModel = true

    element.datepicker(scope.ngOptions).on('changeDate', (e)->

      defaultFormat = $.fn.datepicker.defaults.format
      format = scope.ngOptions.format || defaultFormat
      defaultLanguage = $.fn.datepicker.defaults.language
      language = scope.ngOptions.language || defaultLanguage

      scope.$apply -> scope.ngModel = $.fn.datepicker.DPGlobal.formatDate(e.date, format, language)
    ).on('show', ->
      scope.canChangeModel = false
    ).on('hide', ->
      scope.canChangeModel = true
    )

    scope.$watch 'ngModel', (newValue)->
      if scope.canChangeModel
        element.datepicker('update', newValue)
