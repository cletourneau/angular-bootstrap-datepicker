describe 'angular-bootstrap-datepicker', ->

  beforeEach ->
    browser().navigateTo('/test/system/test.html')

  it 'can run a test', ->
    element('.add-on').click()
    element('.day:contains(15)').click()
    pause()
