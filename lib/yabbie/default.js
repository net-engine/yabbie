var webpage = require('webpage'),
    system  = require('system');

var url = system.args[1];

webpage.open(url)
  .then(function() {
    webpage.viewportSize = { width: 650, height: 320 };
    webpage.render('page.png', { onlyViewport: true });

    slimer.exit();
  });

