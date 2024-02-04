<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
require __DIR__ . '/../vendor/autoload.php';
use App\auth\Admin;
if(!Admin::Check()){
    header('HTTP/1.1 503 Service Unavailable');
    exit;
}
$db = new MysqliDb ();

if(isset($_POST['username'])){
    $idtoupdate = $_POST['id'];
    $username = $_POST['username'];
    $pass1 = $_POST['pass1'];
    $pass2 = $_POST['pass2'];
    $role = $_POST['role'];
    if($pass1 == $pass2){
        $pass = password_hash($pass1,PASSWORD_DEFAULT);
        $data = [
            'username' => $username,
            'password' => $pass,
            'role' => $role
        ];
        $db->where ('id', $idtoupdate);
        if ($db->update ('users', $data))
            //echo $db->count . ' records were updated';
            $message = "User Updated successfully";
        else
        $message = "Something went wrong, ".$db->getLastError();
            
    }


}

if(isset($_GET['id'])){
    
    // $id = $conn->escape_string($_GET['id']);
    $id = filter_var($_GET['id'],FILTER_VALIDATE_INT);
    if($id){
        // $selectQuery = "select id,username,create_at from users where id=$id limit 1";
        // $result = $conn->query($selectQuery);
        // $row = $result->fetch_assoc();
        $db->where ('id', $id);
        $row = $db->getOne('users');
// var_dump($row);
    }
    
}
    ?>

<?php require __DIR__.'/components/header.php'; ?>
    </head>
    <body class="sb-nav-fixed">
    <?php require __DIR__.'/components/navbar.php'; ?>
        <div id="layoutSidenav">
        <?php require __DIR__.'/components/sidebar.php'; ?>
            <div id="layoutSidenav_content">
                <main>
                    <!-- changed content -->
                    <?php
        if(isset($message)) echo $message;
        ?>
        <hr>
        <form action="" method="post">
            <input type="hidden" name="id" value="<?= $row['id'] ?>">
            <input type="text" name="username" value="<?= $row['name'] ?>" required>
            <input type="email" name="email" value="<?= $row['email'] ?>" required>
            <input type="password" name="pass1" id="">
            <input type="password" name="pass2" id="">
            <select name="role" id="">
                <option value="1" <?= ($row['role'] =="1")?"selected":"" ?>>User</option>
                <option value="2" <?= ($row['role'] =="2")?"selected":"" ?>>Admin</option>
            </select>
            <input type="submit" value="Update">
        </form>
                    <!-- changed content  ends-->
                </main>
<!-- footer -->
<?php require __DIR__.'/components/footer.php'; ?>
            </div>
        </div>
        <script src="<?= settings()['adminpage'] ?>assets/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="<?= settings()['adminpage'] ?>assets/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="<?= settings()['adminpage'] ?>assets/demo/chart-area-demo.js"></script>
        <script src="<?= settings()['adminpage'] ?>assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="<?= settings()['adminpage'] ?>assets/js/datatables-simple-demo.js"></script>
    </body>
</html>
    
        
    