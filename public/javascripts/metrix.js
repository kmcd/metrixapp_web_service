var MetrixApp = function (account_code) {
   this.log = function(name, data) {
      // Persist data with tracking pixel GET request to /log
      var image = new Image(1, 1);
      image.onLoad = function () { };
      
      // TODO: encode JSON
      event_data = 'account_code=' + account_code + '&name=' + name + '&data=' + data;
      
      image.src = 'http://petri.local/log?' + event_data ;
   };
   
   // TODO:  Uniquely identify user with cookie
   // TODO:  Uniquely identify user with user identifier
};
