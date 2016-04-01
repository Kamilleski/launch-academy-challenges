$(document).ready(function(){
  $("form").on("submit", function(event){
    event.preventDefault();
    var name = $("#grocery_name").val();
    if (name) {
      submitGroceryItemViaAjax(name);
    } else {
      alert("Please submit an item.");
    }
  });
});

var submitGroceryItemViaAjax = function(name) {
  var request = $.ajax({
    method: "POST",
    url: "/groceries",
    data: { name: name }
  });

  request.done(function(data){
    $("#grocery-list").append("<li>" + name + "</li>");
  });
}
