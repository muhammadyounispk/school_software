<?php

namespace Netflie\WhatsAppCloudApi;

class WhatsAppCloudApiApp
{
    /**
     * @const string The name of the environment variable that contains the app from phone number ID.
     */
    

    /**
     * @const string The name of the environment variable that contains the app access token.
     */
 

    /**
     * @const string Facebook Phone Number ID.
     */
    protected  $from_phone_number_id="";

    /**
     * @const string Facebook Whatsapp Access Token.
     */
    protected  $access_token="";

    /**
     * Sends a Whatsapp text message.
     *
     * @param string The Facebook Phone Number ID.
     * @param string The Facebook Whatsapp Access Token.
     *
     */
    public function __construct( $from_phone_number_id,  $access_token)
    {
        $this->from_phone_number_id = $from_phone_number_id;
        $this->access_token = $access_token ;
         if($access_token and $from_phone_number_id){
           // $this->validate($this->from_phone_number_id, $this->access_token);
         }

       
  
    }

    /**
     * Returns the Facebook Whatsapp Access Token.
     *
     * @return string
     */
    public function accessToken(): string
    {
        return $this->access_token;
    }

    /**
     * Returns the Facebook Phone Number ID.
     *
     * @return string
     */
    public function fromPhoneNumberId(): string
    {
        return $this->from_phone_number_id;
    }

    private function validate(string $from_phone_number_id, string $access_token): void
    {
        // validate by function type hinting
    }

    private function loadEnv(): void
    {
        $dotenv = \Dotenv\Dotenv::createImmutable(__DIR__);
        $dotenv->safeLoad();
    }
}
