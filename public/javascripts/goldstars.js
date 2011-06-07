$(function() {

  $( '.award.info' ).hide(); // Hide pop-ups.
  
  // This block flags all stars that have been spent on awards.
  $( 'table#display.index tr' ).each( // Each row of stars.
          function() {
            var stars = $(this).attr('data-value'); // 'user.score'
            $(this).find('img').each( // For each star in the row.
                    function() {
                      if( stars <= 0 )
                        $(this).addClass('spent');
                      else stars--;
                    });
          });
  $( '.award img.spent' ).fadeTo( 500, .4 ); // Fade stars!
  
  $( 'span.award' ).hover( // When group-of-stars are moused-over
          function() { // Mouse ON
              $( this ).find( '.info' ).show(); // Show box
          },
          function() { // Mouse OFF
              $( this ).find( '.info' ).delay(50).fadeOut(0); // Fade box
          });

});
