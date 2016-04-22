// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){

$('#star-rating').raty({
	path: '/assets/',
	scoreName: 'review[rating]'
});

$('.star-rating').raty({
    path: '/assets/', 
    readOnly: true,
    score: function() {
      return $(this).attr('data-score');
    }
  });
});