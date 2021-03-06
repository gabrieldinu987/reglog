<?php

require_once "../includ/connect.php";

//Register user
//if (isset($_POST['user_register'])) {

$errors = array();
$warnings = array();
$success = array();

if (!isset($_POST['first_name']) || (trim($_POST['first_name']) == '')) {
    array_push($errors, " Insert first name.<br/> ");
} else {
    $first_name = $_POST['first_name'];
}
if (!isset($_POST['last_name']) || (trim($_POST['last_name']) == '')) {
    array_push($errors, " Insert last name.<br/> ");
} else {
    $last_name = $_POST['last_name'];
}

if (!isset($_POST['email_register']) || (trim($_POST['email_register']) == '')) {
    array_push($errors, " Insert email.<br/> ");
} else if (!filter_var($_POST['email_register'], FILTER_VALIDATE_EMAIL)) {
    array_push($errors, " Invalid email address.<br/> ");
} else {
    $select = $db->query("SELECT email FROM users WHERE email=?", array($_POST['email_register']));
    //$e = $select->result;
    //$email_returned = $e[0]['email'];
    if ($select->affected_rows == 1) {
        array_push($errors, " The email address you entered is already used.<br/>");
    } else {
        $email_register = $_POST['email_register'];
        $email_code_validation = randStrGen(10);
    }
}

if (!isset($_POST['password_register']) || (trim($_POST['password_register']) == '')) {
    array_push($errors, " Insert password.<br/> ");
} else {
    $password_register = $db->hashit($_POST['password_register']);
}
if (!isset($_POST['repassword_register']) || (trim($_POST['repassword_register']) == '')) {
    array_push($errors, " Re-enter password.<br/> ");
} else {
    $repassword_register = $db->hashit($_POST['repassword_register']);
    //$repassword_register = md5($_POST['repassword_register'].$db->salt());
}
if ($password_register != $repassword_register) {
    array_push($errors, " Passwords don't match.<br/> ");
}
if (isset($_POST['day']) && isset($_POST['month']) && isset($_POST['year'])) {
    $day = $_POST['day'];
    $month = $_POST['month'];
    $year = $_POST['year'];
    if (!checkdate($month, $day, $year)) {
        array_push($errors, " The date of birth you entered is not a valid calendar date. ");
    } else {
        $birthday = $year . '-' . $month . '-' . $day;
    }
} else {
    array_push($errors, " Insert birthday.<br/> ");
}
if (!isset($_POST['city']) || (trim($_POST['city']) == '')) {
    array_push($errors, " Insert city.<br/> ");
} else {
    $city = $_POST['city'];
}
if (!isset($_POST['gender'])) {
    array_push($errors, " Select gender.<br/> ");
} else {
    $gender = $_POST['gender'];
}

$ip = getenv('REMOTE_ADDR');

if (empty($errors)) {
    $rank = 'a';
    if ($gender == 'm') {
        $avatar = '/users/' . $email_register . '/m.png';
    } else {
        $avatar = '/users/' . $email_register . '/f.png';
    }

    $sql = "INSERT INTO users
                (email,email_code_validation,password,last_name,first_name,birthday,gender,city,rank,avatar,ip)
                VALUES (?,?,?,?,?,?,?,?,?,?,?)";

    $insert = $db->query($sql, array(
        $email_register, $email_code_validation, $password_register, $last_name, $first_name, $birthday, $gender, $city, $rank, $avatar, $ip));

    if ($insert->error) {
        array_push($errors, " A problem occurred during registration process!<br/>
                                  Try again later !");
        $_SESSION['errors'] = $errors;
        header("location: ../notify.php");
        exit();
    } else {
        $select = $db->query("SELECT id_user,email_code_validation,first_name FROM users WHERE email=? AND password=?", array($email_register, $password_register));
        $u = $select->result;
        if ($select->affected_rows == 0) {
            array_push($errors, " Unable to get credentials from databse<br/>
                                  Try again later !");
            $_SESSION['errors'] = $errors;
            header("location: ../notify.php");
            exit();
        } else {
            $idu = $u[0]['id_user'];
            $ecv = $u[0]['email_code_validation'];
            $fn = $u[0]['first_name'];
        }
        $site_name = "localhost";
        $to = $email_register;
        $from = "gabidinu987@gmail.com";
        $subject = "Activate account from social.com";
        include '../mail_template.php';
        $message = $mail_template;
        $headers = "From: " . $from . PHP_EOL;
        $headers .= "Reply-To: " . $from . PHP_EOL;
        $headers .= "MIME-Version: 1.0" . PHP_EOL;
        $headers .= "Content-Type: text/html; charset=ISO-8859-1" . PHP_EOL;
//$headers .= 'Cc: myboss@example.com' . "\r\n";

        if (mail($to, $subject, $message, $headers)) {
            array_push($success, " Check your email to activate your account.<br/>");
            $_SESSION['success'] = $success;
            header("location: ../notify.php");
            exit();
        } else {
            array_push($errors, "There was a problem sending the email for activation.<br/>");
            $_SESSION['errors'] = $errors;
            header("location: ../notify.php");
            exit();
        }
    }
} else {
    $_SESSION['errors'] = $errors;
    header("location: ../notify.php");
    exit();
}
//}