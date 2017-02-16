var WebSocketServer = require("ws").Server;
var server = new WebSocketServer({port: 2000});
client_count = 1;

var clients = [];


  server.on("connection",function(client) {

    console.log("client connected");

    
    client_count++
 
    client.on('message', function(message) {
    var unique = true

      if (/[1-9]+/.test(message) && /[A-z]+/.test(message) === false) {
        clients.forEach(function(client){
          if (client.id == parseInt(message)) {
              unique = false
          } 
        })
        if (unique === true) {
          var user = {id: message, connection: client}
          clients.push(user)  
          console.log(clients)
        }
      }
      else if (/[1-9]+/.test(message) && /[A-z]+/.test(message)) {
        client_id = message.match(/[1-9]+/g)[0]
        name = message.match(/[A-z]+/g)[0]

        var callClient  = name + "," + "Table is ready!"

        console.log('!!!! clients is ', clients)
        
        clients.forEach(function(user){

          if (parseInt(user.id) === parseInt(client_id)) {

            user.connection.send(callClient)
            console.log("client_id " + client_id + ' ' + 'name is called')
            console.log("stored_id is " + user.id)
          }

        })

      } 
      
    });

  client.on("close", function() {
    console.log("CLIENT DISCUNNECTED")
     clients.forEach(function(item){
        if (client === item.connection) {
            clients.splice(clients.indexOf(item), 1)
        }
    })
  });

});

