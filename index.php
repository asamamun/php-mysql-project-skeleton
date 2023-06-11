<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
require __DIR__ . '/vendor/autoload.php';
use App\User;
use App\model\Category;
use App\db;
// $conn = db::connect();
$db = new MysqliDb ();
$page = "Home";
?>
<?php require __DIR__ . '/components/header.php';?>

</head>
<body>
    <div class="container">
<?php require __DIR__ . '/components/menubar.php';?>
<?php
echo testfunc();
// var_dump(settings());
$u = new User();
echo $u->testme();
?>
<?php
// $r = $conn->query("select * from users");
$users = $db->get('users');
// var_dump($users);
foreach($users as $user){
    echo $user['name']."(".$user['email'].")<br>";
}
echo "<h1>Total Users: ".count($users)."</h1>";
?>
<hr>
<?php
echo Category::testing();
?>
<hr>
<?php
echo config('round55.b');
?>
</div>
<script>
    
</script>

<?php 
require __DIR__ . '/components/footer.php'; 
$db->disconnect();
?>
