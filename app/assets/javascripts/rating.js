
var displayRatingStars = function() {
  $('.rated').raty({ path: '/assets',
	      readOnly: true,
	      score: function(){
	      	return $(this).attr('data-score');
	      }
	    });
};

$(document).on('ready page:load', function(){
		$('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
		displayRatingStars();
	});


