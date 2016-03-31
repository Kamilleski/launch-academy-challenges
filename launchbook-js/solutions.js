// Exercise: Find the top navbar by query for the element type, which is <nav>.
document.querySelector("nav");

// Exercise: Find the sidebar on the right by using it's id.
document.getElementById('sidebar-left');

// Exercise: Find the "Pages" and "Groups" sections of the sidebar by using their class.
document.getElementsByClassName('pages');
document.getElementsByClassName('groups');

// Exercise: Find all of the comments on the page.
document.getElementsByClassName('comments');


// Exercise: Find the first comment on the page.
document.getElementsByClassName('comments')[0];


// Exercise: Find the last comment on the page.
var comments = document.getElementsByClassName('comments');
comments[comments.length - 1];

// Exercise: Find the fourth comment on the page.
document.getElementsByClassName('comments')[3];

// Exercise: Find one of the ads in the sidebar and hide them.
var ad1 = document.getElementsByClassName('ads')[0];
ad1.style.visibility = "hidden";

// Exercise: Set the visibility to the form that you hid in the previous step to make it visible again.
ad1.style.visibility = "visible";

// Exercise: Use setAttribute to change src attribute of one of the ads in the sidebar.
var adSrc = ad1.getElementsByTagName('src')[0];
adSrc.setAttribute('img', 'http://placebear.com/200/300')

// Exercise: Find Sam's post and change it's text to something incredible.

var sam = document.getElementsByClassName('post media')[3];
var samBody = sam.getElementsByClassName('media-body')[0];
var samText = samBody.getElementsByTagName('p')[0];
samText.innerHTML = "something incredible"

// Exercise: Find the first post and add the .post-liked class to it.
var post1 = document.getElementsByClassName('post media')[0];
post1.className = post1.className + " post-liked";


// Exercise: Find the second post and remove the .post-liked class.
var post2 = document.getElementsByClassName('post media')[1];
post2.className = "post media";
