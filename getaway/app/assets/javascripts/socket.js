function readCookie(name) {
  var nameEQ = name + "=";
  var ca = document.cookie.split(';');
  console.log(ca)
  for(var i=0;i < ca.length;i++) {
      var c = ca[i];
      while (c.charAt(0)==' ') c = c.substring(1,c.length);
      if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
  }
  return null;
}


var client = new WebSocket("ws://localhost:2000/");

client.addEventListener("open", function(val){
  client.send(readCookie("user_id"))
});

client.addEventListener("message", function(val){
    $('.ticket-number-box').empty().css({"background-color": "#FF4D4D", "font-size": "24px", "color":"white", "line-height":"120px"}).addClass('animated flipInY').append(val.data);
});

