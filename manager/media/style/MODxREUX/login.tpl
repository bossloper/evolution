<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
    <title>[+site_name+] (CMS Manager Login)</title><!--uxello-->
    <meta http-equiv="content-type" content="text/html; charset=[+modx_charset+]" />
    <meta name="robots" content="noindex, nofollow" />
    <style type="text/css">
		body {
			font-family: Arial, HelveticaNeue, "Helvetica Neue", Helvetica, "Hiragino Kaku Gothic Pro", Meiryo, sans-serif;
		}
		input {
			font-family:inherit;
		}
		#login {
			background: #eeeeee url('media/style/[+theme+]/images/body.jpg');
			margin: 12% 0 0;
		/* uxello */
		background-color: #fff;
		background-image: url(../images/managerlogin_bg.jpg);
		background-repeat: no-repeat;
		background-size: 100% auto;
		background-position: center bottom;
		background-attachment: fixed;					
		}
		#mx_loginbox {
			width: 309px;
			margin: 0 auto;
		}
		.sectionBody {
			border: 1px solid #E6E6E6;
			background: #FEFEFE;
		    padding: 25px 0 0 20px;
			overflow: hidden;
			-webkit-box-shadow: 0 0 5px rgba(50, 50, 50, 0.2);
			-moz-box-shadow:    0 0 5px rgba(50, 50, 50, 0.2);
			box-shadow:         0 0 5px rgba(50, 50, 50, 0.2);
			-webkit-border-radius: 5px;
			-moz-border-radius: 5px;
			border-radius: 5px;
		}
//uxello
		    p.loginMessage {

    display: block;
float:left;
position:relative;
    margin: -10px -20px 20px;
font-size:.8em;
    border-radius: 5px 5px 0 0;
    width: 265px;
    font-weight: bold;
    color: #fff;
    text-align: left;
    text-indent: 0;
	    padding: 10px 20px;
    background: #999;
    border: 1px solid #7e8b9a;
    border-bottom: 1px solid #657587;
    }
		
		.logo {
			margin: 0 0 0 14px;
		}
		.logo img{
			border: 0 none;
			margin: 0 0 17px;
		}
		.sectionBody label {
			color: #666666;
			display: block;
			font: 14px Arial;
			margin: 0 0 11px;
		}
		.sectionBody .text {
			width: 261px;
			height: 33px;
			border: 1px solid #E5E5E5;
			text-indent: 5px;
			margin: 0 0 10px;
			font-size: 20px;
			-webkit-border-radius: 5px;
			-moz-border-radius: 5px;
			border-radius: 5px;
			-webkit-box-shadow: 0 0 5px rgba(188, 188, 188, 0.2);
			-moz-box-shadow:    0 0 5px rgba(188, 188, 188, 0.2);
			box-shadow:         0 0 5px rgba(188, 188, 188, 0.2);
		}
		.sectionBody .text:focus {
			border: 1px solid #DECBA5;
			-webkit-box-shadow: 0 0 5px rgba(222, 203, 165, 0.5);
			-moz-box-shadow:    0 0 5px rgba(222, 203, 165, 0.5);
			box-shadow:         0 0 5px rgba(222, 203, 165, 0.5);
		}
		#rememberme {
			float: left;
			margin: 3px 5px 0 1px;
		}
		.sectionBody .remtext {
			color: #999999;
			display: block;
			float: left;
			font-size: 13px;
			margin: 0;
		} 
		#submitButton {
			display: block;
			float: right;
			border: 0;
			width: 91px;
			height: 33px;
			cursor: pointer;
			/*text-indent: -9999px;*/
			color:#fff;
			font-size: 14px;
			font-weight: 100;
		    margin-top: -7px;
		    margin-right:20px;
		    margin-bottom:10px;
			background: url('media/style/[+theme+]/images/misc/enter.png') no-repeat top left;
		}

    #onManagerLoginFormRender {

float:left;
    clear: both;
    color: #aaa;
    width: 100%;
    margin: 0 -20px 0;
    background: #eee url("data:image/png;base64,R0lGODlhCgAfAOYAAO/v7/Ly8u/v7/Dw8Ozs7O/v7+3t7ezs7PHx8ezs7O7u7vLy8u/v7+zs7PDw8O7u7vPz8+3t7ezs7PLy8uzs7PLy8vLy8u7u7u3t7fDw8Ovr6+vr6/Dw8PDw8PPz8/Ly8u7u7uzs7PHx8fDw8PDw8O7u7u/v7/Ly8u/v7/Ly8vLy8u/v7+zs7PHx8e3t7ezs7PHx8fHx8e7u7uzs7O7u7uzs7Ozs7Ozs7PLy8vHx8fLy8vLy8uzs7O3t7ezs7PLy8vLy8uzs7O/v7+/v7/Ly8vLy8uzs7PHx8fDw8O3t7e3t7ezs7PLy8uzs7Ozs7Ozs7O7u7vDw8O3t7fLy8u7u7vLy8vHx8fLy8uzs7PDw8Ozs7PLy8uzs7PHx8e7u7vLy8u3t7e3t7fLy8vHx8e7u7vDw8PLy8u7u7vDw8O7u7vn5+evr6/Pz88nJycnJycnJycnJycnJycnJycnJycnJycnJycnJycnJycnJycnJycnJycnJycnJycnJycnJycnJySwAAAAACgAfAAAH/4BqgoOEbIaHiImJEBBmHo4ejGZmRWYfH186lmZAWz8LKaALC2ITVxMTFhapFkQBATsBKlUqrwEnOBUnTLkVUxVjCAgiIlYiwghHLS0wMV0xMDk5DgPU1NUDAyNRGR0jGd0dWWUcHGXn5OdIaCRo7u3uAPJDKELyACgC+gIMDPz8BUyYKFBgRUGCZ85cUJgw4YU0UNJIpCJRYgkvJUDQ0CgDhIwHCh6ADKlAARkDBnoYUAIGpQsXGCJEwBBGZhIpGAgQ0KKTwBMCWIwceHFgxgsnRQ8ckECBqY8bTZneaMCjARcWQRqwaJDARpMEYEPYCJFgSY0QG2po2KBh7Zq3cAPjBgIAOw==") repeat-x top left;
    padding: 5px 20px 10px;
    border-top: 1px solid #ccc;
    }		
		#FMP-email_label {
			color: #666666;
			font: 13px Arial;
			margin: 0 0 7px;
		}
		#FMP-email {
			width: 261px;
			height: 33px;
			border: 1px solid #E5E5E5;
			text-indent: 5px;
			margin: 0 0 10px;
			font-size: 14px;
			-webkit-border-radius: 5px;
			-moz-border-radius: 5px;
			border-radius: 5px;
			-webkit-box-shadow: 0 0 5px rgba(188, 188, 188, 0.2);
			-moz-box-shadow:    0 0 5px rgba(188, 188, 188, 0.2);
			box-shadow:         0 0 5px rgba(188, 188, 188, 0.2);
		}
		#FMP-email:focus {
			border: 1px solid #DECBA5;
			-webkit-box-shadow: 0 0 5px rgba(222, 203, 165, 0.5);
			-moz-box-shadow:    0 0 5px rgba(222, 203, 165, 0.5);
			box-shadow:         0 0 5px rgba(222, 203, 165, 0.5);
		}
		#FMP-email_button {
			display: block;
			float: right;
			border: 0;
			width: 91px;
			height: 33px;
			cursor: pointer;
			/*text-indent: -9999px;*/
			color:#fff;
			font-size: 14px;
			font-weight: 100;
		    margin-top: 10px;
		    margin-right:20px;
		    margin-bottom:10px;
			background: url('media/style/[+theme+]/images/misc/enter.png') no-repeat top left;
		}
		.loginLicense {
			width: 309px;
			margin: 0 auto;
			display: block;
		}
		.loginLicense a {
			color: #999999;
			display: block;
			font: 13px Arial;
			margin: 13px 0 0 21px;
			text-decoration: underline;
		}
		#ForgotManagerPassword-show_form {
			color: #999999;
			display: block;
			font: 13px Arial;
			margin: 0 0 10px;
			text-align: left;
		}
		.error {
			font: 13px Arial;
			color: #f00;
		}
		.gpl {
			position: absolute;
			bottom: 0;
			right: 0;
			color: #B2B2B2;
			margin: 0.5em auto;
			font-size: 80%;
		}
        .gpl a, .loginLicense a {
			color: #B2B2B2;
		}
    </style>

    <script src="media/script/mootools/mootools.js" type="text/javascript"></script>

    <script type="text/javascript">
    /* <![CDATA[ */
        if (top.frames.length!=0) {
            top.location=self.document.location;
        }
        
        window.addEvent('domready', function() {
            $('submitButton').addEvent('click', function(e) {
                 e = new Event(e).stop();
                 params = 'ajax=1&' + $('loginfrm').toQueryString();
                 url = 'processors/login.processor.php';
                 new Ajax(url,
                    {
                        method: 'post',
                        postBody: params,
                        onComplete:ajaxReturn
                    }
                ).request();
                $$('input').setProperty('readonly', 'readonly');
            });  
			
			// Initial focus
			if ($('username').value != '') {
				$('password').focus();
			} else {
				$('username').focus();
			}
			   
        });

        function ajaxReturn(response) {
            var header = response.substr(0,9);
            if (header.toLowerCase()=='location:') top.location = response.substr(10);
            else {
                var cimg = $('captcha_image');
                if (cimg) {
                	cimg.src = 'includes/veriword.php?rand=' + Math.random();
                }
                $$('input').removeProperty('readonly');
                alert(response);
            }
        }
    /* ]]> */
    </script>
</head>
<body id="login">

<div id="mx_loginbox">
    <form method="post" name="loginfrm" id="loginfrm" action="processors/login.processor.php">
    <!-- anything to output before the login box via a plugin? -->
    [+OnManagerLoginFormPrerender+]

        <div class="sectionBody">
         <p class="loginMessage">[+login_message+]</p>       
        <p><a href="../" style="color:#000">[+site_name+]</a></p><!--uxello-->
        
            <!--<p class="loginMessage">[+login_message+]</p>-->
            <label for="username">[+username+]</label>
            <input type="text" class="text" name="username" id="username" tabindex="1" value="[+uid+]" />
            <label for="password">[+password+]</label>
            <input type="password" class="text" name="password" id="password" tabindex="2" value="" />
            <p class="caption">[+login_captcha_message+]</p>
            <div>[+captcha_image+]</div>
            [+captcha_input+]
            <input type="checkbox" id="rememberme" name="rememberme" tabindex="4" value="1" class="checkbox" [+remember_me+] />
			<label for="rememberme" style="cursor:pointer" class="remtext">[+remember_username+]</label>
            <input type="submit" class="login" id="submitButton" value="[+login_button+]" />
            <!-- anything to output before the login box via a plugin ... like the forgot password link? -->
            [+OnManagerLoginFormRender+]
        </div>
    </form>
</div>
<!-- close #mx_loginbox -->

<!-- convert this to a language include -->
<p class="loginLicense" >
	
</p>

</body>
</html>