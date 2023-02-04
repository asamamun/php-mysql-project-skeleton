<?php
if (!function_exists('settings')) {
    function settings()
    {
       $root = "http://localhost/Round53/php/LionsCommerce/"; 
        return [
            'companyname'=> 'Gold Digger Enterprise',
            'logo'=>$root."admin/assets/img/logo.svg",
            'homepage'=> $root,
            'adminpage'=>$root.'admin/',
            'hostname'=> 'localhost',
            'user'=> 'root',
            'password'=> '',
            'database'=> 'lioncommerce'
        ];
    }
}
if (!function_exists('testfunc')) {
    function testfunc()
    {
        return "<h3>testing common functions</h3>";
    }
}
