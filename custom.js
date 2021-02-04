    // var count = 0;
    // var e = jQuery(input[name='spot_name']);
   // for(var i = 0; i < e.length; i++)
   // {
        // if(jQuery(input[name='spot_name'])=="")
        // {
        //     jQuery(input[name='spot_name']).css.color="#5C3D00";
        // // e[i].style.background="#FFFF99";
        // // e[i].style.border="3px solid #ff0000";
        // // count++;
        // }

        // if(count>0)
        // return false;
   // }

   jQuery(document).ready(function(){


       var validator = jQuery("#myforms").validate();

        jQuery('#spot_name').rules("add", {
             required:true
        });
        jQuery('#spot_price').rules("add", {
             required:true
        });
        jQuery('#spot_image').rules("add", {
             required:true
        });
        jQuery('#spot_desc').rules("add", {
             required:true
        }); 

        return false;

    });


	var limit = 0;
    jQuery('#spot-add-btn').click(function(){
        
        limit++;
        if ( limit <= 2) {

            var spot = jQuery('.add-spot-fields').clone();
            jQuery(spot).insertAfter(".add-spot-fields:last");
    }
     });

   
    jQuery('.success-msg').css('display', 'none');
    jQuery('.danger-msg').css('display', 'none');
    jQuery('.loader-holder').css("display", "none");

	function AddTeamMember(){
	   
    
    // jQuery('input[type="text"]').each(function() {

    //              if(!isNaN(this.value)) {
    //                jQuery('.danger-msg').css('display', 'block').html("Please Enter First Name");
    //                this.focus();
    //                return 0;

    //             }
    //          jQuery(this).validate();

    //         return false;
    //         });

    if (document.forms["myforms"]["fname_member"].value == "") {
        jQuery('.danger-msg').css('display', 'block').html("Please Enter First Name");
        jQuery('html, body').animate({
             scrollTop: jQuery(".danger-msg").offset().top-70
            }, 2000);
        // jQuery('#fname_member').css('background-color', '#ffdddd');
        return false;
    }if (document.forms["myforms"]["lname_member"].value == "") {
        jQuery('.danger-msg').css('display', 'block').html("Please Enter Last Name");
        jQuery('html, body').animate({
             scrollTop: jQuery(".danger-msg").offset().top-70
            }, 2000);
        // jQuery('#lname_member').css('background-color', '#ffdddd');
        return false;
    }if (document.forms["myforms"]["member_email"].value == "") {
        jQuery('.danger-msg').css('display', 'block').html("Please Enter Email");
        jQuery('html, body').animate({
             scrollTop: jQuery(".danger-msg").offset().top-70
            }, 2000);
        // jQuery('#member_email').css('background-color', '#ffdddd');
        return false;
    }if (document.forms["myforms"]["member_image"].value == "") {
        jQuery('.danger-msg').css('display', 'block').html("Please Upload Member Image");
        jQuery('html, body').animate({
             scrollTop: jQuery(".danger-msg").offset().top-70
            }, 2000);
        // jQuery('#member_image').css('background-color', '#ffdddd');
        return false;
    }if (document.forms["myforms"]["description_member"].value == "") {
        jQuery('.danger-msg').css('display', 'block').html("Member descriiption must be filed out");
        jQuery('html, body').animate({
             scrollTop: jQuery(".danger-msg").offset().top-70
            }, 2000);
        // jQuery('#description_member').css('background-color', '#ffdddd');
        return false;
    }


    
    // }if (document.forms["myforms"]["spot_name"].value == "") {
    //     jQuery('.danger-msg').css('display', 'block').html("Spot Name must be filed out");
    //     jQuery('html, body').animate({
    //          scrollTop: jQuery(".danger-msg").offset().top-70
    //         }, 2000);
    //     // jQuery('#spot_name').css('background-color', '#ffdddd');
    //     return false;
    // }
    // if (document.forms["myforms"]["spot_price"].value == "") {
    //     jQuery('.danger-msg').css('display', 'block').html("Please Enter Spot Price");
    //     jQuery('html, body').animate({
    //          scrollTop: jQuery(".danger-msg").offset().top-70
    //         }, 2000);
    //     // jQuery('#spot_price').css('background-color', '#ffdddd');
    //     return false;
    // }if (document.forms["myforms"]["spot_image"].value == "") {
    //     jQuery('.danger-msg').css('display', 'block').html("Please Upload Spot Image");
    //     jQuery('html, body').animate({
    //          scrollTop: jQuery(".danger-msg").offset().top-70
    //         }, 2000);
    //     // jQuery('#spot_image').css('background-color', '#ffdddd');
    //     return false;
    // }
    // if (document.forms["myforms"]["spot_desc"].value == "") {
    //     jQuery('.danger-msg').css('display', 'block').html("Please Enter Spot descriiption");
    //     jQuery('html, body').animate({
    //          scrollTop: jQuery(".danger-msg").offset().top-70
    //         }, 2000);
    //     // jQuery('#spot_desc').css('background-color', '#ffdddd');
    //     return false;
    // }

        jQuery('.loader-holder').css("display", "block");


        // For event
        var event_name  = jQuery('#event_name').val();
        var event_image = jQuery('#event_image').prop('files')[0];
        var event_start = jQuery('#event_start').val();
        var event_end   = jQuery('#event_end').val();
        var spot        = jQuery('#spot').val();
        var fname_member = jQuery('#fname_member').val();
        var lname_member = jQuery('#lname_member').val();
        var member_email = jQuery('#member_email').val();
        var member_image = jQuery('#member_image').prop('files')[0];
        var description_member = jQuery('#description_member').val();

        // console.log(spot_image);
        var form_data = new FormData(); 
        
        spot_names = [];
        jQuery("input[name='spot_name']").each(function() {
        spot_names.push(jQuery(this).val());
        });

        spot_price = [];
        jQuery("input[name='spot_price']").each(function() {
        spot_price.push(jQuery(this).val());
        });

        Spot_image = [];
        jQuery("input[name='Spot_image']").each(function() {
        Spot_image.push(jQuery(this).prop('files')[0]);
        });

        var spot0 = Spot_image[0]; 
        var spot1 = Spot_image[1]; 
        var spot2 = Spot_image[2]; 
        var spot3 = Spot_image[3]; 


        Spot_desc = [];
        jQuery("textarea[name='Spot_desc']").each(function() {
        Spot_desc.push(jQuery(this).val());
        });


        //for spots
        form_data.append('spot_name', spot_names);
        form_data.append('spot_price', spot_price);
        form_data.append('spot_desc', Spot_desc);
        form_data.append('spot_image0', spot0);
        form_data.append('spot_image1', spot1);
        form_data.append('spot_image2', spot2);
        form_data.append('spot_image3', spot3);

        form_data.append('event_name', event_name);
        form_data.append('event_image', event_image);
        form_data.append('event_start', event_start);
        form_data.append('event_end', event_end);
        form_data.append('spot', spot);
		form_data.append('file', member_image);
		form_data.append('fname', fname_member);
        form_data.append('lname', lname_member);
        form_data.append('email', member_email);
        form_data.append('description', description_member);
        form_data.append('action', 'my_ajax_action_callback');

        jQuery.ajax({
            url: 'https://devfundraising.wpengine.com/wp-admin/admin-ajax.php',
            type: 'POST',
            data: form_data,
            contentType: false,
	        processData: false,
            success:function(response)
            {        
                jQuery(".author_pubproducts").load(window.location + " .author_pubproducts");
                jQuery('html, body').animate({
                 scrollTop: jQuery(".success-msg").offset().top
                }, 1000);

                jQuery('.success-msg').css('display', 'block').html("Team Member Created Successfully");
                jQuery('.danger-msg').hide();
                jQuery('.loader-holder').css("display", "none");     
            }
        });
}


    jQuery('.alert-success').css('display', 'none');
    jQuery('.alert-danger').css('display', 'none');
    function AddEventjs(){

    if (document.forms["myforms"]["event_name"].value == "") {
        jQuery('.alert-danger').css('display', 'block').html("Event Name must be filed out");
        jQuery('html, body').animate({scrollTop: jQuery(".alert-danger").offset().top}, 1000);
        return false;
    }if (document.forms["myforms"]["event_image"].value == "") {
        jQuery('.alert-danger').html("Event Image must be uploaded");
        jQuery('html, body').animate({scrollTop: jQuery(".alert-danger").offset().top}, 1000);
        return false;
    }if (document.forms["myforms"]["event_start"].value == "") {
        jQuery('.alert-danger').html("Event Start date must be select");
        jQuery('html, body').animate({scrollTop: jQuery(".alert-danger").offset().top}, 1000);
        return false;
    }if (document.forms["myforms"]["event_end"].value == "") {
        jQuery('.alert-danger').html("Event end date must be select");
        jQuery('html, body').animate({scrollTop: jQuery(".alert-danger").offset().top}, 1000);
        return false;
    }if (document.forms["myforms"]["spot"].value == "") {
        jQuery('.alert-danger').html("Spot text Name must be filed out");
        jQuery('html, body').animate({scrollTop: jQuery(".alert-danger").offset().top}, 1000);
        return false;
    }
     
        var event_name  = jQuery('#event_name').val();
        var event_image = jQuery('#event_image').prop('files')[0];
        var event_start = jQuery('#event_start').val();
        var event_end   = jQuery('#event_end').val();
        var spot        = jQuery('#spot').val();
        var new_data = new FormData();

        jQuery('.loader-holder').css("display", "block"); 

        new_data.append('event_name', event_name);
        new_data.append('event_image', event_image);
        new_data.append('event_start', event_start);
        new_data.append('event_end', event_end);
        new_data.append('spot', spot);
        new_data.append('action', 'AddNewEvent_callback');


        jQuery.ajax({
        url: 'https://devfundraising.wpengine.com/wp-admin/admin-ajax.php',
        type: 'POST',
        data: new_data,
        contentType: false,
        processData: false,
        success:function(response)
        {        
        	// var data = JSON.parse(response);
            // w(data.created_evnt);
            // jQuery('.third-sec-step').attr('data-user', id);

            current_fs = jQuery('.save').parent();
            next_fs = jQuery('.save').parent().next();

            //Add Class Active
            jQuery(".progressbar li").eq(jQuery("fieldset").index(next_fs)).addClass("active");

            //show the next fieldset
            next_fs.show();
            //hide the current fieldset with style
            current_fs.animate({opacity: 0}, {
            step: function(now) {
            // for making fielset appear animation
            opacity = 1 - now;

            current_fs.css({
            'display': 'none',
            'position': 'relative'
            });
            next_fs.css({'opacity': opacity});
            },
            duration: 600
            });

            // console.log(response);
            jQuery('.alert-success').css("display", "block").html("Event Created Successfully");
            jQuery('.alert-danger').hide();
            jQuery('.loader-holder').css("display", "none");
            document.getElementById("review-event-name").innerHTML = event_name;
            // jQuery("#evntImage").appendTo(data.evntImage);
            // jQuery("#review-event-image").attr("src", data.evntImage); 
            document.getElementById("review-event-start").innerHTML = event_start;
            document.getElementById("review-event-end").innerHTML = event_end;
            document.getElementById("review-event-desc").innerHTML = spot;

        }
        });

        

}

    
//Team Member Repeater Fields
jQuery(document).ready(function(){

 jQuery('#plus-btn').click(function(){

        jQuery('.third-sec-step').hide();

        document.getElementById("fname_member").value = "";
        document.getElementById("lname_member").value = "";
        document.getElementById("member_email").value = "";
        document.getElementById("member_image").value = "";
        jQuery('#description_member').val('');
        document.getElementById("spot_name").value = "";
        document.getElementById("spot_price").value = "";
        jQuery('#spot_desc').val('');
        document.getElementById("spot_image").value = "";

        if (jQuery('.team-added').hide()) {
        	jQuery('.team-added').show();
        } ;
    });
});



function editMember(id){

    jQuery('.loader-holder').css("display", "block");
    jQuery('.third-sec-step').attr('data-user', id);

    jQuery('.team-added').hide();
    jQuery('.records').hide();
    jQuery('.third-sec-step').show();
    
    // console.log(id);
    var data = {'id': id, 'action': 'editMember_callback'};
    jQuery.ajax({
            url: 'https://devfundraising.wpengine.com/wp-admin/admin-ajax.php',
            type: 'POST',
            data: data,

            success:function(response)
            {   

                jQuery('.third-sec-step').html(response);
                jQuery('html, body').animate({
                     scrollTop: jQuery("#first-name-edit").offset().top
                    }, 2000);
                jQuery('.loader-holder').css("display", "none");

            }
    });        
}

function deleteMember(id){

    jQuery('.loader-holder').css("display", "block");
    // jQuery('.loader').css("display", "block");
    var yes = confirm('Are you sure to delete the team member?');
    if(yes){ 
            var data = {post_id:id, 'action': 'DeleteMember_callback'};
            jQuery.ajax({
                url: 'https://devfundraising.wpengine.com/wp-admin/admin-ajax.php',
                type: 'POST',
                data: data,
                success:function(response)
                {
                    jQuery(".author_pubproducts").load(window.location + " .author_pubproducts");
                    jQuery('html, body').animate({scrollTop: jQuery(".success-msg").offset().top-70}, 2000);
                    jQuery('.success-msg').css('display', 'block').html("Team Member Deleted Successfully");
                    jQuery('.danger-msg').hide();
                    jQuery('.loader-holder').css("display", "none");

                }
            });
    }
}


function UpdateTeamMember(){


// jQuery(document).ready(function(){

        // jQuery("#save").click(function() {

            // jQuery('input[type="text"]').each(function() {

            //      if(!isNaN(this.value)) {
            //        jQuery('.danger-msg').css('display', 'block').html("Please Enter First Name");
            //        this.focus();
            //        return 0;

            //     }
            //  jQuery(this).validate();

            // return false;
            // });
        // });

    // });
// });
    // console.log(jQuery('.third-sec-step').attr('data-user'));
    jQuery('.success-msg').css('display', 'none');

    if (document.forms["myforms"]["update_fname"].value == "") {
        jQuery('.danger-msg').css('display', 'block').html("Please Enter First Name");
        jQuery('html, body').animate({scrollTop: jQuery(".danger-msg").offset().top}, 1000);
        // jQuery('#fname_member').css('background-color', '#ffdddd');
        return false;
    }if (document.forms["myforms"]["update_lname"].value == "") {
        jQuery('.danger-msg').css('display', 'block').html("Please Enter Last Name");
        jQuery('html, body').animate({scrollTop: jQuery(".danger-msg").offset().top}, 1000);
        // jQuery('#lname_member').css('background-color', '#ffdddd');
        return false;
    }if (document.forms["myforms"]["update_email"].value == "") {
        jQuery('.danger-msg').css('display', 'block').html("Please Enter Email");
        jQuery('html, body').animate({scrollTop: jQuery(".danger-msg").offset().top}, 1000);
        // jQuery('#member_email').css('background-color', '#ffdddd');
        return false;
    }
    // if (document.forms["myforms"]["update_image"].value == "") {
    //     jQuery('.danger-msg').css('display', 'block').html("Please Upload Member Image");
    //     // jQuery('#member_image').css('background-color', '#ffdddd');
    //     return false;
    // }
    if (document.forms["myforms"]["update_desc"].value == "") {
        jQuery('.danger-msg').css('display', 'block').html("Member descriiption must be filed out");
        jQuery('html, body').animate({scrollTop: jQuery(".danger-msg").offset().top}, 1000);
        // jQuery('#description_member').css('background-color', '#ffdddd');
        return false;
    }
    // if (document.forms["myforms"]["update_spotname"].value == "") {
    //     jQuery('.danger-msg').css('display', 'block').html("Spot Name must be filed out");
    //     jQuery('html, body').animate({scrollTop: jQuery(".danger-msg").offset().top}, 1000);
    //     // jQuery('#spot_name').css('background-color', '#ffdddd');
    //     return false;
    // }
    // if (document.forms["myforms"]["update_price"].value == "") {
    //     jQuery('.danger-msg').css('display', 'block').html("Please Enter Spot Price");
    //     jQuery('html, body').animate({scrollTop: jQuery(".danger-msg").offset().top}, 1000);
    //     // jQuery('#spot_price').css('background-color', '#ffdddd');
    //     return false;
    // }
    // // if (document.forms["myforms"]["update_spotimage"].value == "") {
    // //     jQuery('.danger-msg').css('display', 'block').html("Please Upload Spot Image");
    // //     // jQuery('#spot_image').css('background-color', '#ffdddd');
    // //     return false;
    // // }
    // if (document.forms["myforms"]["update_spotdesc"].value == "") {
    //     jQuery('.danger-msg').css('display', 'block').html("Please Enter Spot descriiption");
    //     jQuery('html, body').animate({scrollTop: jQuery(".danger-msg").offset().top}, 1000);
    //     jQuery('#spot_desc').css('background-color', '#ffdddd');
    //     return false;
    // }
        jQuery('.loader-holder').css("display", "block");
        // jQuery('.loader').css("display", "block");

        var fname_member = jQuery('#first-name-edit').val();
        var lname_member = jQuery('#last-name-edit').val();
        var member_email = jQuery('#email-edit').val();
        // var member_image = jQuery('#member-image-edit').prop('files')[0];
        var description_member = jQuery('#description-edit').val();
        var post_id = jQuery('.third-sec-step').attr('data-user');
        console.log(post_id);

        update_spotname = [];
        jQuery("input[name='update_spotname']").each(function() {
        update_spotname.push(jQuery(this).val());
        });
        // console.log(spot_names);
        update_price = [];
        jQuery("input[name='update_price']").each(function() {
        update_price.push(jQuery(this).val());
        });
        // console.log(spot_price);
        update_image = [];
        jQuery("input[name='update_image']").each(function() {
        update_image.push(jQuery(this).prop('files')[0]);
        });
        

        var spot0 = update_image[0]; 
        var spot1 = update_image[1]; 
        var spot2 = update_image[2]; 
        var spot3 = update_image[3]; 


        update_spotdesc = [];
        jQuery("textarea[name='update_spotdesc']").each(function() {
        update_spotdesc.push(jQuery(this).val());
        });

        

        var data = new FormData(); 
        data.append('spot_name', update_spotname);
        data.append('spot_price', update_price);
        data.append('spot_desc', update_spotdesc);
        data.append('spot_image0', spot0);
        data.append('spot_image1', spot1);
        data.append('spot_image2', spot2);
        data.append('spot_image3', spot3);
        data.append('fname', fname_member);
        data.append('lname', lname_member);
        data.append('email', member_email);
        data.append('description', description_member);
        data.append('post_id', post_id);
        data.append('action', 'UpdateMember_callback');

        jQuery.ajax({
            url: 'https://devfundraising.wpengine.com/wp-admin/admin-ajax.php',
            type: 'POST',
            data: data,
            contentType: false,
            processData: false,
            // cache: false,

            // dataType: "json",
            success:function(response)
            {        
                jQuery(".author_pubproducts").load(window.location + " .author_pubproducts");
                // console.log(member_image);
                // console.log(spot_image);
                // preview.src = URL.createObjectURL(this.files[0]);
                jQuery('html, body').animate({
                 scrollTop: jQuery(".success-msg").offset().top
                }, 2000);
                jQuery('.success-msg').css('display', 'block').html("Team Member Updated Successfully");
                jQuery('.danger-msg').hide();
                // jQuery('.loader').css("display", "none");   
                jQuery('.loader-holder').css("display", "none");    
            }
        });

}


function submitform(){

        jQuery('.loader').css("display", "block");   
        window.location = "https://devfundraising.wpengine.com/";         
   		var event_name  = jQuery('#event_name').val();
        var event_start = jQuery('#event_start').val();
        var event_end   = jQuery('#event_end').val();
        var spot        = jQuery('#spot').val();

        var new_data = {event_name: event_name, event_start: event_start , event_end: event_end , spot: spot , 'action': 'submit_callback'};
    jQuery.ajax({
            url: 'https://devfundraising.wpengine.com/wp-admin/admin-ajax.php',
            type: 'POST',
            data: new_data,
            success:function(response)
            {   
                jQuery('.loader').css("display", "none");
            	// console.log(response);
            }
        });
}

// var MLimit = 0;
function AssignEvent(id1,id2){


        
        // jQuery('#spot-add-btn').click(function(){
        
        // MLimit++;
        // if ( MLimit <= 12) {
        jQuery('.loader-holder').css("display", "block");

        var member_id = id1 ;
        var event_id = id2 ;              
        var event_name  = jQuery('#event_name').val();
        var event_start = jQuery('#event_start').val();
        var event_end   = jQuery('#event_end').val();
        var spot        = jQuery('#spot').val();

        var new_data = {member_id:member_id, event_id:event_id ,event_name: event_name, event_start:event_start, event_end:event_end, spot:spot, 'action': 'AssignEvent_callback'};
        jQuery.ajax({
            url: 'https://devfundraising.wpengine.com/wp-admin/admin-ajax.php',
            type: 'POST',
            data: new_data,
            success:function(response)
            {  
                console.log(response);
                jQuery(".review-event-data").load(window.location + " .review-event-data"); 
                jQuery('.loader-holder').css("display", "none");
            }
        }); 

    // }else{
    // alert('limit reached');
    //  }
        


}

