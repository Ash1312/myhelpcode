<?php 

 /* Template Name: Organizer Signup */

get_header();


//Register New Organizer
if (isset($_POST['submit']) ){

    $fname = $_POST['fname'];
    // $display_name= 
    $lname = $_POST['lname'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $team_name = $_POST['team_name'];
    $org_name = $_POST['organization_name'];
    $org_add = $_POST['address'];
    $password = $_POST['pass'];

    $username_exist  = username_exists( $fname );
    $email_exist     = email_exists( $email );

    $admin_email=get_option('admin_email');
    
    if ( $username_exist) {
        $result='<div class="alert alert-danger">Username Already Exists ! Please Try Again with different Username</div>';
    }elseif ($email_exist ) {
        $result='<div class="alert alert-danger">Email Already Exists ! Please Try Again with different Email</div>';
    }elseif (!$username_exist && !$email_exist) {
        $orgcreated = wp_create_user( $fname, $password, $email );
        $usercreated = new WP_User($orgcreated);
        $usercreated->set_role('give_manager');
        add_user_meta($usercreated->data->ID,'organization_name', $org_name);
        add_user_meta($usercreated->data->ID,'address', $org_add);
        add_user_meta($usercreated->data->ID,'team_name', $team_name);
        add_user_meta($usercreated->data->ID,'first_name', $fname);
        add_user_meta($usercreated->data->ID,'last_name', $lname);
        add_user_meta($usercreated->data->ID,'billing_phone', $phone);
        wp_insert_term( $team_name, 'product_cat');
        $result='<div class="alert alert-success">Thankyou for Registration! Please Login</div>';

        $htmlContent = '<html>
                        <head>
                            <title>Email Newsletter</title>
                            <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,600;0,700;0,800;1,300;1,400;1,600;1,700;1,800&display=swap" rel="stylesheet">
                         <style>
                            tr.social-icons td a img {
                            margin: 0 2px;
                            max-width: 30px;
                            min-height: 22px;
                            object-fit: contain;
                            }
                            tr.social-icons td a {
                                display: block;
                            }
                        </style>   
                        </head>
                        <body style="width: 100%; max-width: 808px; margin: 0 auto; text-align: center;">
                        <table cellpadding="0" cellspacing="0" border="0" style="width: 808px; margin: 0 auto; background-color: #fff; text-align: left;" bgcolor="#fff"> 
                            <tr>
                            <td height="35"></td>
                            <td height="35"></td>
                            <td height="35"></td>
                            </tr>
                            <tr>
                                <td width="50%" align="center">
                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                <tr>
                                <td width="0"></td>
                                <td align="center" valign="center"><a href="https://devfundraising.wpengine.com"><img src="https://devfundraising.wpengine.com/wp-content/uploads/2020/12/form-logo.png" width="100%"></a></td>
                                <td width="30"></td>
                                </tr>
                                </table>
                                </td>
                                <td style="background-color: #D8D8D8; width: 3px">&nbsp;</td>
                                <td width="50%">
                                <table cellpadding="0" cellspacing="0" border="0">
                                    <tr>
                                    <td width="30"></td>
                                    <td>
                                <table cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                <td>
                                <div style="color: #4A4A4A; font-family: "Open Sans", sans-serif; font-size: 37px; font-weight: bold; letter-spacing: 0; line-height: 51px; margin: 0">Yves Ballenegger</div>
                                </td>
                                    </tr>
                                    <tr>
                                    <td>
                                    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                    <tr>
                                    <td width="7%" valign="top">
                                <table cellpadding="0" cellspacing="0" border="0">
                                <tr><td style="padding-top: 5px"><img src="https://groovyyurts.com/wp-content/uploads/2020/07/location.png"></td></tr></table>
                                </td><td width="93%" valign="top" style="color: #4A4A4A; font-family: "Open Sans", sans-serif; font-size: 20px; font-weight: 400; letter-spacing: 0; line-height: 27px;">20845 McCormick Rd. Alexadria, On, Canada, KOC1A0</td></tr>
                                        </table>
                                            </td>
                                        </tr><tr><td height="8"></td></tr>
                                        <tr>
                                    <td>
                                    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                        <tr>
                                            <td width="7%" valign="top"><img src="https://groovyyurts.com/wp-content/uploads/2020/07/phone-call.png" width="18px"></td>
                                            <td width="93%" style="color: #4A4A4A; font-family: "Open Sans", sans-serif; font-size: 20px; font-weight: 400; letter-spacing: 0; line-height: 27px;"> 1-888-GROOVYY (Toll Free)</td>
                                </tr></table></td></tr>
                                <tr><td height="10"></td></tr>
                                <tr><td>
                                <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                <td width="7%" valign="top"><img src="https://groovyyurts.com/wp-content/uploads/2020/07/phone.png"></td><td width="93%" style="color: #4A4A4A; font-family: "Open Sans", sans-serif; font-size: 20px; font-weight: 400; letter-spacing: 0; line-height: 27px;">514-578-5008</td>
                                </tr></table></td></tr></table>
                                    </td>
                                    <td width="30"></td>
                                </tr>
                                    </table>
                                </td>
                                </tr>
                                <tr>
                                    <td height="80"></td>
                                </tr>
                                <p style="text-align:left;">Hi Dear Member, <br>
                                You are Successfully Registered on the fundraising website, the account details are given below:
                                 </p>
                                <tr margin-top="20px";> 
                                <th style="text-align:left;">First Name:</th><td style="text-align:left; width:50%;">'.$fname.'</td> 
                                </tr> 
                                <tr> 
                                    <th style="text-align:left;">Last Name:</th><td style="text-align:left; width:50%;">'.$lname.'</td> 
                                </tr>
                                <tr> 
                                    <th style="text-align:left;">Email:</th><td style="text-align:left; width:50%;">'.$email.'</td> 
                                </tr>
                                <tr> 
                                    <th style="text-align:left;">Phone:</th><td style="text-align:left; width:50%;">'.$phone.'</td> 
                                </tr>
                                <tr> 
                                    <th style="text-align:left;">Team Name:</th><td style="text-align:left; width:50%;">'.$team_name.'</td> 
                                </tr>
                                <tr> 
                                    <th style="text-align:left;">Organization Name:</th><td style="text-align:left; width:50%;">'.$org_name.'</td> 
                                </tr>
                                <tr> 
                                    <th style="text-align:left;">Organization Address:</th><td style="text-align:left; width:50%;">'.$org_add.'</td> 
                                </tr>
                                <tr margin-bottom="20px"; > 
                                 <th style="text-align:left;">Password:</th><td style="text-align:left; width:50%;">'.$password.'</td> 
                                </tr >
                                <tr>
                                    <td height="30"></td>
                                </tr>
                                <p style="text-align:left;">
                                    Thanks!<br>
                                    Team Fundraising Event
                                </p>
                                <tr bgcolor="#01999A">
                                <td width="50%">
                                <table cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td height="7"></td>
                                </tr>
                                <tr>
                                    <td width="10%"></td>
                                    <td>
                                        <a style="color: #fff; padding: 0 0 0 10px; text-decoration: none;" href="https://devfundraising.wpengine.com/">www.fundraisingevent.com</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="7"></td>
                                </tr>
                                </table>
                                </td>
                                    <td></td>
                                    <td width="50%">
                                    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%">
                                    <tr>
                                        <td height="7"></td>
                                    </tr>
                                    <tr align="right" class="social-icons">
                                        <td width="44%"></td>
                                        <td width="10%" align="right"><a href="#" valign="middle"><img src="https://groovyyurts.com/wp-content/uploads/2020/07/youtube.png"></a></td>
                                        <td width="10%" align="right" valign="middle"><a href="#"><img src="https://groovyyurts.com/wp-content/uploads/2020/07/facebook.png"></a></td>
                                        <td width="5%"></td>
                                        <td width="10%" align="center" valign="middle"><a href="#"><img src="https://groovyyurts.com/wp-content/uploads/2020/07/instagram.png"></a></td>
                                        <td width="5%"></td>
                                        <td width="8%" align="right" valign="middle"><a href="#"><img src="https://groovyyurts.com/wp-content/uploads/2020/07/twitter.png"></a></td>
                                        <td width="8%"></td>
                                    </tr>
                                    <tr>
                                    <td height="7"></td>
                                        </tr>
                                    </table>
                                    </td>
                                </tr>
                            </table>
                        </body>
                        </html>';

             // Set content-type header for sending HTML email 
            $headers = "MIME-Version: 1.0" . "\r\n"; 
            $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n"; 
             
            // Additional headers 
            $headers .= 'From: <'.$admin_email.'>' . "\r\n"; 
            $headers .= 'Reply-to:'.$admin_email. "\r\n";                  


             mail($email ,$fname, $htmlContent, $headers);
        if ($usercreated) { 

            header('Location: '.'/organizer-login/');
            
        }
    }
}
?>

<style><link href='http://fonts.googleapis.com/css?family=Bitter' rel='stylesheet' type='text/css'></style> 
<div class="main-form-row">
    <div class="inner-form-row">
        <div class="custom-form-signup">
            <div class="form-logo">
                <img src="https://devfundraising.wpengine.com/wp-content/uploads/2020/12/form-logo.png">
            </div>
            <div class="form-title">
                <h1>Organizer <span>Signup</span></h1>
            </div>

            <!-- alert after registration -->
            <div class="form-group">
                 <div class="col-sm-10 col-sm-offset-2">
                    <?php
                    if (isset($result)) {
                        echo $result;
                     } 
                    ?>    
                 </div>
            </div>

            <form action="https://devfundraising.wpengine.com/organizer-signup/" method="post">

                <div class="form-group">
                    <input type="text" class="form-control" name="fname"  placeholder="First Name" required />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="lname"  placeholder="Last Name" required />
                </div>

                <div class="form-group">
                    <input type="email" class="form-control" name="email"  placeholder="Email Address" required />
                </div>

                <div class="form-group">
                    <input type="int" class="form-control" name="phone"  placeholder="Phone#" required />
                </div>

                <div class="form-group">
                    <input type="text" class="form-control" name="team_name"  placeholder="Team Name" required />
                </div>

                <div class="form-group">    
                    <input type="text" class="form-control" name="organization_name"  placeholder="Organization Name" /></label>
                </div>

                <div class="form-group">    
                    <input type="text" class="form-control" name="address"  placeholder="Organization Address" /></label>
                </div>

                <div class="form-group">
                    <input type="password" class="form-control" name="pass"  placeholder="Password" required /></label>
                </div>  
                <div class="button-section">
                   <input type="submit" name="submit" class="btn btn-success btn-light-sky" />
                </div>

            </form>
                <div class="button-section">
                   <a href="/organizer-login/"><input type="submit" class="btn btn-success loginBtnn " name="Sign Up" value="Login Here" /></a>
               </div>
        </div>
    </div>
</div>


<?php

  get_footer();

 ?>