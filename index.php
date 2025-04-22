<?php
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
$router->addRoute('GET', '/hi', 'HomeController@hi');

// Add more routes...

// For debugging, show registered routes
var_dump($router->getRoutes());

// Dispatch
$router->dispatch($requestUri, $_SERVER['REQUEST_METHOD']);