// Initilise tracking after document has loaded

// Authenticate tracker

// Capture data (cookies, browser)

// Persist data with tracking pixel
function log(name) {
   var now = new Date();
   var image = new Image(1, 1);
   image.onLoad = function () { };
   
   image.src = 'http://petri.local/track?data=' + name;
}
