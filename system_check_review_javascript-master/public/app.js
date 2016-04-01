$(document).ready(function(){
  $("form").on("submit", function(event){
    event.preventDefault();
    var name = $("#poro_name").val();
    if (name) {
      submitPoroViaAjax(name);
    } else {
      alert("Hey! Fill in a name!");
    }
  });
});

var submitPoroViaAjax = function(name) {
  var request = $.ajax({
    method: "POST",
    url: "/poros",
    data: { name: name }
  });

  request.done(function(data){
    $("ul").append("<li>" + name + "</li>");
  });
}
