var webpage = require('webpage'),
    system  = require('system');

var url     = system.args[1],
    output  = system.args[2];

var page = webpage.create();

page.open(url)
  .then(function() {
    page.viewportSize = { width: 650, height: 320 };
    page.render(output, { onlyViewport: true });

    slimer.exit();
  });

