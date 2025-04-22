<?php
// src/classes/DB.php
namespace App\Classes;

class DB {
    private static $instance = null;
    private $conn;
    private $config;
    
    // Private constructor
    private function __construct($configName = 'idb') {
        // Get config instance and load database config
        $this->config = Config::getInstance();
        $this->config->loadConfig($configName);
        
        // Create database connection
        $this->conn = new \PDO(
            "mysql:host={$this->config->get('DB_HOST')};dbname={$this->config->get('DB_NAME')};charset=utf8mb4",
            $this->config->get('DB_USER'),
            $this->config->get('DB_PASS'),
            [\PDO::ATTR_ERRMODE => \PDO::ERRMODE_EXCEPTION]
        );
    }
    
    // Get singleton instance with optional config name
    public static function getInstance($configName = 'idb') {
        // Create a unique key for each config to allow multiple database connections
        $key = $configName;
        
        if (!isset(self::$instance[$key])) {
            self::$instance[$key] = new self($configName);
        }
        
        return self::$instance[$key];
    }
    
    // Prevent cloning
    private function __clone() {}
    
    // Prevent unserialization
    public function __wakeup() {
        throw new \Exception("Cannot unserialize singleton");
    }
    
    // Get PDO connection
    public function getConnection() {
        return $this->conn;
    }
    
    // Execute a query with parameters
    public function query($sql, $params = []) {
        $stmt = $this->conn->prepare($sql);
        $stmt->execute($params);
        return $stmt;
    }
    
    // Select multiple rows
    public function select($sql, $params = []) {
        return $this->query($sql, $params)->fetchAll(\PDO::FETCH_ASSOC);
    }
    
    // Select a single row
    public function selectOne($sql, $params = []) {
        return $this->query($sql, $params)->fetch(\PDO::FETCH_ASSOC);
    }
    
    // Insert data and return last insert ID
    public function insert($table, $data) {
        $columns = implode(', ', array_keys($data));
        $placeholders = implode(', ', array_fill(0, count($data), '?'));
        
        $sql = "INSERT INTO {$table} ({$columns}) VALUES ({$placeholders})";
        $this->query($sql, array_values($data));
        
        return $this->conn->lastInsertId();
    }
    
    // Update data and return affected rows
    public function update($table, $data, $where, $whereParams = []) {
        $set = [];
        foreach (array_keys($data) as $column) {
            $set[] = "{$column} = ?";
        }
        $setClause = implode(', ', $set);
        
        $sql = "UPDATE {$table} SET {$setClause} WHERE {$where}";
        $params = array_merge(array_values($data), $whereParams);
        
        return $this->query($sql, $params)->rowCount();
    }
    
    // Delete data and return affected rows
    public function delete($table, $where, $params = []) {
        $sql = "DELETE FROM {$table} WHERE {$where}";
        return $this->query($sql, $params)->rowCount();
    }
}