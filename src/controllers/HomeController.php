<?php
namespace App\Controllers;

use App\Classes\DB;

class HomeController extends BaseController {
    public function index() {
        $db = DB::getInstance();
        $users = $db->select("SELECT * FROM users LIMIT 10");
        
        $this->render('home/index', [
            'title' => 'Home Page',
            'users' => $users
        ]);
    }
/*     public function hi() {
        // $db = DB::getInstance();
        // $users = $db->select("SELECT * FROM users LIMIT 10");
        
        $this->render('home/hi', [
            'title' => 'hi from genuity',
            // 'users' => $users
        ]);
    } */
    public function hi() {
        // echo "Hi there!";
        // Or if you're using your render method:
        $this->render('home/hi', ['title' => 'IDB: Hi Page']);
    }
}