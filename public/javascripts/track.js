/*
   TODO:
      Use class as a name space
      Uniquely identify user with cookie
      Uniquely identify user with user identifier
      Capture extra data with optional string/json argument
      Initilise tracking after document has loaded
      Authenticate tracker with a/c id
*/

// Persist data with tracking pixel
function log(name) {
   var now = new Date();
   var image = new Image(1, 1);
   image.onLoad = function () { };
   
   image.src = 'http://petri.local/track?data=' + name;
}
