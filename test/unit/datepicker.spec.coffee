describe 'angular-bootstrap-datepicker', ->

  beforeEach module('ng-bootstrap-datepicker')

  beforeEach inject ($rootScope, $compile)->
    @element = angular.element(
      """
        <input type="text" data-ng-datepicker="mm/dd/yyyy">
      """
    )

    @scope = $rootScope.$new()
    $compile(@element)(@scope)
    @scope.$digest()

  it 'should create a div', ->
    expect(@element.prop('tagName')).toBe('DIV')

  it 'sets the correct div class', ->
    expect(@element).toHaveClass('input-append')
    expect(@element).toHaveClass('date')

  describe 'input field', ->

    beforeEach ->
      @inputs = @element.find('input[type=text]')

    it 'should create the text input field', ->
      expect(@inputs.length).toBe(1)

    it 'should set the correct input class', ->
      expect(@inputs.eq(0)).toHaveClass('')

  describe 'calendar icon', ->

    beforeEach ->
      @spans = @element.find('span')
      @icons = @element.find('span i')

    it 'should create the span and icon elements', ->
      expect(@spans.length).toBe(1)
      expect(@icons.length).toBe(1)

    it 'should set the correct span class', ->
      expect(@spans.eq(0)).toHaveClass('add-on')

    it 'should set the correct i class', ->
      expect(@icons.eq(0)).toHaveClass('icon-th')


