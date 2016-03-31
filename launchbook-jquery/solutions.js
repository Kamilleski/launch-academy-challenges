// Exercise: Find the top navbar by query for the element type, which is <nav>.
$('nav');

// Exercise: Find the sidebar on the right by using it's id.
$('#sidebar-left');

// Exercise: Find the "Pages" and "Groups" sections of the sidebar by using their class.
$('.pages');
$('.groups');

// Exercise: Find all of the comments on the page.
$('.panel > .media');

// Exercise: Find the first comment on the page.
$('.panel > .media').first()

// Exercise: Find the last comment on the page.
$('.panel > .media').last()


// Exercise: Find the fourth comment on the page.
$($('.panel > .media')[3]);

// Exercise: Find one of the ads in the sidebar and use .hide() to hide it.
$('.ad-slot').first().hide();

// Exercise: Use .show() to make the ad that you hid in the previous step visible again.
$('ads').first().show();

// Exercise: Use .toggle() to toggle the display of the nav bar at the top of the page.
$('nav').toggle();

// Exercise: Use .attr() to change src attribute of one of the ads in the sidebar. Here's an image source if you need one: http://placebear.com/200/300.
var $firstAd = $('.ads img').first();
$firstAd.attr('src', 'http://placebear.com/200/300');

// Exercise: Find Sam's post and change it's text to something incredible.
$($('.media-body > p')[8]).text('something incredible');

// Exercise: Find the first post and use .addClass() to add the .post-liked class to it.
var $firstPost = $('.post').first();
$firstPost.addClass('post-liked');

// Exercise: Find the second post and use .removeClass() to remove the .post-liked class.
var $secondPost = $($('.post')[1]);
$secondPost.removeClass('post-liked');

// Exercise: Find any post and use .toggleClass() to toggle the .post-liked class.

$secondPost.toggleClass('post-liked');
