	<?php
	$to = 'noabysanak@mail.ru';
	$subject = '52352 fgsg  ';
	$message = 'dfgdfg432 g ';
	$headers = array(
	    'Content-Type' => 'text/html; charset=UTF-8;',
	    'From' => 'gh75474@'.$_SERVER['SERVER_NAME']
	);
	 if(mail($to,$subject,$message, $headers))
	    {
	    	echo 'Test email send.';
	    } 
	    else 
	    {
	    	echo 'Failed to send.';
	    }

	$to2 = 'tysonerardo@gmail.com';
	$subject2 = 'ыфвф a';
	$message2 = 'фа пы';
	$headers2 = array(
	    'Content-Type' => 'text/html; charset=UTF-8;',
	    'From' => '65656@'.$_SERVER['SERVER_NAME']
	);
	 if(mail($to2,$subject2,$message2, $headers2))
	    {
	    	echo 'Test email send.';
	    } 
	    else 
	    {
	    	echo 'Failed to send.';
	    }


	?>
