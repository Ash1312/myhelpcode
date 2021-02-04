jQuery(document).ready(function(){

	jQuery("#acf-group_5fe0d0de2a05d").css({display: "none"});
	jQuery('#acf-field_5fe0cad35415a').click(function(){
	    jQuery("#acf-group_5fe0d0de2a05d").css({display: "block"});
	});
});


// if (jQuery(":checkbox").attr('checked', true)) {
// 	jQuery("#acf-group_5fe0d0de2a05d").css({display: "block"});
// }else if(jQuery(":checkbox").attr('checked', false)){
// 	jQuery("#acf-group_5fe0d0de2a05d").css({display: "none"});	
// }

// jQuery(document).ready(function(){
//  		var str = document.getElementById("posts"); 
//         var res = str.replace("Count", "Team Member");
//         document.getElementById("posts").innerHTML = res;
//         var str = document.getElementById("name"); 
//         var res = str.replace("Name", "Team Name");
//         // document.getElementById("name").innerHTML = res;
//  		// var str = document.getElementById("product_search_image").innerHTML; 
// });

// jQuery("#acf-group_5fe0d0de2a05d").css({display: "none"});
jQuery(":checkbox").click( function(){
	if (jQuery(":checkbox").attr('checked', false)){
		jQuery("#acf-group_5fe0d0de2a05d").css({display: "none"});
	}
});