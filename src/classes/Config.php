<?php
// src/classes/Config.php
namespace App\Classes;

class Config {
    private static $instance = null;
    private $config = [];
    
    // Private constructor
    private function __construct() {
        // Load base settings
        $settingsFile = dirname(__DIR__) . '/settings.php';
        if (file_exists($settingsFile)) {
            $this->config = require $settingsFile;
        }
        else{
            die("Settings file not found");
        }
    }
    
    // Get singleton instance
    public static function getInstance() {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }
    
    // Prevent cloning
    private function __clone() {}
    
    // Prevent unserialization
    public function __wakeup() {
        throw new \Exception("Cannot unserialize singleton");
    }
    
    // Load a specific config file
    public function loadConfig($configName) {
        $configFile = dirname(dirname(__DIR__)) . '/config/' . $configName . '.php';
        if (file_exists($configFile)) {
            $configData = require $configFile;
            if (is_array($configData)) {
                $this->config = array_merge($this->config, $configData);
            }
        }
        return $this;
    }
    
    public function get($key, $default = null) {
        return $this->config[$key] ?? $default;
    }
    
    public function set($key, $value) {
        $this->config[$key] = $value;
        return $this;
    }
    
    public function getAll() {
        return $this->config;
    }
}