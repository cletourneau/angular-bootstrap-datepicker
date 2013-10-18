describe 'angular-bootstrap-datepicker', ->

  beforeEach module('ng-bootstrap-datepicker')

  beforeEach inject ($rootScope, $compile)->
    e = angular.element(
      """
        <input type="text" data-ng-datepicker="mm/dd/yyyy">
      """
    )

    @scope = $rootScope.$new()
    $compile(e)(@scope)
    @scope.$digest()

  it 'can run a test', ->
    expect(1).toEqual(1)

