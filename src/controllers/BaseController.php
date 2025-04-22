<?php
namespace App\Controllers;

abstract class BaseController {
    protected function render($view, $data = []) {
        // Extract data to make variables available in the view
        extract($data);
        
        // Start output buffering
        ob_start();
        
        // Include the view file
        $viewPath = dirname(dirname(__DIR__)) . '/views/' . $view . '.php';
        if (file_exists($viewPath)) {
            include $viewPath;
        } else {
            throw new \Exception("View {$view} not found");
        }
        
        // Get the contents of the buffer
        $content = ob_get_clean();
        
        // Output the content
        echo $content;
    }
}