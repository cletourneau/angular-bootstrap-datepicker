Browser = require("zombie")

html = """
<html>
<head></head>
<body>
  <div id="date-picker" class="date">Hello world!</div>
</body>
</html>
"""

describe 'angular-bootstrap-datepicker', ->
  browser = new Browser()

  it 'should be able load the html', (done)->

    browser.load(html).then ->
      expect(browser.html().length).toBeGreaterThan(0)
      done()
