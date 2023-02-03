<?php require __DIR__ . '/../vendor/autoload.php'; ?>
<?php
$db = new MysqliDb();
$products = $db->get("products");
foreach($products as $p){
    echo "<h3>".$p['name']."</h3>";
}
$db->disconnect();
?>