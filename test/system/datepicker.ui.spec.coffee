describe 'angular-bootstrap-datepicker', ->

  beforeEach ->
    browser().navigateTo('/demo.html')

  it 'can update scope', ->
    element('.add-on').click()
    element('.day:contains(15)').click()
    element('#datepickerMirror').click()
    expect(element('#datepickerMirror', 'picked date').val()).toEqual('2012-10-15')

  it 'can be updated by the scope', ->
    input('date').enter('2012-10-26')
    expect(element('#datepicker input', 'datepicker').val()).toEqual('2012-10-26')
