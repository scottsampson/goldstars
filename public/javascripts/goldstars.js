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
          }
  );
  
  $( '.award img.spent' ).fadeTo( 500, .4 ); // Fade stars!
  
  $( 'span.award' ).hover( // When group-of-stars are moused-over
          function() { // Mouse ON
              $( this ).find( '.info' ).show(); // Show box
          },
          function() { // Mouse OFF
              $( this ).find( '.info' ).delay(50).fadeOut(0); // Fade box
          }
  );

  $( '#new_point' ).submit( function(event) {
    event.preventDefault();
    
    $( '.just-added' ).prepend( "<tr class=\"loading\"><td colspan=\"5\">Adding point to the database ...</td></tr>" );
    
    var $form = $( this ),
        user = $form.find( 'select[name="point[participant_id]"]' ).val(),
        type = $form.find( 'select[name="point[point_type_id]"]' ).val(),
        desc = $form.find( 'input[name="point[description]"]' ).val(),
        url = $form.attr( 'action' );
        
        $form.find( 'input[name="point[description]"]' ).val('');
        
        
        $.post( url,
              { 'point': { 'participant_id': user, 'point_type_id': type, 'description': desc } },
              function() {
                  $.ajax({
                      url: "justadded",
                      dataType: 'json',
                      success: function( json ) {
                        var content  = "<tr>\n";
                            content += "<td class=\"participant\">" + json.participant + "</td>\n";
                            content += "<td class=\"pointtype\">" + json.pointtype + "</td>\n";
                            content += "<td class=\"description\">" + json.description + "</td>\n";
                            content += "<td class=\"stars\">" + json.stars + " stars at</td>\n";
                            content += "<td class=\"created_at\">" + json.created_at + "</td>\n";
                            content += "</tr>\n";
                        $( 'tr.loading' ).replaceWith( content ).effect( 'highlight', {}, 1000 );
                      }
                  });
              });
  });

});
