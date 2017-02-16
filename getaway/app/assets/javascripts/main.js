

$(document).ready(function() {

  $(document).on('click','#view',function(){
    $("#modal").toggle();
    var customerID = $(this).val();
  });

  $(document).on('click',".modal-close",function(){
    $("#modal").toggle();
    console.log("bye!!!")
  });
  
})



$(document).on('click','#next',function(){
  var $secondRow =  $("#queue-table tr").eq(1);
  thisId = this.value
  var arr = thisId.split(' ')
  var user_id = parseInt(arr[0])

  var client = new WebSocket("ws://localhost:2000/");

  client.addEventListener('open', function(){
    client.send(thisId) 
  })
  
  $.ajax({
    url: '/queues/' + user_id,
    type: 'POST',
    data: {'_method': 'delete'},
    success: function(result) {
      $secondRow.css("background-color","#99EB99");
      $secondRow.fadeOut(300,function() {
        $secondRow.remove();
      });

      location.reload();
    }
  });

});




