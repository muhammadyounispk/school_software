<?php
/**
 * CodeIgniter
 *
 * An open source application development framework for PHP
 *
 * This content is released under the MIT License (MIT)
 *
 * Copyright (c) 2014 - 2017, British Columbia Institute of Technology
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 * @package	CodeIgniter
 * @author	EllisLab Dev Team
 * @copyright	Copyright (c) 2008 - 2014, EllisLab, Inc. (https://ellislab.com/)
 * @copyright	Copyright (c) 2014 - 2017, British Columbia Institute of Technology (http://bcit.ca/)
 * @license	http://opensource.org/licenses/MIT	MIT License
 * @link	https://codeigniter.com
 * @since	Version 1.0.0
 * @filesource
 */
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Application Controller Class
 *
 * This class object is the super class that every library in
 * CodeIgniter will be assigned to.
 *
 * @package		CodeIgniter
 * @subpackage	Libraries
 * @category	Libraries
 * @author		EllisLab Dev Team
 * @link		https://codeigniter.com/user_guide/general/controllers.html
 */
class CI_Controller {

	/**
	 * Reference to the CI singleton
	 *
	 * @var	object
	 */
	private static $instance;

	/**
	 * Class constructor
	 *
	 * @return	void
	 */
	public function __construct()
	{
		self::$instance =& $this;

		// Assign all the class objects that were instantiated by the
		// bootstrap file (CodeIgniter.php) to local class variables
		// so that CI can run as one big super object.
		foreach (is_loaded() as $var => $class)
		{
			$this->$var =& load_class($class);
		}

		$this->load =& load_class('Loader', 'core');
		$this->load->initialize();
		log_message('info', 'Controller Class Initialized');
	}

	// --------------------------------------------------------------------

	/**
	 * Get the CI singleton
	 *
	 * @static
	 * @return	object
	 */
	public static function &get_instance()
	{
		return self::$instance;
	}

	

}




/*
  Generic functions for DB operations
 */

 class db {

    public static function open() { // opens the db connection. Specify different databases for local and live server and it will automatically select the correct one
      
        $db = mysqli_connect(DB_HOST, DB_USER, DB_PASS, DB_NAME);


        if ($db->connect_errno > 0) {
            echo "Failed to connect to MySQL: " . $db->connect_error;
        }
        return $db;
    }

    public static function close(&$db) {
        $db->close();
    }

    public static function getRecords($query, $cursor = NULL, $pageSize = NULL) {  // Gets multiple records and returns associative array
        $db = db::open();
        if (!is_null($cursor) && !is_null($pageSize)) {
            $query .= " LIMIT " . $cursor . ", " . $pageSize;
        }
        $result = $db->query($query);
        if (!$result) {
            die('There was an error running the query [' . $db->error . ']');
        }
        if ($result->num_rows > 0) {
            $i = 0;
            while ($row = $result->fetch_assoc()) {
                $recordset[$i] = $row;
                $i++;
            }
        } else {
            $recordset = false;
        }
        db::close($db);
        return ($recordset);
    }

    public static function getRecord($query) { // Gets single record and returns single associative array
        $db = db::open();
        $result = $db->query($query);
        if ($result->num_rows > 0) {
            $recordset = $result->fetch_assoc();
        } else {
            $recordset = false;
        }
        db::close($db);
        return ($recordset);
    }

    public static function getCell($query) { // Returns single value
        $db = db::open();
        $result = $db->query($query);
        if ($result->num_rows > 0) {
            $cell = $result->fetch_array();
            return $cell[0];
        } else {
            $cell = false;
        }
        return $cell;
    }

    public static function updateRecord($query) {  // Gets a formatted query and returns the true/false
        $db = db::open();
        $result = $db->query($query);
        db::close($db);
        return ($result);
    }

    public static function insertRecord($query) { // Gets a formatted query to insert a row and returns the ``I``D of last added record
        $db = db::open();
        $db->query($query);
        $result = $db->insert_id;
       
        if($result){
            db::close($db);
            return ($result);
        }else{
            echo DB_NAME." => <b><font color='red'>".$db->error;
            db::close($db);
            die;
        }

       
    }

    public static function deleteRecord($table, $pk, $id) { // Gets the Id of row to be deleted and table name
        $db = db::open();
        $query = "delete from " . $table . " where " . $pk . "=" . $id;
        $result = $db->query($query);
        db::close($db);
        return ($result);
    }

    public static function deleteRecordarry($table, $pk, $id) { // Gets the Id of row to be deleted and table name
        $db = db::open();
        $query = "delete from " . $table . " where " . $pk . " in(" . $id . ")";
        $result = $db->query($query);
        db::close($db);
        return ($result);
    }

    public static function query($query) {  // Executes any query
        $db = db::open();
        $result = $db->query($query);
        db::close($db);
        return ($result);
    }

    public static function prepUpdateQuery(&$obj, $table, $pk, $id) { // Gets the associative array of field-name=>value, table name and id and returns the formatted update query
        $db = db::open();
        $query = "update " . $table . " set ";
        $total = count($obj);
        $current = 1;
        foreach ($obj as $key => $value) {
            $query = $query . " `" . $key . "`='" . $db->real_escape_string($value) . "' ";
            if ($current < $total) {
                $query = $query . ", ";
            }
            $current++;
        }
        $query = $query . " where " . $pk . "=" . $id;
        db::close($db);
        return $query;
    }

    public static function prepInsertQuery(&$obj, $table) { // Gets the associative array of field-name=>value and table name and returns the formatted insert query
        $db = db::open();
        $values= $fields =null;
        $query = "Insert into " . $table;
        $total = count($obj);
        $current = 1;
        foreach ($obj as $key => $value) {
            $fields = $fields . " `" . $key . "`";
            $values = $values . " '" . $db->real_escape_string($value) . "'";
            if ($current < $total) {
                $fields = $fields . ", ";
                $values = $values . ", ";
            }
            $current++;
        }
        $query = $query . " (" . $fields . ") VALUES (" . $values . ")";
        db::close($db);
        return $query;
    }

    public static function markAsRead($table, $pk, $id, $field) {
        $db = db::open();
        $query = "update " . $table . " set " . $field . "=1 where " . $pk . "=" . $id;
        $result = $db->query($query);
        db::close($db);
        return ($result);
    }
    
     public static function escape_String($string) {
        $db = db::open();
      $data=$db -> real_escape_string($string);
      return $data;
    }
    
     public static function displayErrors() {
        $db = db::open();
      $data=$db ->error;
      return $data;
    }

    
    
}



