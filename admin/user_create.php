<?php
if(isset($_POST['username'])){
    require "conn.php";
    $user = $conn->escape_string($_POST['username']);
    $pass1 = $_POST['pass1'];
    $pass2 = $_POST['pass2'];
    if($pass1 === $pass2){
        $pass = password_hash($pass1,PASSWORD_DEFAULT);
        $insert_query = "INSERT INTO users values(null,'{$user}','{$pass}',CURRENT_TIMESTAMP)";
        $conn->query($insert_query);
        if($conn->affected_rows){
            $message = "User '{$user}' registered successfully. Id: {$conn->insert_id}";
        }
    }

}
/* $user = "newuser".time().rand(1,100);
$pass = password_hash("12345",PASSWORD_DEFAULT);
$insert_query = "INSERT INTO users values(null,'{$user}','{$pass}',CURRENT_TIMESTAMP)";
$conn->query($insert_query);
echo $conn->affected_rows;//will return total affected rows//works with insert,update and delete. NOT with select statement
echo "<br>current user ({$user}) id:" . $conn->insert_id; */
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

</head>
<body>
    <div class="container">
    <h3>Registration Form</h3>
    <hr>
    <section class="vh-100" style="background-color: #eee;">
  <div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-lg-12 col-xl-11">
        <div class="card text-black" style="border-radius: 25px;">
          <div class="card-body p-md-5">
            <div class="row justify-content-center">
              <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign up</p>
                <?php
    if(isset($message)){
        ?>
<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Success!</strong> <?= $message; ?>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
        <?php
    }
                ?>

                <form class="mx-1 mx-md-4" method="post" action="<?= $_SERVER['PHP_SELF'] ?>">

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="text" name="username" id="form3Example1c" class="form-control" required placeholder="Your Name" />
                      <label class="form-label" for="form3Example1c">Your Name</label>
                    </div>
                  </div>

<!--                   <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="email" id="form3Example3c" class="form-control" />
                      <label class="form-label" for="form3Example3c">Your Email</label>
                    </div>
                  </div> -->

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="password" name="pass1" id="form3Example4c" class="form-control" required placeholder="password" />
                      <label class="form-label" for="form3Example4c">Password</label>
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-key fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="password" name="pass2" id="form3Example4cd" class="form-control" required placeholder="retype password" />
                      <label class="form-label" for="form3Example4cd">Repeat your password</label>
                    </div>
                  </div>

                  <div class="form-check d-flex justify-content-center mb-5">
                    <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3c" />
                    <label class="form-check-label" for="form2Example3">
                      I agree all statements in <a href="#!">Terms of service</a>
                    </label>
                  </div>

                  <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                    <button type="submit" class="btn btn-primary btn-lg">Register</button>
                  </div>

                </form>

              </div>
              <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

                <img src="assets/images/register.webp"
                  class="img-fluid" alt="Sample image">

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</div>
</body>
</html>
