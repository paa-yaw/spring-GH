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