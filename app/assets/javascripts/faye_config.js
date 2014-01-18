$(function() {
  var faye = new Faye.Client('http://localhost:9292/faye');
  faye.subscribe("/messages/new", function(data){
    console.log(data);
    $("p#tail").append(data + "\n");
  })
});
