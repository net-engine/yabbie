var webpage = require('webpage'),
    system  = require('system');

var url     = system.args[1],
    output  = system.args[2],
    width   = system.args[3],
    height  = system.args[4];

var page = webpage.create();

page.open(url)
  .then(function() {
    page.viewportSize = { width: width, height: height };
    page.render(output, { onlyViewport: true });

    slimer.exit();
  });

