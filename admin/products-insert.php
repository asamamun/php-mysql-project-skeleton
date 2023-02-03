<?php require __DIR__ . '/../vendor/autoload.php'; ?>
<?php
$db = new MysqliDb();
$data = [
    'category_id'=>'5',
    'subcategory_id'=>'6',
    'name'=>'testing db class',
    'description'=>'testing db class insert',
    'sku'=>'dbclass01',
    'images'=>'imagenameee.png',
    'price'=>'1000',
    'quantity'=>'100',
    'discount'=>'5',
    'hot'=>'1',
];
$id = $db->insert ('products', $data);
echo "record added. ID: " . $id;