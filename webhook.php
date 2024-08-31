<?php
 
// Retrieve the JSON payload from the webhook

$payload = file_get_contents('php://input');

$data = json_decode($payload, true);



// Verify the signature using your Authy API key and the X-Authy-Signature header

$signature = hash_hmac('sha256', $payload, '3pIK42oJIVVPqLALNin1w3pNNCx9Nzdu');

if ($signature != $_SERVER['HTTP_X_AUTHY_SIGNATURE']) {

    header('HTTP/1.1 400 Bad Request');

    echo "Invalid signature";

    exit;

} 



// Process the event based on the data received in the payload

if ($data['status'] == 'approved') {

    // Handle successful authentication

    echo "Authentication successful";

} elseif ($data['status'] == 'denied') {

    // Handle failed authentication

    echo "Authentication failed";

} else {

    // Handle other events

    echo "Unknown event";

}

?>

