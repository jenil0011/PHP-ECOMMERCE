<?php
error_reporting(0);
include 'components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
};

if (isset($_POST['submit'])) {

   $name = mysqli_real_escape_string($conn, $_POST['name']);
   $email = mysqli_real_escape_string($conn, $_POST['email']);
   // $user_id = 1; // Replace this with the actual user ID

   $update_profile = "UPDATE `users` SET name = '$name', email = '$email' WHERE id = $user_id";
   mysqli_query($conn, $update_profile);

   $empty_pass = 'da39a3ee5e6b4b0d3255bfef95601890afd80709';
   $prev_pass = mysqli_real_escape_string($conn, $_POST['prev_pass']);
   $old_pass = sha1($_POST['old_pass']);
   $old_pass = mysqli_real_escape_string($conn, $old_pass);
   $new_pass = sha1($_POST['new_pass']);
   $new_pass = mysqli_real_escape_string($conn, $new_pass);
   $cpass = sha1($_POST['cpass']);
   $cpass = mysqli_real_escape_string($conn, $cpass);

   $get_user_query = "SELECT * FROM `users` WHERE id = $user_id AND password = '$prev_pass'";
   $result = mysqli_query($conn, $get_user_query);
   $num_rows = mysqli_num_rows($result);

   if ($old_pass == $empty_pass) {
       $message[] = 'Please enter old password!';
   } elseif ($num_rows != 1) {
       $message[] = 'Old password not matched!';
   } elseif ($new_pass != $cpass) {
       $message[] = 'Confirm password not matched!';
   } else {
       if ($new_pass != $empty_pass) {
           $update_admin_pass = "UPDATE `users` SET password = '$cpass' WHERE id = $user_id";
           mysqli_query($conn, $update_admin_pass);
           $message[] = 'Password updated successfully!';
       } else {
           $message[] = 'Please enter a new password!';
       }
   }

}



?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>register</title>
   
   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

   <style>
       body {
  background: #76b4c8;
  background: url("toy.jpg");
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}

/*body::before {
  content: "";
  position: absolute;
  left: 0;
  top: 0;
  opacity: 0.5;
  width: 100%;
  height: 100%;
  
}*/
</style>

</head>
<body>
   
<?php include 'components/user_header.php'; ?>

<section class="form-container">

<form action="" method="post" onsubmit="return validateForm()">
    <img src="images/update.png" alt="">
    <h3>update now</h3>
    <input type="hidden" name="prev_pass" value="<?= $fetch_profile["password"]; ?>">
    <input type="text" name="name" required placeholder="enter your username" maxlength="20" class="box" value="<?= $fetch_profile["name"]; ?>">
    <input type="email" name="email" required placeholder="enter your email" maxlength="50" class="box" value="<?= $fetch_profile["email"]; ?>" oninput="this.value = this.value.replace(/\s/g, '')">
    <input type="password" name="old_pass" placeholder="enter your old password" maxlength="20" class="box" oninput="this.value = this.value.replace(/\s/g, '')">
    <input type="password" name="new_pass" placeholder="enter your new password" maxlength="20" class="box" oninput="this.value = this.value.replace(/\s/g, '')">
    <input type="password" name="cpass" placeholder="confirm your new password" maxlength="20" class="box" oninput="this.value = this.value.replace(/\s/g, '')">
    <input type="submit" value="update now" class="btn" name="submit">
</form>
</section>


<?php include 'components/footer.php'; ?>

<script src="js/script.js"></script>

<script>
    function validateForm() {
        var email = document.getElementsByName('email')[0].value;
        var password = document.getElementsByName('new_pass')[0].value;
        var confirmPassword = document.getElementsByName('cpass')[0].value;

        // Validate email
        if (email.includes("@@") || !isValidEmail(email)) {
            alert("Please enter a valid email address.");
            return false;
        }

        // Validate password
        if (!isValidPassword(password)) {
            alert("Password should be at least 6 characters long and contain at least one letter and one number.");
            return false;
        }

        // Confirm password
        if (password !== confirmPassword) {
            alert("Passwords do not match.");
            return false;
        }

        return true;
    }

    function isValidEmail(email) {
        // Basic email validation using a regular expression
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
    }

    function isValidPassword(password) {
        // Password validation: at least 6 characters, one letter, and one number
        var passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$/;
        return passwordRegex.test(password);
    }
</script>

</body>
</html>