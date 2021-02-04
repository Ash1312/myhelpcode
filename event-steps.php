<?php  
/* 
Template Name: event-steps 
*/
get_header();


 if (is_user_logged_in()) {?>
<section class="banner-sec event-banner">
	<div class="container">
		<div class="banner-holder">
			<h1>Create an Event</h1>
			<ul class="breadcrumb">
				<li><a href="/">Home</a></li>
				<li>Create an Event</li>
			</ul>
		</div>
	</div>
</section>
<section class="create-event-sec">
	<div class="container">
		<div class="event-holder">
			<div class="step-holder">
				<div class="card">
					<form class="msform" id="myforms" method="post" enctype="multipart/form-data">
						<ul class="progressbar">
							<li class="active" id="account"><strong>event information</strong></li>
							<li id="personal"><strong>T-Shirt Design Tap</strong></li>
							<li id="payment"><strong>Adding Team Member</strong></li>
							<li id="confirm"><strong>Review Info</strong></li>
						</ul>
						<fieldset>
							<div class="alert-success"></div>
							<div class="alert-danger"></div>
							<div class="form-card">
								<div class="first-step">
									<div class="form-group">
										<label for="#">Event Name</label>
										<input type="text" class="form-control" id="event_name" name="event_name" required>
									</div>
									<div class="form-group select-image">
										<label for="#">Event Image</label>
										<input type="file" class="custom-file-input" id="event_image" name="event_image" required>
									</div>
									<div class="form-group">
										<label for="#">Event Start</label>
										<input type="datetime-local" id="event_start" name="event_start" required>
									</div>
									<div class="form-group">
										<label for="#">Event End</label>
										<input type="datetime-local" id="event_end" name="event_end" required>
									</div>
									<div class="form-group textarea">
										<label for="#">Text for spot</label>
										<textarea name="spot" id="spot" required></textarea>
									</div>
								</div>
							</div>
								<input type="button" name="submit" onclick="AddEventjs()" class="save action-button" value="Save & Next" />
								<input type="button" name="next" class="next action-button" value="Skip" />
								<div class="loader-holder">
									<div class="loader"></div>
								</div>
				 		</fieldset>
						<fieldset>
							<div class="form-card">
								<div class="second-step">
									<h2>Selecting Template From Media Library</h2>
									<div class="image-holder icon-check mediaupload">
										<?php echo do_shortcode('[the_dramatist_front_upload]'); ?>
									</div>
								</div>
							</div> 
							<input type="button" name="previous" class="previous action-button-previous" value="Previous" /> 
							<input type="button" name="next" class="next action-button" value="Next" />
						</fieldset>
						<fieldset>
							<div class="success-msg"></div>
							<div class="danger-msg"></div>
							<div class="form-card">
								<div class="third-step">
									
									<div class="button-list-head">
										<ul>
											<li>Name:</li>
											<li>Price:</li>
											<li>Email:</li>
											<li>Select:</li>
											<li>Action:</li>
										</ul>
									</div>
									<?php 

									global $current_user;

									// $authorID = get_the_author_meta('ID');

									$args = array(
									    'post_type' => 'product',
									    'post_status' => 'publish',
									    'posts_per_page' => 12,
									    // 'product_cat' => 'pants',
									    'author'    => $current_user->ID
									);

									$loop = new WP_Query( $args );

									?>     

									<?php 
									$latest_post=array(
									     	  'post_type' => 'tribe_events',
										      'posts_per_page' => 1,
										      'author'    => $current_user->ID,
										      'post_status' => 'publish',
										      'orderby' => 'publish_date',
											  'order' => 'DESC',

											   ); 
											$lststEvnt=get_posts($latest_post);

												$event_id =$lststEvnt[0]->ID; 
												// var_dump($event_id);
												?>
									<!-- <div class="author_products"> -->
									    <?php if ( $loop->have_posts() ) { ?>
									        <ul class="author_pubproducts">
									        <?php while ( $loop->have_posts() ) : $loop->the_post(); 
									        	global $post;
									        	$product 		= wc_get_product( $post->ID );
									        	$member_emaill 	= get_field('email', $post->ID);

									        	if ($product->is_type( 'variable' )) 
									        	{
									        	    $available_variations = $product->get_available_variations();
										        	$spotprice = $available_variations[0]['display_regular_price'];
									        	    foreach ($available_variations as $key => $value) 
									        	    { 
									        	        //get values HERE  
									        	    }
									        	}else{
									        		$spotprice = $product->get_price();
									        	}

									        	?>
									        	<div class="first-step under-line buttons-list" id="editfield-top">
									        		<div class="form-group">
									        			<ul class="list-icons">
									        				<li><?php echo the_title(); ?></li>
									        				<li><?php echo '€'.$spotprice ?></li>
									        				<li><?php echo $member_emaill ?></li>
									        			</ul>
														<?php
															$member_id = get_the_ID();
														?>
														<ul class="list-icons check-box">
															<li><input type="checkbox" onclick="AssignEvent('<?php echo $member_id?>' , '<?php echo $event_id?>')"></li>
														</ul>
									        			<ul class="list-icons">
								        					<li><a onclick="editMember(<?php echo get_the_ID() ?>)" id="edit-btn"><i class="fa fa-pencil" aria-hidden="true"></i></a></li>
									        				<li><a onclick="deleteMember(<?php echo get_the_ID() ?>)" class="active"><i class="fa fa-times" aria-hidden="true"></i></a></li>
									        			</ul>
									        		</div>
									        	</div>


									        <?php
									        endwhile; ?>
									        </ul>
									        <?php
									        } else {
									            echo __( 'Not Any Existing Team Members Found', 'textdomain' );
									        }
									        wp_reset_postdata();
								 ?> 
									<div class="plus-btn-icon">
										<a href="javascript:void(0)" id="plus-btn" class="icon"><i class="fa fa-plus new" aria-hidden="true"></i></a>
									</div>
									<div class="team-added">
										<fieldset>
											<legend><h2>Team Member</h2></legend>
										<div class="first-step icon-holder">
											<div class="form-group">
												<label for="#">First Name</label>
												<input type="text" name="fname" id="fname_member">
											</div>
											<div class="form-group">
												<label for="#">Last Name</label>
												<input type="text" name="lname" id="lname_member">
											</div>
											<div class="form-group">
												<label for="#">Email</label>
												<input type="email" name="email" id="member_email">
											</div>
											<div class="form-group select-image">
												<label for="#">Image</label>
												<input type="file" class="custom-file-input" name="member_image" id="member_image">
											</div>
											<div class="form-group textarea">
												<label for="#">Discription</label>
												<textarea name="description" id="description_member"></textarea>
											</div>
										</div>
										<div class="first-step under-line">
											<div class="plus-btn-icon">
												<a href="javascript:void(0)" id="spot-add-btn" class="icon"><i class="fa fa-plus new" aria-hidden="true"></i></a>
											</div>
											<div class="first-step add-spot-fields" id="add-spot-fields">
												<h2>Spots</h2>
												<div class="form-group">
													<label for="#">Spot Name</label>
													<input type="text" id="spot_name"  name="spot_name">
												</div>
												<div class="form-group">
													<label for="#">Price</label>
													<input type="number" id="spot_price"  name="spot_price">
												</div>
												<div class="form-group select-image">
													<label for="#">Image</label>
													<input type="file" class="custom-file-input" id="spot_image" name="Spot_image">
												</div>
												<div class="form-group textarea">
													<label for="#">Discription</label>
													<textarea id="spot_desc" name="Spot_desc"></textarea>
												</div>
											</div>
												<div class="button-save">
													<input type="button" class="btn" onclick="AddTeamMember()" value="save">
												</div>
											</div>
											<div class="loader-holder">
												<div class="loader"></div>
											</div>
										</fieldset>
									</div>
									<div class="third-sec-step">
										<div class="form-image">
											<div class="first-step">
												<h2>Team Member</h2>
												<div class="form-group">
													<label for="#">First Name</label>
													<input type="text" id="first-name-edit" name="update_fname">
												</div>
												<div class="form-group">
													<label for="#">Last Name</label>
													<input type="text" id="last-name-edit" name="update_lname">
												</div>
												<div class="form-group">
													<label for="#">Email</label>
													<input type="email" id="email-edit" name="update_email">
												</div>
												<div class="form-group textarea">
													<label for="#">Discription</label>
													<textarea id="description-edit" name="update_desc"></textarea>
												</div>
											</div>
											<div class="avatar-upload">
												<div class="avatar-edit">
													<input type='file' id="imageUpload" accept=".png, .jpg, .jpeg" />
													<label for="imageUpload"></label>
												</div>
												<div class="avatar-preview">
													<div id="imagePreview" style="background-image: url(https://devfundraising.wpengine.com/wp-content/uploads/2021/01/create-event-img2.png);">
													</div>
												</div>
											</div>
										</div>
										<div class="form-image">
											<div class="first-step under-line">
												<h2>Spots</h2>
												<div class="form-group">
													<label for="#">Spot Name</label>
													<input type="text" id="spot-name-edit" name="update_spotname">
												</div>
												<div class="form-group">
													<label for="#">Price</label>
													<input type="number" id="spot-price-edit" name="update_price">
												</div>
												<div class="form-group textarea">
													<label for="#">Discription</label>
													<textarea id="spot-description-edit" name="update_spotdesc"></textarea>
												</div>
												<div class="button-save">
													<button type="button" onclick="UpdateTeamMember()" class="btn">Update</button>
													<button type="button" onclick="deleteMember()" class="btn delete">Delete</button>
													<div class="loader-holder">
														<div class="loader"></div>
													</div>
												</div>

												<?php ?> 
											</div>
											<div class="avatar-upload">
												<div class="avatar-edit">
													<input type='file' id="imageUpload" accept=".png, .jpg, .jpeg" />
													<label for="imageUpload"></label>
												</div>
												<div class="avatar-preview">
													<div id="imagePreview" style="background-image: url(https://devfundraising.wpengine.com/wp-content/uploads/2021/01/create-event-img2.png);">
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div> 
							<input type="button" name="previous" class="previous action-button-previous" value="Previous" /> <input type="button" name="make_payment" class="next action-button" value="Next" />
						</fieldset>
						<fieldset>
							<div class="form-card review-event-data">
								<div class="last-step">
									<h2>Summary</h2>
									<div class="summary-detail">
										<div class="summary-hol">
											<div class="event-info">
												<p>Event Information</p>
											</div>
											<?php 
											global $current_user;
												   // the query
										    $the_query = new WP_Query( array(
											     	  'post_type' => 'tribe_events',
												      'posts_per_page' => 1,
												      'author'    => $current_user->ID,
												      'post_status' => 'publish',
												      'orderby' => 'publish_date',
													  'order' => 'DESC',

													   )); 
													?>

												<?php if ( $the_query->have_posts() ) : ?>
												  <?php while ( $the_query->have_posts() ) : $the_query->the_post(); 
												  	global $post;
												  	$data_meta=get_post_meta($post->ID);
												  	$event_image_id=$data_meta['_thumbnail_id'][0];
												  	$eventImage = get_the_post_thumbnail_url($post->ID);
												  	?>
											<div class="team-detail">
												<div class="colom">
													<p id="review-event-name"><?php echo the_title(); ?></p>
												</div>
												<div class="colom image evntImage">
													 <img src="<?php echo $eventImage ?>" alt="image" id="review-event-image"> 
												</div>
												<div class="colom">
													<p id="review-event-start"><?php echo $data_meta['_EventStartDate'][0] ?></p>
												</div>
												<div class="colom">
													<p id="review-event-end"><?php echo $data_meta['_EventEndDate'][0] ?></p>
												</div>
											</div>
											<div class="sumary-info">
												<p id="review-event-desc"><?php echo the_excerpt(); ?></p>
											</div>
											    <?php endwhile; ?>
											    <?php wp_reset_postdata(); ?>

												<?php else : ?>
												  <p><?php __('No Existing Events Found'); ?></p>
												<?php endif; ?>
										</div>
									</div>
									<div class="summary-detail">

									<?php	

										global $current_user;

										$latest_post=array(
									     	  'post_type' => 'tribe_events',
										      'posts_per_page' => 1,
										      'author'    => $current_user->ID,
										      'post_status' => 'publish',
										      'orderby' => 'publish_date',
											  'order' => 'DESC',

											   ); 
											$lststEvnt=get_posts($latest_post);

												$event_id =$lststEvnt[0]->ID;

										$args = array(
												    'post_type'  => 'product',
												    'post_status' => 'publish',
												    'posts_per_page' => 20,
												    // 'offset'     => $offset,

												    'meta_query' => array(
												        'relation' => 'AND',
												        array(
												            'key'     => 'events',
												            'value'   => $event_id,
												            // 'compare' => '==',
												            'compare' => 'LIKE',
												        ),
												    )
												); 

													$adja=get_posts($args);
													foreach ($adja as $key => $value) { 

													 $image=get_the_post_thumbnail_url($value->ID);

													 ?>
										<div class="summary-hol">
											<div class="event-info">
												<p>Team Member Information</p>
											</div>
											<div class="team-detail">
												<div class="colom">
													<p id="review-member-fname"><?php echo get_field('fname',$value->ID); ?></p>
												</div>
												<div class="colom">
													<p id="review-member-lname"><?php echo get_field('lname',$value->ID); ?></p>
												</div>
												<div class="colom">
													<p id="review-member-email"><?php echo get_field('email',$value->ID); ?></p>
												</div>
												<div class="colom image">
													<img src="<?php echo $image ?>" alt="image" id="review-member-image">
												</div>
											</div>
											<div class="sumary-info">
												<p id="review-member-desc"></p>
											</div>
										</div><br>
									<?php } ?>
									</div>
								</div>
							</div>
							<input type="button" name="previous" class="previous action-button-previous" value="Previous" /> <input type="button" name="make_payment" class="next action-button" onclick="submitform()" value="Submit" />
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>




 <?php 
}else {
 	echo "<div class='not_loggeduser'>Please logged in first <a href='https://devfundraising.wpengine.com/organizer-login'>Here</a></div>";
 } 


get_footer(); 
?>
