<?php
/*
require_once __DIR__ . '/vendor/autoload.php';

// For debugging
ini_set('display_errors', 1);
error_reporting(E_ALL);

$basePath = '/ROUND64/PHP/php-mysql-project-skeleton/';
// Capture request URI
$requestUri = $_SERVER['REQUEST_URI'];
echo "Request URI: " . $requestUri . "<br>";
// Remove base path from request URI
if (!empty($basePath) && strpos($requestUri, $basePath) === 0) {
    $requestUri = substr($requestUri, strlen($basePath));
}

// Normalize the path
$requestUri = '/' . trim($requestUri, '/');

// Your router code here...
$router = App\Classes\Router::getInstance();

// Define routes - ensure you have a route for the home page
$router->addRoute('GET', '/', 'HomeController@index');
// $router->addRoute('GET', '/hi', 'HomeController@hi');
$router->addRoute('GET', '/hi', 'HomeController@hi');

// Add more routes...

// For debugging, show registered routes
var_dump($router->getRoutes());

// Dispatch
$router->dispatch($requestUri, $_SERVER['REQUEST_METHOD']);
*/

require_once __DIR__ . '/vendor/autoload.php';

// Initialize error handling
ini_set('display_errors', 1);
error_reporting(E_ALL);

// Start session if needed
session_start();

// Get the request URI
$requestUri = $_SERVER['REQUEST_URI']; 
echo "Original Request URI: " . $requestUri . "<br>";

// Define your base path (if your app is in a subdirectory)
$basePath = '/ROUND64/PHP/php-mysql-project-skeleton/'; // Change this if your app is in a subdirectory

// Remove base path from URI if needed
if (!empty($basePath) && strpos($requestUri, $basePath) === 0) {
    $requestUri = substr($requestUri, strlen($basePath));
}

// Remove query string if present
if (($pos = strpos($requestUri, '?')) !== false) {
    $requestUri = substr($requestUri, 0, $pos);
}

// Normalize the path (ensure it starts with /)
$requestUri = '/' . trim($requestUri, '/');
echo "Processed Request URI: " . $requestUri . "<br>";

// Initialize router
$router = App\Classes\Router::getInstance();

// Define routes
$router->addRoute('GET', '/', 'HomeController@index');
$router->addRoute('GET', '/hi', 'HomeController@hi'); // Make sure this route is defined

// Add debugging to see registered routes
if (method_exists($router, 'getRoutes')) {
    echo "<pre>Registered Routes: ";
    print_r($router->getRoutes());
    echo "</pre>";
}

// Dispatch the request
$router->dispatch($requestUri, $_SERVER['REQUEST_METHOD']);