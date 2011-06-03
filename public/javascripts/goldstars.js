$(function() {

  $( '.award.info' ).hide(); // Hide pop-ups.
  
  $( 'span.award' ).hover( // When stars are moused-over
          function() { // Mouse ON
              $( this ).find( '.info' ).show(); // Show box
              $( this ).find( 'img' ).addClass( 'fade' ); // Dim stars
          },
          function() { // Mouse OFF
              $( this ).find( '.info' ).delay(100).fadeOut(100); // Fade box
              $( this ).find( 'img' ).removeClass( 'fade' ); // Brighten stars
          });

  $( 'table#point select' ).attr( 'size', 2 );
  $( 'table#point select' ).hover( // Mouse over options box
          function() { $( this ).attr( 'size', 12 ); },  // Mouse ON
          function() { $( this ).attr( 'size', 2 ); }); // Mouse OFF

});
