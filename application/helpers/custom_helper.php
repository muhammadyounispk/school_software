<?php
define('DIGIS_ACCOUNT', COMPANY_ACCOUNT . '01' . getSchoolID());
use Mpdf\Utils\Arrays;
use function Clue\StreamFilter\fun;
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}
//include_once 'ini.php';
if (!function_exists('is_subAttendence')) {
    function is_subAttendence()
    {
        $CI = &get_instance();
        $CI->db->select(
            'sch_settings.id,sch_settings.lang_id,sch_settings.attendence_type,sch_settings.is_rtl,sch_settings.timezone,
          sch_settings.name,sch_settings.email,sch_settings.biometric,sch_settings.biometric_device,sch_settings.phone,languages.language,
          sch_settings.address,sch_settings.dise_code,sch_settings.date_format,sch_settings.currency,sch_settings.currency_symbol,sch_settings.start_month,sch_settings.session_id,sch_settings.image,sch_settings.theme,sessions.session'
        );
        $CI->db->from('sch_settings');
        $CI->db->join('sessions', 'sessions.id = sch_settings.session_id');
        $CI->db->join('languages', 'languages.id = sch_settings.lang_id');
        $CI->db->order_by('sch_settings.id');
        $query = $CI->db->get();
        $result = $query->row();
        if ($result->attendence_type) {
            return true;
        }
        return false;
    }
}
if (!function_exists('get_subjects')) {
    function get_subjects($class_batch_id)
    {
        $CI = &get_instance();
        $CI->db->select('class_batch_subjects.*,subjects.name as `subject_name`');
        $CI->db->from('class_batch_subjects');
        $CI->db->join('subjects', 'subjects.id = class_batch_subjects.subject_id');
        $CI->db->where('class_batch_id', $class_batch_id);
        $CI->db->order_by('class_batch_subjects.id', 'asc');
        $query = $CI->db->get();
        $return_string = '<option value="">--Select--</option>';
        $result = $query->result();
        if (!empty($result)) {
            foreach ($result as $result_key => $result_value) {
                $return_string .= '<option value="' . $result_value->id . '">' . $result_value->subject_name . '</option>';
            }
        }
        return $return_string;
    }
}
function setInput($name, $value)
{
    $_SESSION[$name] = $value;
}
function getInput($name, $clear = true)
{
    $data =  isset($_SESSION[$name]) ?  $_SESSION[$name] : '';
    if ($clear) {
        unset($_SESSION[$name]);
    }
    return $data;
}
if (!function_exists('readmorelink')) {
    function readmorelink($string, $link = false)
    {
        $string = strip_tags($string);
        if (strlen($string) > 150) {
            // truncate string
            $stringCut = substr($string, 0, 150);
            $endPoint = strrpos($stringCut, ' ');
            //if the string doesn't contain any space then it will cut without word basis.
            $string = $endPoint ? substr($stringCut, 0, $endPoint) : substr($stringCut, 0);
            $string .= ($link) ? "<a href='" . $link . "' target='_blank'>Read more...</a>" : "....";
        }
        return $string;
    }
}
if (!function_exists('readmorelinkUser')) {
    function readmorelinkUser($string, $link = false)
    {
        $string = strip_tags($string);
        if (strlen($string) > 150) {
            // truncate string
            $stringCut = substr($string, 0, 150);
            $endPoint = strrpos($stringCut, ' ');
            //if the string doesn't contain any space then it will cut without word basis.
            $string = $endPoint ? substr($stringCut, 0, $endPoint) : substr($stringCut, 0);
            $string .= ($link) ? "<a href='#" . $link . "' data-toggle='collapse' aria-expanded='false' aria-controls='" . $link . "' >Read more...</a>" : "....";
        }
        return $string;
    }
}
function expensegraphColors($color = null)
{
    $colors = array(
        '1' => "#9966ff",
        '2' => "#36a2eb",
        '3' => "#ff9f40",
        '4' => "#715d20",
        '5' => "#c9cbcf",
        '6' => "#4bc0c0",
        '7' => "#ffcd56",
        '8' => "#66aa18",
    );
    if ($color == null) {
        return $colors;
    } else {
        return $colors[$color];
    }
}
function incomegraphColors($color = null)
{
    $colors = array(
        '1' => "#66aa18",
        '2' => "#ffcd56",
        '3' => "#4bc0c0",
        '4' => "#c9cbcf",
        '5' => "#715d20",
        '6' => "#ff9f40",
        '7' => "#36a2eb",
        '8' => "#9966ff",
    );
    if ($color == null) {
        return $colors;
    } else {
        return $colors[$color];
    }
}
function isJSON($string)
{
    return is_string($string) && is_array(json_decode($string, true)) && (json_last_error() == JSON_ERROR_NONE) ? true : false;
}
function currentTime()
{
    return date("d/m/y : H:i:s", time());
}
function markSheetDigit()
{
    $number = 190908100.25;
    $no = floor($number);
    $point = round($number - $no, 2) * 100;
    $hundred = null;
    $digits_1 = strlen($no);
    $i = 0;
    $str = array();
    $words = array(
        '0' => '', '1' => 'one', '2' => 'two',
        '3' => 'three', '4' => 'four', '5' => 'five', '6' => 'six',
        '7' => 'seven', '8' => 'eight', '9' => 'nine',
        '10' => 'ten', '11' => 'eleven', '12' => 'twelve',
        '13' => 'thirteen', '14' => 'fourteen',
        '15' => 'fifteen', '16' => 'sixteen', '17' => 'seventeen',
        '18' => 'eighteen', '19' => 'nineteen', '20' => 'twenty',
        '30' => 'thirty', '40' => 'forty', '50' => 'fifty',
        '60' => 'sixty', '70' => 'seventy',
        '80' => 'eighty', '90' => 'ninety'
    );
    $digits = array('', 'hundred', 'thousand', 'lakh', 'crore');
    while ($i < $digits_1) {
        $divider = ($i == 2) ? 10 : 100;
        $number = floor($no % $divider);
        $no = floor($no / $divider);
        $i += ($divider == 10) ? 1 : 2;
        if ($number) {
            $plural = (($counter = count($str)) && $number > 9) ? 's' : null;
            $hundred = ($counter == 1 && $str[0]) ? ' and ' : null;
            $str[] = ($number < 21) ? $words[$number] .
                " " . $digits[$counter] . $plural . " " . $hundred :
                $words[floor($number / 10) * 10]
                . " " . $words[$number % 10] . " "
                . $digits[$counter] . $plural . " " . $hundred;
        } else {
            $str[] = null;
        }
    }
    $str = array_reverse($str);
    $result = implode('', $str);
    $points = ($point) ?
        "." . $words[$point / 10] . " " .
        $words[$point = $point % 10] : '';
    return $result . $points;
}
function getSecondsFromHMS($time)
{
    $timeArr = array_reverse(explode(":", $time));
    $seconds = 0;
    foreach ($timeArr as $key => $value) {
        if ($key > 2)
            break;
        $seconds += pow(60, $key) * $value;
    }
    return $seconds;
}
function getHMSFromSeconds($seconds)
{
    $t = round($seconds);
    return sprintf('%02d:%02d:%02d', ($t / 3600), ($t / 60 % 60), $t % 60);
}
function array_insert(&$array, $position, $insert)
{
    if (is_int($position)) {
        array_splice($array, $position, 0, $insert);
    } else {
        $pos   = array_search($position, array_keys($array));
        $array = array_merge(
            array_slice($array, 0, $pos),
            $insert,
            array_slice($array, $pos)
        );
    }
}
function pr($data = null)
{
    echo "<pre>";
    print_r($data);
    echo "</pre>";
}
function getStudentAccount($id = null)
{
    return "0380001" . $id;
}
function getSchoolID()
{
    return $_SESSION['school_id'];
}
function phone_check($phone_number)
{
    $regex = '/^\d{3}\s\d{3}\s\d{4}\s\d{3}$/'; // validates 123 123 1234 123
    if (!preg_match($regex, $phone_number)) {
        $this->form_validation->set_message('guardian_phone', 'Phone Number not valid.');
        return false;
    }
    return true;
}
function displayDropDown(&$fieldlist, $defaultvalue = null, $selected_cols = "id,name")
{
    $strDropDown = null;
    $selected_cols = explode(",", $selected_cols);
    if ($selected_cols) {
        $fieldlist = extractColumns($fieldlist, $selected_cols);
    }
    foreach ($fieldlist as $key => $row) {
        if (!$row[$selected_cols[1]] == "") {
            $strDropDown = $strDropDown . '<option  value="' . $row[$selected_cols[0]] . '"';
            if ($row[$selected_cols[0]] == $defaultvalue && !$defaultvalue == "") {
                $strDropDown = $strDropDown . ' selected="selected" ';
            }
            $strDropDown = $strDropDown . ">" . $row[$selected_cols[1]] . "</option>";
        }
    }
    return $strDropDown;
}
function getMonths()
{
    return  $monthsAssociativeOpposite = array(
        1 => "January",
        2 => "February",
        3 => "March",
        4 => "April",
        5 => "May",
        6 => "June",
        7 => "July",
        8 => "August",
        9 => "September",
        10 => "October",
        11 => "November",
        12 => "December"
    );
}
function displayDropDownArray(&$list, $defaultvalue)
{
    $strDropDown = null;
    foreach ($list as $key => $val) {
        $strDropDown = $strDropDown . '<option value="' . $key . '"';
        if ($defaultvalue != "" && $key == $defaultvalue) {
            $strDropDown = $strDropDown . ' selected="selected" ';
        }
        $strDropDown = $strDropDown . ">" . $val . "</option>";
    }
    return $strDropDown;
}
function extractColumns($multiArray, $columnNames)
{
    return array_map(function ($row) use ($columnNames) {
        $extractedRow = array();
        foreach ($columnNames as $columnName) {
            if (isset($row[$columnName])) {
                $extractedRow[$columnName] = $row[$columnName];
            }
        }
        return $extractedRow;
    }, $multiArray);
}
function create_pdf($html, $file_name, $download = FALSE, $style = ['mode' => 'utf-8', 'format' => 'A4-L', 'margin_bottom' => 1, 'margin_top' => 1, 'margin_left' => 1, 'margin_right' => 3])
{
    include_once APPPATH . '/third_party/dompdf/autoload.php';
    global $site_root;
    $path = $_SERVER['DOCUMENT_ROOT'] . $site_root . '/uploads/pdf/';
    $path_url = "https://" . $_SERVER['HTTP_HOST'] . $site_root . '/uploads/pdf/';
    $full_path = $path . "" . $file_name;
    $full_path_url = $path_url . "" . $file_name;
    $mpdf = new \Mpdf\Mpdf($style);
    //$mpdf->SetProtection(array(), '123', '123');
    $mpdf->WriteHTML($html);
    if ($download) {
        $mpdf->output($full_path, \Mpdf\Output\Destination::FILE);
        return   $full_path_url;
    } else {
        $mpdf->Output();
    }
}
function str_encode($data)
{
    if (!empty($data)) {
        $key = pseudo_random_string();
        #Remove the base64 encoding from our key
        $encryption_key = base64_decode($key);
        #Generate an initialization vector
        $iv = substr(hash('sha256', $key), 0, 16);
        //$iv = openssl_random_pseudo_bytes(openssl_cipher_iv_length('aes-256-cbc'));
        #Encrypt the data using AES 256 encryption in CBC mode using our encryption key and initialization vector.
        $encrypted = openssl_encrypt($data, 'aes-256-cbc', $encryption_key, 0, $iv);
        #The $iv is just as important as the key for decrypting, so save it with our encrypted data using a unique separator (::)
        return base64_encode($encrypted . '::' . $iv);
    }
}
function str_decode($data)
{
    if (!empty($data)) {
        $key = pseudo_random_string();
        #Remove the base64 encoding from our key
        $encryption_key = base64_decode($key);
        #To decrypt, split the encrypted data from our IV - our unique separator used was "::"
        list($encrypted_data, $iv) = explode('::', base64_decode($data), 2);
        return openssl_decrypt($encrypted_data, 'aes-256-cbc', $encryption_key, 0, $iv);
    }
}
function pseudo_random_string()
{
    return base64_encode("PUITC");
}
function convertNumberToWord($num = false)
{
    $num = str_replace(array(',', ' '), '', trim($num));
    if (!$num) {
        return false;
    }
    $num = (int) $num;
    $words = array();
    $list1 = array(
        '', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten', 'eleven',
        'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'
    );
    $list2 = array('', 'ten', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety', 'hundred');
    $list3 = array(
        '', 'thousand', 'million', 'billion', 'trillion', 'quadrillion', 'quintillion', 'sextillion', 'septillion',
        'octillion', 'nonillion', 'decillion', 'undecillion', 'duodecillion', 'tredecillion', 'quattuordecillion',
        'quindecillion', 'sexdecillion', 'septendecillion', 'octodecillion', 'novemdecillion', 'vigintillion'
    );
    $num_length = strlen($num);
    $levels = (int) (($num_length + 2) / 3);
    $max_length = $levels * 3;
    $num = substr('00' . $num, -$max_length);
    $num_levels = str_split($num, 3);
    for ($i = 0; $i < count($num_levels); $i++) {
        $levels--;
        $hundreds = (int) ($num_levels[$i] / 100);
        $hundreds = ($hundreds ? ' ' . $list1[$hundreds] . ' hundred' . ' ' : '');
        $tens = (int) ($num_levels[$i] % 100);
        $singles = '';
        if ($tens < 20) {
            $tens = ($tens ? ' ' . $list1[$tens] . ' ' : '');
        } else {
            $tens = (int)($tens / 10);
            $tens = ' ' . $list2[$tens] . ' ';
            $singles = (int) ($num_levels[$i] % 10);
            $singles = ' ' . $list1[$singles] . ' ';
        }
        $words[] = $hundreds . $tens . $singles . (($levels && (int) ($num_levels[$i])) ? ' ' . $list3[$levels] . ' ' : '');
    } //end for loop
    $commas = count($words);
    if ($commas > 1) {
        $commas = $commas - 1;
    }
    return implode(' ', $words);
}
function isActive($status)
{
    return  $status == 0 ? 'Disconnected' : 'Connected';
}
function sendRequest($url, $postData)
{
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($postData));
    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    if (curl_errno($ch)) {
        throw new Exception(curl_error($ch));
    }
    curl_close($ch);
    if ($httpCode == 200) {
        $json = json_decode($response, true);
        return $json;
    } else {
        throw new Exception("HTTP Error Code : {$httpCode}");
    }
}
function splitMessagesEqually($devices, $messages)
{
    if ($devices) {
        $data = array();
        $totalDevices = count($devices);
        $totalMessages = count($messages);
        $messagesPerDevice = ceil($totalMessages / $totalDevices); // Round up for cases with uneven distribution
        $chunkedMessages = array_chunk($messages, $messagesPerDevice);
        foreach ($devices as $index => $device) {
            $deviceMessages = isset($chunkedMessages[$index]) ? $chunkedMessages[$index] : [];
            $mymessage = array();
            foreach ($deviceMessages as $message) {
                if (isset($message['to'])) {
                    $message['to'] = str_replace("+", '', $message['to']);
                }
                array_push($mymessage, $message);
            }
            $data[$device['id']] = json_encode($mymessage);
        }
        return $data;
    }
}
function getMaxDateFromArray($datesArray)
{
    if (empty($datesArray)) {
        return null; // Return null for an empty array
    }
    // Convert array of date strings to timestamps
    $timestamps = array_map('strtotime', $datesArray);
    // Get the maximum timestamp
    $maxTimestamp = max($timestamps);
    // Convert the maximum timestamp back to a date string
    $maxDate = date('Y-m-d', $maxTimestamp);
    return $maxDate;
}
function getFeeAccount($id = 1)
{
    $account = "0380001" . $id;
    return $account;
}
function getFatherAccount($id = 1)
{
    $account = DIGIS_ACCOUNT . '02' . $id;
    return $account;
}
function getInstAccount($id = 1)
{
    $account = DIGIS_ACCOUNT . '03' . $id;
    return $account;
}

function getInstAccountBySchoolID($id = 1, $schoo_id = '')
{
    $account = COMPANY_ACCOUNT . "01" . $schoo_id . '03' . $id;
    return $account;
}
function getStaffPersonalAccount($staff_id, $id = 1)
{
    $account = DIGIS_ACCOUNT . '05' . '' . $staff_id . $id;
    return $account;
}
function getStaffAccount($id = 1)
{
    $account = DIGIS_ACCOUNT . '04' . $id;
    return $account;
}
function getIDbyAccount($id = 1)
{
    return str_replace(DIGIS_ACCOUNT, '', $id);
}
function getIDbyFatherAccount($id = 1)
{
    return str_replace(DIGIS_ACCOUNT . '02', '', $id);
}
function getIDbyInstAccount($id = 1)
{
    return str_replace(DIGIS_ACCOUNT . '03', '', $id);
}
function getFullURL($paramToRemove = null)
{
    $protocol = isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https://" : "http://";
    $host = $_SERVER['HTTP_HOST'];
    $uri = $_SERVER['REQUEST_URI'];
    $fullUrl = $protocol . $host . $uri;
    if ($paramToRemove !== null) {
        $urlParts = parse_url($fullUrl);
        parse_str($urlParts['query'], $queryParams);
        if (isset($queryParams[$paramToRemove])) {
            unset($queryParams[$paramToRemove]);
            $urlParts['query'] = http_build_query($queryParams);
            $fullUrl = $urlParts['path'] . '?' . $urlParts['query'];
        }
    }
    return $fullUrl;
}
function getMonthStartAndEndDates($givenDate)
{
    $dateTime = DateTime::createFromFormat('Y-m-d', date('Y-m-d', strtotime($givenDate)));
    // Get the year and month from the given date
    $year = $dateTime->format('Y');
    $month = $dateTime->format('m');
    // Calculate the first day of the month
    $firstDayOfMonth = new DateTime("$year-$month-01");
    // Calculate the last day of the month
    $lastDayOfMonth = new DateTime("$year-$month-" . $firstDayOfMonth->format('t'));
    // Format the results as strings
    $startOfMonth = $firstDayOfMonth->format('Y-m-d');
    $endOfMonth = $lastDayOfMonth->format('Y-m-d');
    // Return an associative array with the start and end dates
    return array(
        'start' => $startOfMonth,
        'end' => $endOfMonth
    );
}
function getLastMonthYear($currentMonth, $currentYear)
{
    if ($currentMonth == 1) {
        $lastMonth = 12;
        $lastYear = $currentYear - 1;
    } else {
        $lastMonth = $currentMonth - 1;
        $lastYear = $currentYear;
    }
    $lastMonthYear = date('Y-m', strtotime("$lastYear-$lastMonth-01"));
    return $lastMonthYear;
}
function getSchools()
{
    return db::getRecords("SELECT*  FROM `sch_settings`    ");
}
function getCurrentFeeGroupID()
{
    $result = array();
    $current_month = date('Y-m');
    $last_month = getLastMonthYear(date('m'), date('Y'));
    $current_voucher = "Fee Vouchers(" . $current_month . ")";
    $last_voucher = "Fee Vouchers(" . $last_month . ")";
    $schoo_id = db::getRecords("SELECT id  FROM `sch_settings`    ");
    foreach ($schoo_id as $key => $value) {
        $sid = $value['id'];
        $sql_a = "SELECT*  FROM fee_groups  where
            name='$last_voucher' and school_id=$sid ";
        $last_voucher_dt = db::getRecord($sql_a);
        $if_exist = db::getCell("SELECT id FROM fee_groups  where
           name='$current_voucher' and school_id=$sid ");
        if ($if_exist) {
            $result[$sid] = $if_exist;
        } else {
            if ($last_voucher_dt['due_date']) {
                // Create a DateTime object from the original date
                $date = new DateTime($last_voucher_dt['due_date']);
                // Add one month to the date
                $date->modify("+1 month");
                // Format the date as a string
                $newDate = $date->format("Y-m-d");
            } else {
                $newDate = "";
            }
            $obj['school_id'] = $sid;
            $obj['name'] = $current_voucher;
            $obj['is_active'] = 1;
            $obj['due_date'] = $newDate;
            $obj['fine'] = $last_voucher_dt['fine'];
            $obj['description'] = "Carry Forward From $last_voucher";
            $query = db::prepInsertQuery($obj, 'fee_groups');
            $id = db::insertRecord($query);
            $result[$sid] = $id;
        }
    }
    return  $result;
}
function getLastFeeGroupID()
{
    $result = array();
    $current_month = date('Y-m');
    $last_month = getLastMonthYear(date('m'), date('Y'));
    $current_voucher = "Fee Vouchers(" . $current_month . ")";
    $last_voucher = "Fee Vouchers(" . $last_month . ")";
    $schoo_id = db::getRecords("SELECT id  FROM `sch_settings`    ");
    foreach ($schoo_id as $key => $value) {
        $sid = $value['id'];
        $if_exist = db::getCell("SELECT id FROM fee_groups  where
           name='$last_voucher' and school_id=$sid ");
        if ($if_exist) {
            $result[$sid] = $if_exist;
        } else {
            $obj['school_id'] = $sid;
            $obj['name'] = $last_voucher;
            $obj['description'] = "Carry Forward From $last_voucher";
            $query = db::prepInsertQuery($obj, 'fee_groups');
            $id = db::insertRecord($query);
            $result[$sid] = $id;
        }
    }
    return  $result;
}
define('SECURE_SCHOOL_ID', str_encode(getSchoolID()));
define('UPLOAD_DIR', $_SERVER['DOCUMENT_ROOT'] . DIRECTORY_SEPARATOR . "uploads" . DIRECTORY_SEPARATOR);
define('UPLOAD_DIR_HTTPS', "https://" . $_SERVER['HTTP_HOST'] . DIRECTORY_SEPARATOR . "uploads" . DIRECTORY_SEPARATOR);
define('DIGIS_HTTP', "https://" . $_SERVER['HTTP_HOST'] . DIRECTORY_SEPARATOR . "uploads" . DIRECTORY_SEPARATOR . "digis" . DIRECTORY_SEPARATOR);
define('SCHOOL_CONTENTS', UPLOAD_DIR . 'school_content' . DIRECTORY_SEPARATOR);
define('STUDENT_PICS', UPLOAD_DIR . 'student_images' . DIRECTORY_SEPARATOR);
define('SCHOOL_CONTENTS_HTTPS', UPLOAD_DIR_HTTPS . 'school_content' . DIRECTORY_SEPARATOR);
define('ADMISSION_FORM', SCHOOL_CONTENTS . SECURE_SCHOOL_ID . "_admission_form.docx");
define('ADMISSION_FORM_HTTPS', SCHOOL_CONTENTS_HTTPS . SECURE_SCHOOL_ID . "_admission_form.docx");
define('SAMPLE_ADMISSION_FORM', SCHOOL_CONTENTS . "sample_admission_form.docx");
define('SAMPLE_ADMISSION_FORM_HTTPS', SCHOOL_CONTENTS_HTTPS . "sample_admission_form.docx");
define('STUDENT_ADMISSION_FORM', SCHOOL_CONTENTS . "admission_forms" . DIRECTORY_SEPARATOR);
define('STUDENT_FORM_HTTPS', SCHOOL_CONTENTS_HTTPS . "admission_forms" . DIRECTORY_SEPARATOR);
define('TPL_PATH', VIEWPATH . DIRECTORY_SEPARATOR . "tpl");
define('MLA_DOWNLOAD', "https://mla.isdigitalschools.com/uploads/");
function isAdmissionFom()
{
    if (file_exists(ADMISSION_FORM)) {
        return true;
    } else {
        return false;
    }
}
function KuickPayLog($school_id, $customer_id, $type, $bank_mnemonic, $auth_id = 0, $amount = 0)
{
    $obj['school_id'] = $school_id;
    $obj['student_id'] = $customer_id;
    $obj['bank_mnemonic'] = $bank_mnemonic;
    $obj['auth_id'] = $auth_id;
    $obj['amount'] = $amount;
    $query = db::prepInsertQuery($obj, "kuickpay_log");
    $insert = db::insertRecord($query);
}
function getSessionID($school_id = 23)
{
    $sql = "SELECT session_id FROM `sch_settings` where id='$school_id'";
    return db::getCell($sql);
}
function refresh_code()
{
    return PUITCVersion();
}
function getBalance($school_id = 23)
{
    $balance = getOpeningBalanceBYSchoolID($school_id, getInstAccountBySchoolID(27, $school_id));
    return $balance;
}
function getBankTitle($id = 23)
{
    $balance = db::getCell("SELECT name from banks where id=$id ");
    return $balance;
}
function nf($amount)
{
    if (!$amount) {
        $amount = 0;
    }
    $amount = (int)$amount;
    return  number_format($amount, 2, '.', ',');
}
function responseJson($message = "Success", $code = 200)
{
    return  json_encode(array('code' => $code, 'message' => $message));
}
function getSchoolInfo($data = '*')
{
    $sql = "SELECT $data  FROM `sch_settings` where id=" . getSchoolID();
    if ($data != '*') {
        return db::getRecord($sql)[$data];
    } else {
        return db::getRecord($sql);
    }
}
function getGrades()
{
    return  db::getRecords("SELECT * FROM `grades` where school_id='" . getSchoolID() . "' ");
}
function getExamName($exam_group_id = '')
{
    $school_id = getSchoolID();
    $records = db::getRecords("SELECT  name as exam_name from exams where exam_group_id='$exam_group_id' and school_id='$school_id' order by id DESC");
    return $records;
}
function pushData($name, $value)
{
    $_SESSION[$name] = $value;
}
function pullData($name, $clrear = true)
{
    $data = $_SESSION[$name] ?? '';
    if ($clrear) {
        unset($_SESSION[$name]);
    }
    return $data;
}
function getMyGrade($percentage)
{
    $grades = getGrades();
    foreach ($grades as $grade)
        if ($percentage >=  $grade['mark_upto']) {
            return $grade['name'];
        }
    return  "UN-Known";
}
function getExamRemarks($percentage)
{
    $grades = getGrades();
    foreach ($grades as $grade)
        if ($percentage >=  $grade['mark_upto']) {
            return $grade['description'];
        }
    return  "UN-Known";
}
function getActiveVersion()
{
    return db::getCell(" SELECT version from sch_settings where id='" . getSchoolID() . "' ");
}
function PUITCVersion()
{
    return db::getCell(" SELECT version from version order by id DESC limit 1");
}
function PUITCVersionDetails()
{
    return db::getRecord(" SELECT* from version order by id DESC limit 1");
}
function sendEmail($subject, $body, $to, $toname, $attach = array(), $from = "DIGIS BY PUITC")
{
    include_once $_SERVER['DOCUMENT_ROOT'] . "/application/third_party/phpMailer/autoload.php";
    //Import PHPMailer classes into the global namespace
    //These must be at the top of your script, not inside a function
    //Create an instance; passing `true` enables exceptions
    $mail = new PHPMailer\PHPMailer\PHPMailer(true);
    try {
        //Server settings
        $mail->SMTPDebug = false;                      //Enable verbose debug output
        $mail->isSMTP(true);                                            //Send using SMTP
        $mail->Host       = 'mail.isdigitalschools.com';                     //Set the SMTP server to send through
        $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
        $mail->Username   = 'info@isdigitalschools.com';                     //SMTP username
        $mail->Password   = 'Younis786@';                               //SMTP password
        $mail->SMTPSecure = PHPMailer\PHPMailer\PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
        $mail->Port       = 465;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`
        //Recipients
        $mail->setFrom('info@isdigitalschools.com', $from);
        $mail->addAddress("finance.panwarunion@gmail.com", $toname);     //Add a recipient
        if ($attach) {
            foreach ($attach as $key => $file) {
                $mail->AddAttachment($file);
            }
        }
        //Attachments
        // $mail->addAttachment('/var/tmp/file.tar.gz');         //Add attachments
        // $mail->addAttachment('/tmp/image.jpg', 'new.jpg');    //Optional name
        //Content
        $mail->isHTML(true);                                  //Set email format to HTML
        $mail->Subject = $subject;
        $mail->Body    = $body;
        $mail->send();
        return true;
    } catch (PHPMailer\PHPMailer\Exception $e) {
        return false;
    }
}
function getStaff($id, $col="*")
{
    $staff = db::getRecord("SELECT $col from staff where id='$id' and school_id=" . getSchoolID());
    return $staff;
}
function getClass($id)
{
    $class = db::getCell("SELECT class from classes where id='$id' and school_id=" . getSchoolID());
    return $class;
}
function getSession($id)
{
    $class = db::getCell("SELECT session from sessions where id='$id' and school_id=" . getSchoolID());
    return $class;
}
function getSecion($id)
{
    $sections = db::getCell("SELECT section from sections where id='$id' and school_id=" . getSchoolID());
    return $sections;
}
function getSubject($id)
{
    $sections = db::getCell("SELECT name from subjects where id='$id' and school_id=" . getSchoolID());
    return $sections;
}
function setProgress($done = 0, $total = 0)
{
    $progress = db::getRecord("SELECT job from progress where school_id=" . getSchoolID());
    $data['school_id'] = getSchoolID();
    $data['job'] = $total;
    $data['done'] = $done;
    if ($progress) {
        $query = db::prepUpdateQuery($data, "progress", 'school_id', getSchoolID());
    } else {
        $query = db::prepInsertQuery($data, "progress");
    }
    db::query($query);
    return getProgress();
}
function getProgress()
{
    $progress = db::getCell("SELECT round(done/job*100,2) as progress from progress where school_id=" . getSchoolID());
    return $progress;
}
function srcStudent($image = '')
{
    $src = base_url() . "uploads/student_images/";
    if (file_exists($src . $image)) {
        $src . $image;
    } else {
        $src = base_url() . "avatar.jpg";
    }
    $full_image = '<img id="imagePreview"  class="profile-user-img img-responsive img-circle" src="' . $src . '" alt="User profile picture" >';
    return $full_image;
}
function getFeeAccounts()
{
    $accounts = db::getRecords("SELECT * FROM `accounts` where school_id in(0," . getSchoolID() . ") and is_active=1");
    return $accounts;
}
function getSystemAccounts($privacy = false)
{
    if (!$privacy) {
        $accounts = db::getRecords("SELECT * FROM `accounts_head` where school_id in(0," . getSchoolID() . ")  and is_active=1 ");
    } else {
        $accounts = db::getRecords("SELECT * FROM `accounts_head` where school_id in(0," . getSchoolID() . ")  and id!=27 and is_active=1 ");
    }
    return $accounts;
}
function getSystemAccountsForFee()
{
    $accounts = db::getRecords("SELECT * FROM `accounts_head` where school_id in(0," . getSchoolID() . ") and is_active=1 and id!='27'  and category='Institute Revenue'");
    return $accounts;
}
function feeAccountID()
{
    $accounts = db::getCell("SELECT id  FROM `accounts_head` where  is_fee_account=1");
    return $accounts;
}
function getAccountTitle($id)
{
    $accounts = db::getCell("SELECT title  FROM `accounts_head` where  id=$id");
    return strtoupper($accounts);
}
function staffACTitle($id)
{
    $accounts = db::getCell("SELECT title  FROM `salary_components` where  id=$id");
    return strtoupper($accounts);
}
function transactionCR($from, $to, $amount, $narration = '', $student_id = '', $current_balance = '')
{
    //TR
    $current = db::getCell("SELECT closing_balance from transactions where receiver_account_id='$to' order by id DESC LIMIT 1");
    $closing = $current + $amount;
    $transaction = array(
        'school_id' => getSchoolID(),
        'user_id' => getAuthUserID(),
        'receiver_account_id' => $to,
        'student_id' => $student_id,
        'sender_account_id' => $from,
        'narration' => $narration,
        'opening_balance' => $current,
        'amount' => $amount,
        'type' => 1,
        'closing_balance' => $closing
    );
    $sql = db::prepInsertQuery($transaction, 'transactions');
    return  $trix = db::insertRecord($sql);
}
function transactionDR($from, $to, $amount, $narration = '', $student_id = '')
{
    //DR
    $sql = "SELECT closing_balance from transactions where receiver_account_id='$from' order by id DESC LIMIT 1";
    $current = db::getCell($sql);
    $closing = $current - $amount;
    $transaction = array(
        'school_id' => getSchoolID(),
        'user_id' => getAuthUserID(),
        'receiver_account_id' => $from,
        'student_id' => $student_id,
        'sender_account_id' => $to,
        'narration' => $narration,
        'opening_balance' => $current,
        'amount' => -$amount,
        'type' => 2,
        'closing_balance' => $closing
    );
    $sql = db::prepInsertQuery($transaction, 'transactions');
    return  $trix = db::insertRecord($sql);
}
function updateParentPayable($cnic)
{
    $fee = db::getCell("SELECT sum(fee) from students where father_cnic='$cnic' ");
    $admission_fee = db::getCell("SELECT sum(admission_fee) from students where father_cnic='$cnic' and admission_fee_paid='0' ");
    $payable = $fee + $admission_fee;
    db::query("UPDATE guardians set payable='$payable' where guardian_cnic='$cnic'  ");
}
function getParentBalance($cnic)
{
    return $fee = db::getCell("SELECT sum(balance) from guardians where guardian_cnic='$cnic' ");
}
function getAuthUserID()
{
    return $_SESSION['admin']['id'] ?? '';
}
function getFeeMonth()
{
    $fee = explode("-", $_REQUEST['fee_month']);
    return $fee[1];
}
function getFeeYear()
{
    $fee = explode("-", $_REQUEST['fee_month']);
    return $fee[0];
}
function getUnPaidMonths($student_id)
{
    $sql = "WITH RECURSIVE month_series AS (
        SELECT DATE_FORMAT(MIN(s.created_at), '%Y-%m-01') AS month_start
        FROM students s
        WHERE s.id = $student_id 
        UNION ALL
        SELECT DATE_FORMAT(DATE_ADD(month_start, INTERVAL 1 MONTH), '%Y-%m-01')
        FROM month_series
        WHERE month_start < CURDATE()
      )
      SELECT DATE_FORMAT(ms.month_start, '%Y-%m') AS missing_month
      FROM month_series ms
      LEFT JOIN transactions t ON DATE_FORMAT(t.trasaction_at, '%Y-%m-01') = ms.month_start
                               AND t.student_id = $student_id 
      WHERE t.id IS NULL
      GROUP BY DATE_FORMAT(ms.month_start, '%Y-%m');";
    $data = db::getRecords($sql);
    $unpaid = array_column($data, "missing_month");
    //   unset($unpaid[count($unpaid) -1]);
    return $unpaid;
}
function getUnPaidMonthsTillDate($student_id, $date)
{
    $sql = "WITH RECURSIVE month_series AS (
        SELECT DATE_FORMAT(MIN(s.created_at), '%Y-%m-01') AS month_start
        FROM students s
        WHERE s.id = $student_id 
        UNION ALL
        SELECT DATE_FORMAT(DATE_ADD(month_start, INTERVAL 1 MONTH), '%Y-%m-01')
        FROM month_series
        WHERE month_start < DATE_FORMAT('$date', '%Y-%m-01')
      )
      SELECT DATE_FORMAT(ms.month_start, '%Y-%m') AS missing_month
      FROM month_series ms
      LEFT JOIN transactions t ON DATE_FORMAT(t.trasaction_at, '%Y-%m-01') = ms.month_start
                               AND t.student_id = $student_id 
      WHERE t.id IS NULL
      GROUP BY DATE_FORMAT(ms.month_start, '%Y-%m');";
    $data = db::getRecords($sql);
    $unpaid = array_column($data, "missing_month");
    //   unset($unpaid[count($unpaid) -1]);
    return $unpaid;
}
function getVoucherHTML($student_id = 68, $voucher_title = "Student Copy", $fee_month = "2024-03", $show_header = true)
{
    $month = explode("-", $fee_month)[1];
    $year = explode("-", $fee_month)[0];
    $ac = getFeeAccount($student_id);
    $sql = "SELECT* FROM transactions where account= $ac and month='" . $month . "' and  year='" . $year . "'";
    $transaction = db::getRecord($sql);
    $data['student'] = db::getRecord("SELECT * FROM students s inner join student_session ss on ss.student_id=s.id where s.id=$student_id");
    $data['school'] = db::getRecord("SELECT * FROM sch_settings WHERE id=" . getSchoolID());
    $logo = base_url() . "uploads/school_content/logo/" . $data['school']['admin_logo'];
    $data['logo'] = $logo;
    $data['title'] = $voucher_title;
    $data['class'] = getClass($data['student']['class_id']);
    $data['section'] = getSecion($data['student']['section_id']);
    $data['session'] = getSession($data['student']['session_id']);
    $data['base_url'] = base_url();
    $data['fee_month'] = date('F Y', strtotime($fee_month));
    $data['fee_account'] = getFeeAccount($data['student']['id']);
    $data['fee_instruction'] = getfee_instruction();
    $data['show_header'] = $show_header;
    $data['print'] = date("d/m/Y H:i:s");
    $data['transaction'] = $transaction;
    $td = "";
    $sr = 1;
    foreach (getFeeAccounts() as $key => $fee) {
        $sql = "SELECT * FROM `students_fee` where accounts_id='{$fee['id']}' and student_id='$student_id' ";
        $fees = db::getRecord($sql);
        $td .= "<tr>
    <td>$sr</td>
    <td>{$fee['title']}</td>
   ";
        if (isset($fees['payable_amount'])) {
            $amount = nf($fees['payable_amount']);
            $td .= "<td>{$amount}</td>";
        } else {
            $amount = nf(0);
            $td .= "<td>$amount</td>";
        }
        $td .= "
    </tr>";
        $sr++;
    }
    $data['td'] = $td;
    return $html = loadTPL('fee_voucher.html', $data);
}
function getStudentCardHTML($student_id = 68, $voucher_title = "Student Copy", $fee_month = "2024-03", $show_header = true)
{
    $student=db::getRecord("SELECT *, s.id as student_id FROM students s inner join student_session ss on ss.student_id=s.id where s.id=$student_id");
    $data['qr_code']=str_encode($student['student_id']);
    $data['student'] = $student;    
    $data['school'] = db::getRecord("SELECT * FROM sch_settings WHERE id=" . getSchoolID());
    $logo = base_url() . "uploads/school_content/logo/" . $data['school']['admin_logo'];
    $stamp = base_url() . "uploads/school_content/admin_logo/" . $data['school']['stamp'];
    $data['logo'] = $logo;
    $data['stamp'] = $stamp;
    $data['title'] = $voucher_title;
    $data['class'] = getClass($data['student']['class_id']);
    $data['section'] = getSecion($data['student']['section_id']);
    $data['session'] = getSession($data['student']['session_id']);
    $data['base_url'] = base_url();
    $data['fee_month'] = date('F Y', strtotime($fee_month));
    $data['fee_account'] = getFeeAccount($data['student']['id']);
    $data['fee_instruction'] = getfee_instruction();
    $data['show_header'] = $show_header;
    $data['print'] = date("d/m/Y H:i:s");
    $td = "";
    $sr = 1;
  
     
  
    return $html = loadTPL('studentCard.html', $data);

}
function loadTPL($template_name = 'demo.tpl', $data)
{
    require_once(APPPATH . 'third_party/twig/autoload.php');
    $loader = new \Twig\Loader\FilesystemLoader(TPL_PATH);
    $twig = new \Twig\Environment($loader, [
        // Optional configuration options
    ]);
    try {
        $data = $twig->render($template_name, $data);
        return $data;
    } catch (Exception $e) {
        return $e->getMessage();
    }
}
function getfee_instruction()
{
    return db::getCell("select fee_instruction from sch_settings where id=" . getSchoolID());
}
function getFullUrlWithParams()
{
    $protocol = isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http";
    $host = $_SERVER['HTTP_HOST'];
    $path = $_SERVER['REQUEST_URI'];
    $query = $_SERVER['QUERY_STRING'];
    $fullUrl = $protocol . "://" . $host . $path;
    if (!empty($query)) {
        $fullUrl .= '?' . $query;
    }
    return $fullUrl;
}
function studentFullInfo($student_id)
{
    $sql = "SELECT s.* , s.id as student_id, g.id as father_id,g.guardian_name  as guardian_name , g.balance as father_balance FROM students s inner join guardians g on g.guardian_cnic=s.father_cnic where s.id=$student_id";
    return db::getRecord($sql);
}
function makeTransaction($account, $amount, $narration, $payment_from, $meta = array(), $date = '')
{
    $opening_balance = getOpeningBalance($account);
    if ($amount < 0) {
        $tr_type = 2;
    } else {
        $tr_type = 1;
    }
    if ($date) {
        $month = date('F', strtotime($date));
        $year = date('Y', strtotime($date));
    } else {
        $month = '';
        $year = '';
    }
    $closing = $opening_balance + $amount;
    $transaction = array(
        'school_id' => getSchoolID(),
        'user_id' => getAuthUserID(),
        'account' => $account,
        'student_id' => isset($meta['student_id']) ? $meta['student_id'] : '',
        'narration' => $narration,
        'opening_balance' => $opening_balance,
        'amount' => $amount,
        'type' => $tr_type,
        'closing_balance' => $closing,
        'meta' => json_encode($meta),
        'month' => $month,
        'year' => $year,
        'balance' => 0,
        'arrears' => 0,
        'payment_from' => $payment_from,
        'date' => empty($date) ? date('Y-m-d') : $date,
        'trasaction_at' => date('Y-m-d H:i:s')
    );
    $sql = db::prepInsertQuery($transaction, 'transactions');
    $id = db::insertRecord($sql);
    $up['narration'] = $narration . " Transaction ID: " . $id;
    $sql = db::prepUpdateQuery($up, "transactions", "id", $id);
    db::updateRecord($sql);
    // //sms 
    if (isset($meta['phone'])) {
        sendSMS($meta['phone'], $up['narration']);
    }
    return $id;
}
function makeTransactionBySchoolID($school_id, $account, $amount, $narration, $payment_from, $meta = array(), $date = '')
{
    $opening_balance = getOpeningBalanceBYSchoolID($school_id, $account);
    if ($amount < 0) {
        $tr_type = 2;
    } else {
        $tr_type = 1;
    }
    if ($date) {
        $month = date('F', strtotime($date));
        $year = date('Y', strtotime($date));
    } else {
        $month = '';
        $year = '';
    }
    $closing = $opening_balance + $amount;
    $transaction = array(
        'school_id' => $school_id,
        'user_id' => '',
        'account' => $account,
        'student_id' => isset($meta['student_id']) ? $meta['student_id'] : '',
        'narration' => $narration,
        'opening_balance' => $opening_balance,
        'amount' => $amount,
        'type' => $tr_type,
        'closing_balance' => $closing,
        'meta' => json_encode($meta),
        'month' => $month,
        'year' => $year,
        'balance' => 0,
        'arrears' => 0,
        'payment_from' => $payment_from,
        'date' => empty($date) ? date('Y-m-d') : $date,
        'trasaction_at' => date('Y-m-d H:i:s')
    );
    $sql = db::prepInsertQuery($transaction, 'transactions');
    $id = db::insertRecord($sql);
    $up['narration'] = $narration . " Transaction ID: " . $id;
    $sql = db::prepUpdateQuery($up, "transactions", "id", $id);
    db::updateRecord($sql);
    // //sms 
    if (isset($meta['phone'])) {
        sendSMS($meta['phone'], $up['narration']);
    }
    return $id;
}
function makeTransactionsSalary($account, $amount, $narration, $payment_from, $meta = array(), $month = '', $year = '')
{
    $opening_balance = getOpeningBalance($account);
    if ($amount < 0) {
        $tr_type = 2;
    } else {
        $tr_type = 1;
    }
    $closing = $opening_balance + $amount;
    $transaction = array(
        'school_id' => getSchoolID(),
        'user_id' => getAuthUserID(),
        'account' => $account,
        'narration' => $narration,
        'opening_balance' => $opening_balance,
        'amount' => $amount,
        'type' => $tr_type,
        'closing_balance' => $closing,
        'meta' => json_encode($meta),
        'month' => $month,
        'year' => $year,
        'balance' => 0,
        'arrears' => 0,
        'payment_from' => $payment_from,
        'date' => date('Y-m-d'),
        'trasaction_at' => date('Y-m-d H:i:s')
    );
    $sql = db::prepInsertQuery($transaction, 'transactions');
    $id = db::insertRecord($sql);
    $up['narration'] = $narration . " Transaction ID: " . $id;
    $sql = db::prepUpdateQuery($up, "transactions", "id", $id);
    db::updateRecord($sql);
    return $id;
}
function getOpeningBalance($account, $from = null, $to = null)
{
    if ($from && $to) {
        $sql = "SELECT closing_balance FROM transactions WHERE account='$account' AND date BETWEEN '$from' AND '$to' and school_id='" . getSchoolID() . "' ORDER BY id DESC LIMIT 1";
    } else {
        $sql = "SELECT closing_balance FROM transactions WHERE account='$account' and school_id='" . getSchoolID() . "' ORDER BY id DESC LIMIT 1";
    }
    $current = db::getCell($sql);
    if (!$current) {
        return nf(0);
    } else {
        return $current;
    }
}
function getOpeningBalanceBYSchoolID($schoo_id, $account, $from = '', $to = '')
{
    if ($from && $to) {
        $sql = "SELECT closing_balance FROM transactions WHERE account='$account' AND date BETWEEN '$from' AND '$to' and school_id='" . $schoo_id . "' ORDER BY id DESC LIMIT 1";
    } else {
        $sql = "SELECT closing_balance FROM transactions WHERE account='$account' and school_id='" . $schoo_id . "' ORDER BY id DESC LIMIT 1";
    }
    $current = db::getCell($sql);
    if (!$current) {
        return nf(0);
    } else {
        return $current;
    }
}
function getTotalCredit($account, $from = '', $to = '')
{
    $sql = "SELECT sum(amount) FROM transactions WHERE type=1  and   account='$account' AND date BETWEEN '$from' AND '$to' and school_id='" . getSchoolID() . "' ";
    $current = db::getCell($sql);
    if (!$current) {
        return nf(0);
    } else {
        return $current;
    }
}
function getTotalDebit($account, $from = '', $to = '')
{
    $sql = "SELECT sum(amount) FROM transactions WHERE type=2  and   account='$account' AND date BETWEEN '$from' AND '$to' and school_id='" . getSchoolID() . "' ";
    $current = db::getCell($sql);
    if (!$current) {
        return nf(0);
    } else {
        return $current;
    }
}
function getNoTrs($account, $from = '', $to = '')
{
    if ($from && $to) {
        $sql = "SELECT count(*) FROM transactions WHERE account='$account' AND date BETWEEN '$from' AND '$to' ";
    } else {
        $sql = "SELECT count(*)  FROM transactions WHERE account='$account' ";
    }
    $current = db::getCell($sql);
    if (!$current) {
        return nf(0);
    } else {
        return $current;
    }
}
function getSalaryHeads($type = 'CR')
{
    return db::getRecords("SELECT * FROM `salary_components` where type='$type' ");
}
function getStartEndDateOfMonth($month, $year)
{
    // Calculate the timestamp for the first day of the given month and year
    $startDate = strtotime("first day of $year-$month");
    // Calculate the timestamp for the last day of the given month and year
    $endDate = strtotime("last day of $year-$month");
    // Format the dates as 'Y-m-d'
    $startDate = date("Y-m-d", $startDate);
    $endDate = date("Y-m-d", $endDate);
    // Return an array containing the start date and end date
    return array($startDate, $endDate);
}
function isSalayPaid($staff_id, $month, $year)
{
    // Construct the SQL query to check if salary is paid
    $sql = "SELECT * FROM `transactions` WHERE account = '$staff_id' AND month = '$month' AND year = '$year' AND type = '1' and payment_from='SALARY';";
    // Assuming db::getRecords() is your method to execute the SQL query and fetch records
    return db::getRecord($sql);
}
function getCurrentMonthDateRange()
{
    // Get the first day of the current month
    $firstDayOfMonth = date('Y-m-01');
    // Get the last day of the current month
    $lastDayOfMonth = date('Y-m-t', strtotime($firstDayOfMonth));
    // Format the dates in the desired format
    $startDate = date('F j, Y', strtotime($firstDayOfMonth));
    $endDate = date('F j, Y', strtotime($lastDayOfMonth));
    // Combine into a formatted string
    $dateRange = $startDate . ' - ' . $endDate;
    return $dateRange;
}
function getStaffbyID($id)
{
    return db::getRecord("SELECT * FROM staff where id = '$id'");
}
function getSalaryID($title)
{
    return db::getRecord("SELECT* from salary_components where title = '$title'");
}
function VideoHelp()
{
    $link = $_SERVER['REQUEST_URI'];
    $sql = "SELECT link FROM `video_help` where link='$link' and is_activee='1'";
    return db::getCell($sql);
}
function sendSMS($phone, $message, $name = "", $whatsapp = true, $school_id = '')
{
    $url = "https://" . $_SERVER['HTTP_HOST'] . "/site/userlogin";
    $message = $message . "\nRegards:\n" . getSchoolInfo('name') . "\nPhone:" . getSchoolInfo('phone') . "\nEmail: " . getSchoolInfo('email') . "\n" . $url;
    if ($name) {
        $message = "Dear $name,\n" . $message;
    }
    if ($whatsapp) {
        sendWhatsapp($phone, $message);
    }
    $device = $_SESSION['DEVICES'];
    $SMS_APP_ID = $_SESSION['SMS_APP_ID'];
    if ($school_id) {
        $device = $_SESSION['DEVICES'];
        $SMS_APP_ID = $_SESSION['SMS_APP_ID'];
    }
    // URL and parameters
    $url = SMS_SERVER . '/services/send.php';
    $params = array(
        'key' => $SMS_APP_ID,
        'number' => $phone,
        'message' => $message,
        'devices' => $device,
        'type' => 'sms',
        'prioritize' => '1'
    );
    // Initialize cURL session
    $ch = curl_init();
    // Set the URL
    curl_setopt($ch, CURLOPT_URL, $url . '?' . http_build_query($params));
    // Set method to GET
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'GET');
    // Return the transfer as a string
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    // Execute the request and fetch response
    $response = curl_exec($ch);
    // Check for errors
    if (curl_errno($ch)) {
        echo 'Error: ' . curl_error($ch);
    }
    // Close cURL session
    curl_close($ch);
    // Output response
    $response;
}
function sendWhatsapp($phone = "923099914748", $text = "Ok", $return = true)
{
    $phone = str_replace("+", '', $phone);
    $messages[] = array('to' => $phone, "text" => $text);
    $wa = $_SESSION['wa_active_devices'];
    $delay_arr = $_SESSION['delay_arr'];
    if ($wa) {
        $split_at_devices = splitMessagesEqually($wa,  $messages);
        if ($split_at_devices) {
            foreach ($split_at_devices as $device_id => $message) {
                $session = $device_id . "_" . $_SERVER['HTTP_HOST'];
                $delay = $delay_arr[$device_id];
                $curl = curl_init();
                curl_setopt_array($curl, array(
                    CURLOPT_URL => WHATSAPP_SERVER . '/sendMessageBulk',
                    CURLOPT_RETURNTRANSFER => true,
                    CURLOPT_ENCODING => '',
                    CURLOPT_MAXREDIRS => 10,
                    CURLOPT_TIMEOUT => 0,
                    CURLOPT_FOLLOWLOCATION => true,
                    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                    CURLOPT_CUSTOMREQUEST => 'POST',
                    CURLOPT_POSTFIELDS => '{
                        "delay":"' . $delay . '",
                        "session":"' . $session . '",
                         "data":' . $message . '
                               }
                                     ',
                    CURLOPT_HTTPHEADER => array(
                        'Content-Type: application/json'
                    ),
                ));
                $response = curl_exec($curl);
                if (!$return) {
                    echo json_encode(array('type' => 'whatsapp', 'code' => 200, 'message' => "whatsapp Added in  Queued"));
                } else {
                    return true;
                }
                curl_close($curl);
            }
        } else {
            if (!$return) {
                echo json_encode(array('type' => 'whatsapp', 'code' => 200, 'message' => "whatsapp Added in  Queued"));
            } else {
                return true;
            }
        }
    }
}
function showErrors()
{
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);
}
function getAttendance($type)
{
    switch ($type) {
        case '1':
            $sql = "SELECT count(*) from student_attendences where date= '" . date('Y-m-d') . "' and attendence_type_id=1 and  school_id=" . getSchoolID();
            return db::getCell($sql);
            break;
        case '2':
            $sql = "SELECT count(*) from student_attendences where date= '" . date('Y-m-d') . "' and attendence_type_id=4 and  school_id=" . getSchoolID();
            return db::getCell($sql);
            break;
        case '3':
            $sql = "SELECT count(*) from student_attendences where date= '" . date('Y-m-d') . "' and attendence_type_id=3 and  school_id=" . getSchoolID();
            return db::getCell($sql);
            break;
    }
}
function getProfitLoss()
{
    $system = getSystemAccounts();
    $dropdown = [];
    $balance = 0;
    foreach ($system as $key => $sys_ac) {
        $dropdown[$sys_ac['category']][$sys_ac['id']]  = array('title' => $sys_ac['title'], 'is_cash_transfer' => $sys_ac['is_cash_transfer']);;
    }
    foreach ($dropdown as $group => $drp) {
        foreach ($drp as $key => $title) {
            $bal = getOpeningBalance(getInstAccount($key));
            $balance += $bal;
        }
    }
    return $balance;
}
function getAccountBalancebyCategory()
{
    $system = getSystemAccounts();
    $dropdown = [];
    $balance = [];
    foreach ($system as $key => $sys_ac) {
        $dropdown[$sys_ac['category']][$sys_ac['id']]  = array('title' => $sys_ac['title'], 'is_cash_transfer' => $sys_ac['is_cash_transfer']);;
    }
    foreach ($dropdown as $group => $drp) {
        foreach ($drp as $key => $title) {
            $bal = getOpeningBalance(getInstAccount($key));
            $balance[$group] += $bal;
        }
    }
    return $balance;
}
function checkAttendance($student_id, $type, $date)
{
    $student_session_id = studentSessionID($student_id);
    $sql = "SELECT* from student_attendences where student_session_id=$student_session_id and date='$date' ";
    $attendance = db::getRecord($sql);
    $db['student_session_id'] = $student_session_id;
    $db['school_id'] = getSchoolID();
    $db['attendence_type_id'] = $type;
    $db['date'] = $date;
    if ($attendance) {
        //insert
        $sql = db::prepUpdateQuery($db, "student_attendences", "id", $attendance['id']);
        db::updateRecord($sql);
        $typeMy = 1;
    } else {
        //update
        $sql = db::prepInsertQuery($db, "student_attendences");
        db::insertRecord($sql);
        $typeMy = 2;
    }
    return $sql;
}
function studentSessionID($student_id)
{
    return db::getCell("SELECT  ss.id  FROM `student_session` ss inner join students s on s.id=ss.student_id where student_id=$student_id;");
}
function get_dates_between($start_date, $end_date)
{
    $dates = array();
    $current_date = new DateTime($start_date);
    $end_date = new DateTime($end_date);
    while ($current_date <= $end_date) {
        $dates[] = $current_date->format('Y-m-d');
        $current_date->modify('+1 day');
    }
    return $dates;
}
function getAttendanceDay($student_id, $date)
{
    $student_session_id = studentSessionID($student_id);
    $sql = "SELECT ats.key_value from student_attendences sa inner join attendence_type ats on ats.id=sa.attendence_type_id  where student_session_id=$student_session_id and date='$date' ";
    return  $attendance = db::getCell($sql);
}
function SoftwareBilling($school_id)
{
    $school = db::getRecord("SELECT* from sch_settings s inner join plans p on p.id=s.plan where s.id= " . $school_id);
   if(isset($school['duration'])){
    switch ($school['duration']) {
        
        case 'Monthly':
         
            $startDate = date("Y-m-d");
            $endDate = date("Y-m-d", strtotime("+1 month", strtotime($startDate)));


            $sql="select* FROM sch_settings where   valid_till >= '$startDate' and id='".getSchoolID()."'  ";
     
            $tr=db::getRecord($sql);
            if(!$tr){
             db::query("update sch_settings set payment_issue=1 where id=$school_id");
            }
            $school['tr']=$tr;
            $school['from_extend']=$startDate;
            $school['to_extend']=$endDate;
             return $school;
 

           
            break;


            case 'Yearly':
            
             
                $startDate = date("Y-m-d");
                $endDate = date((date("Y")+1)."-m-d");
                
               
                 $sql="select* FROM sch_settings where  valid_till >= '$startDate' and  id='".getSchoolID()."'  ";
               
                 
           
                 $tr=db::getRecord($sql);
               if(!$tr){
                db::query("update sch_settings set payment_issue=1 where id=$school_id");
               }
               $school['tr']=$tr;
               $school['from_extend']=$startDate;
               $school['to_extend']=$endDate;
             
                return $school;


               ;



            


                break;
        default:
            # code...
            break;
    }

}



  
}

