dp = angular.module('ng-bootstrap-datepicker', [])
dp.directive 'ngDatepicker', ->
  restrict: 'A'
  replace: true
  transclude: true
  template: """
            <div class="input-append date">
              <input type="text"><span class="add-on"><i class="icon-th"></i></span>
            </div>
            """
  link: (scope, element, attrs, controller)->
    element.datepicker()