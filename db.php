<?php

// $data=db::query("select concat('UPDATE   ',table_name,' SET school_id=2 ;') as query
// from information_schema.tables
// where table_schema = 'isdigita_school' and table_type = 'base table';");


$data=db::query("select concat(' CREATE INDEX school_id  ON   ',table_name,' (school_id);') as query
from information_schema.tables
where table_schema = 'isdigita_school' and table_type = 'base table';");


// $data=db::query("select concat(' ALTER TABLE   ',table_name,' CHANGE COLUMN school_id school_id int(200);') as query
// from information_schema.tables
// where table_schema = 'isdigita_school' and table_type = 'base table';");

foreach($data as $val){
echo $val['query']."<br>";
}

/*
  Generic functions for DB operations
 */

class db {

    public static function open() { // opens the db connection. Specify different databases for local and live server and it will automatically select the correct one
        include "config/database.php";
        
           
       
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
        db::close($db);
      return ($result);
       
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

 
?>