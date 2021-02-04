(function($) {
    // When the DOM is ready.
    jQuery(function() {
        var file_frame; // variable for the wp.media file_frame

        // attach a click event (or whatever you want) to some element on your page
        jQuery( '#frontend-button' ).on( 'click', function( event ) {
            event.preventDefault();

            // if the file_frame has already been created, just reuse it
            if ( file_frame ) {
                file_frame.open();
                return;
            }

            file_frame = wp.media.frames.file_frame = wp.media({
                title: jQuery( this ).data( 'uploader_title' ),
                button: {
                    text: jQuery( this ).data( 'uploader_button_text' ),
                },
                multiple: true // set this to true for multiple file selection
            });

            file_frame.on( 'select', function() {
                attachment = file_frame.state().get('selection').first().toJSON();

                // do something with the file here
                jQuery( '#frontend-button' ).hide();
                jQuery( '#frontend-image' ).attr('src', attachment.url);
            });

            file_frame.open();
        });
    });

})(jQuery);