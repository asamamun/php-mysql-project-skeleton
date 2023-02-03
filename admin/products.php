<?php require __DIR__ . '/../vendor/autoload.php'; ?>
<?php
$db = new MysqliDb();
//https://github.com/ThingEngineer/PHP-MySQLi-Database-Class#select-query
$products = $db->get("products");
foreach($products as $p){
    echo "<h3>".$p['name']."</h3>";
}
$db->disconnect();
?>