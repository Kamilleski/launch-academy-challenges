$(document).ready(function(){
  $("#add").on("submit", function(event){
    event.preventDefault();
    var name = $("#grocery_name").val();
    if (name) {
      submitGroceryItemViaAjax(name);
    } else {
      alert("Please submit an item.");
    }
  });
  $("#delete").on("submit"),
  debugger;
  function(event){
    event.preventDefault();
    var item = $(".item");
    deleteGroceryItemViaAjax(item);
  }
});

var submitGroceryItemViaAjax = function(name) {
  var addRequest = $.ajax({
    method: "POST",
    url: "/groceries",
    data: { name: name }
  });

  addRequest.done(function(data){
    $("#grocery-list").append("<li class='item'> <form method='post' action='/groceries'> <input type='hidden' name='_method' value='delete'>" + name + "<button type='submit' id='delete'>Delete</button> </form> </li>");
  });
}

var deleteGroceryItemViaAjax = function(name) {
  var deleteRequest = $.ajax({
    context: this,
    type: "POST"
    method: "DELETE",
    url: "/groceries",
    data: { name: name}
  });

  deleteRequest.done(function(data){
    $(tis).remove();
  });
}
