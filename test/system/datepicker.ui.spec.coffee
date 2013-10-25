describe 'angular-bootstrap-datepicker', ->

  beforeEach ->
    browser().navigateTo('/test/system/test.html')

  it 'picking a date from the calendar table updates the scope', ->
    element('div #datepicker input').query (elements, done)->
      elements.focus()
      done()
    element('.day:contains(15)').click()
    element('#datepickerMirror').click()

    expect(element('#datepickerMirror', 'picked date').val()).toEqual('2012-10-15')

  it 'can be updated by the scope', ->
    input('date').enter('2012-10-26')
    expect(element('#datepicker input', 'datepicker').val()).toEqual('2012-10-26')

  xit 'can focus on the input -- this test does not work yet', ->
    jQueryFn('div #datepicker input', 'focus')
    keyboard().keydown('div #datepicker input', 'keydown', 27, false, false, false);
    keyboard().keydown('div #datepicker input', 'keypress', 50, false, false, false);
