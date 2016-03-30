// YOUR CODE GOES HERE

//change its action to append:  http://localhost:4567/tweets.json?page=<%= page +1 %>

//find button id
var button = document.getElementsByClassName('more-sprouts')[0];
var tweets_list = document.getElementsByClassName('tweets')[0];

//create function to change href
var moarSprouts = function() {
  var url = link.getAttribute("href");
  link.setAttribute("href", "http://localhost:4567/tweets.json?page=<%= page +1 %>");
}

//add event listener using button and moarSprouts
//append next page to tweets_list
addEventListener()
