<?php
namespace App\Classes;

class Router {
    private static $instance = null;
    private $routes = [];
    
    private function __construct() {
        // Initialize routes array
        $this->routes = [
            'GET' => [],
            'POST' => [],
            'PUT' => [],
            'DELETE' => []
        ];
    }
    
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
    
    public function addRoute($method, $pattern, $handler) {
        $this->routes[$method][$pattern] = $handler;
        return $this;
    }

    public function getRoutes() {
        return $this->routes;
    }
    
/*     public function dispatch($uri, $method) {
        // Check for direct match
        if (isset($this->routes[$method][$uri])) {
            return $this->executeHandler($this->routes[$method][$uri]);
        }
        
        // Check for pattern matches
        foreach ($this->routes[$method] as $pattern => $handler) {
            // Convert route patterns to regex
            $pattern = preg_replace('/\/{([^\/]+)}/', '/(?P<$1>[^/]+)', $pattern);
            $pattern = "#^{$pattern}$#";
            
            if (preg_match($pattern, $uri, $matches)) {
                // Filter out numeric keys
                $params = array_filter($matches, function($key) {
                    return !is_numeric($key);
                }, ARRAY_FILTER_USE_KEY);
                
                return $this->executeHandler($handler, $params);
            }
        }
        
        // No route found
        header("HTTP/1.0 404 Not Found");
        echo '404 Not Found';
        exit;
    } */
    public function dispatch($uri, $method) {
        echo "Dispatching URI: {$uri} with method: {$method}<br>";
        
        // Check for direct match
        if (isset($this->routes[$method][$uri])) {
            echo "Found exact route match!<br>";
            return $this->executeHandler($this->routes[$method][$uri]);
        }
        
        // Check for pattern matches with parameters
        foreach ($this->routes[$method] as $pattern => $handler) {
            // Convert route patterns to regex for parameter extraction
            $regexPattern = preg_replace('/\/{([^\/]+)}/', '/(?P<$1>[^/]+)', $pattern);
            $regexPattern = "#^{$regexPattern}$#";
            
            echo "Checking pattern {$pattern} with regex {$regexPattern}<br>";
            
            if (preg_match($regexPattern, $uri, $matches)) {
                echo "Found pattern match!<br>";
                // Filter out numeric keys
                $params = array_filter($matches, function($key) {
                    return !is_numeric($key);
                }, ARRAY_FILTER_USE_KEY);
                
                return $this->executeHandler($handler, $params);
            }
        }
        
        // No route found
        echo "No route match found for {$uri}<br>";
        header("HTTP/1.0 404 Not Found");
        echo '404 Not Found';
        exit;
    }
    
    private function executeHandler($handler, $params = []) {
        // Handler can be a closure
        if ($handler instanceof \Closure) {
            return call_user_func_array($handler, $params);
        }
        
        // Handler can be "Controller@method"
        if (is_string($handler) && strpos($handler, '@') !== false) {
            list($controller, $method) = explode('@', $handler);
            $controllerClass = "\\App\\Controllers\\{$controller}";
            
            if (!class_exists($controllerClass)) {
                throw new \Exception("Controller {$controllerClass} not found");
            }
            
            $controllerInstance = new $controllerClass();
            
            if (!method_exists($controllerInstance, $method)) {
                throw new \Exception("Method {$method} not found in controller {$controllerClass}");
            }
            
            return call_user_func_array([$controllerInstance, $method], $params);
        }
        
        throw new \Exception("Invalid route handler");
    }

}