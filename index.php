<?php
require __DIR__ . '/vendor/autoload.php';
use App\User;
use App\model\Category;
use App\db;
$conn = db::connect();
$page = "Home";
?>
<?php require __DIR__ . '/components/header.php';?>

</head>
<body>
    <div class="container">
<?php require __DIR__ . '/components/menubar.php';?>
<?php
echo testfunc();
var_dump(settings());
$u = new User();
echo $u->testme();
?>
<?php
$r = $conn->query("select * from users");
echo "<h1>Total Users: ".$r->num_rows."</h1>";
?>
<hr>
<?php
echo Category::testing();
?>
</div>
<script>
    
</script>

<?php require __DIR__ . '/components/footer.php'; $conn->close()?>
