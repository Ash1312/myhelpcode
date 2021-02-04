<?php

//call hoook and create custom meta box
function add_custom_meta_box() {
    add_meta_box(
        'custom_meta_box', // $id
        'Custom Meta Box', // $title 
        'show_custom_meta_box', // $callback
        'faqs', // $page
        'test', // $context
        'high'); // $priority
}
add_action('add_meta_boxes', 'add_custom_meta_box');


//setting custom box priority to high at first position using hook
function foo_move_deck() {
        # Get the globals:
        global $post, $wp_meta_boxes;

        # Output the "advanced" meta boxes:
        do_meta_boxes( get_current_screen(), 'test', $post );

        # Remove the initial "advanced" meta boxes:
        unset($wp_meta_boxes['post']['test']);
    }

add_action('edit_form_after_title', 'foo_move_deck');


    //array of all pages   
    $args = array(
        'posts_per_page'   => -1,
        'post_type'        => 'page',
    );
    $loop = new WP_Query( $args );

    if ($loop->have_posts() ) :
        while ( $loop->have_posts() ) : $loop->the_post();
            global $post;
            $field[ $post->ID ] = array(
                'label' => get_the_title( $post->ID ),
                'value' => get_the_title( $post->ID ),
                'id'   =>  $post->ID
            );
        endwhile;
    endif;

        // echo "<pre>";
        // print_r($field);
        // die();

//Creating Array for dropdown of custom box
$prefix = 'custom_';
$custom_meta_fields = array(
    array(
        'label'=> 'Select Page',
        'id'    => $prefix.'select',
        'type'  => 'select',
        'options' => $field
    )
);



// The Callback & displaying function
function show_custom_meta_box() {
global $custom_meta_fields, $post;
// Use nonce for verification
echo '<input type="hidden" name="custom_meta_box_nonce" value="'.wp_create_nonce(basename(__FILE__)).'" />';
     
    // Begin the field table and loop
    echo '<table class="form-table">';
    foreach ($custom_meta_fields as $field) {
        // get value of this field if it exists for this post
        $meta = get_post_meta($post->ID, $field['id'], true);
        // begin a table row with
        echo '<tr>
                <th><label for="'.$field['id'].'">'.$field['label'].'</label></th>
                <td>';
                switch($field['type']) {
                    // case items will go here
                    case 'select':
                    echo '<select name="'.$field['id'].'" id="'.$field['id'].'">';
                    foreach ($field['options'] as $option) {
                     echo '<option', $meta == $option['id'] ? ' selected="selected"' : '', ' value="'.$option['id'].'">'.$option['label'].'</option>';
                    }
                    break;
                } //end switch
        echo '</td></tr>';
    } // end foreach
    echo '</table>'; // end table
    // die();
}


//saving the custom meta box data
function save_custom_meta($post_id) {
    global $custom_meta_fields;
     
    // verify nonce
    if (!wp_verify_nonce($_POST['custom_meta_box_nonce'], basename(__FILE__))) 
        return $post_id;
    // check autosave
    if (defined('DOING_AUTOSAVE') && DOING_AUTOSAVE)
        return $post_id;
    // check permissions
    if ('page' == $_POST['post_type']) {
        if (!current_user_can('edit_page', $post_id))
            return $post_id;
        } elseif (!current_user_can('edit_post', $post_id)) {
            return $post_id;
    }
     
    // loop through fields and save the data
    foreach ($custom_meta_fields as $field) {
        $old = get_post_meta($post_id, $field['id'], true);
        $new = $_POST[$field['id']];
        if ($new && $new != $old) {
            update_post_meta($post_id, $field['id'], $new);
        } elseif ('' == $new && $old) {
            delete_post_meta($post_id, $field['id'], $old);
        }
    } // end foreach
}
add_action('save_post', 'save_custom_meta');



//unchecking radio buttons
jQuery('.SkipBtn').click(function () {
            var radiolist = jQuery(this).parents('.gform_page').find('input:radio');
            radiolist.removeAttr('checked');
            jQuery(radiolist).prop('checked', false).button("refresh");
        });




//add a custom button to wordpress panel
do_action( 'edit_form_after_title', $post );

// Tells WP to do something at the do_action mentioned above
add_action( 'edit_form_after_title', 'my_function_name');

// This is the function specified in the "add_action" above
function my_function_name( $post ) {
   // Do stuff here. 
   echo '<a href="#" class="button-primary">My Button</a>';
    }





// Adding Custom Dropdown for Custom Fields
    function acf_load_color_field_choices( $field ) {

    // reset choices
    $field['choices'] = array();
   if( $uid = get_current_user_id() )
    {

        $args = array(
            'posts_per_page'   => -1,
            'post_type'        => 'tribe_events',
            'author'         => $uid,
            'post_status' => 'publish',

        );
    }
    $loop = new WP_Query( $args );

    if ($loop->have_posts() ) :
        while ( $loop->have_posts() ) : $loop->the_post();
            global $post;
            $field['choices'][ $post->ID ] = get_the_title( $post->ID );
        endwhile;
    endif;

    // return the field
    return $field;
}

add_filter('acf/load_field/name=events', 'acf_load_color_field_choices');


//Changing Naming Convention Dashboard
function change_post_menu_label() {
  global $menu;
  // echo "<pre>";
  // print_r($menu); // Print menus and find out the index of your custom post type menu from it.
  // die();

  $menu[26][0] = 'Add Product/Team'; // Replace the 27 with your custom post type menu index from displayed above $menu array 
}
add_action( 'admin_menu', 'change_post_menu_label' );



// Prevent Repeat purchase of Woocommerce Product
// https://www.skyverge.com/blog/prevent-repeat-purchase-with-woocommerce/


//Add Custom Columns to Woo commerce admin dashboard
// https://stackoverflow.com/questions/43795050/add-columns-to-woocommerce-reports-customer-list

//shortcodes
// https://plugintests.com/plugins/wporg/woocommerce/tips