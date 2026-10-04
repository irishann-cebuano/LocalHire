<?php

session_start();

require_once "database.php";

$email = $_POST["email"] ?? "";
$password = $_POST["password"] ?? "";
$role = $_POST["role"] ?? "";

if (empty($email) || empty($password) || empty($role)) {
    die("Please complete all fields.");
}


if ($role === "job_seeker") {

    $sql = "SELECT *
            FROM tb_job_seekers
            WHERE email = :email
            LIMIT 1";

    $stmt = $pdo->prepare($sql);

    $stmt->execute([
        ":email" => $email
    ]);

    $user = $stmt->fetch(PDO::FETCH_ASSOC);

}
elseif ($role === "business") {

    $sql = "SELECT *
            FROM tb_businesses
            WHERE email = :email
            LIMIT 1";

    $stmt = $pdo->prepare($sql);

    $stmt->execute([
        ":email" => $email
    ]);

    $user = $stmt->fetch(PDO::FETCH_ASSOC);

}

else {

    die("Invalid user role.");

}



$passwordIsValid = $user && password_verify($password, $user["password"]);

if ($user && !$passwordIsValid && hash_equals((string) $user["password"], $password)) {
    $passwordIsValid = true;
    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

    if ($role === "job_seeker") {
        $update = $pdo->prepare(
            "UPDATE tb_job_seekers SET password = :password WHERE job_seeker_id = :id"
        );
        $update->execute([
            ":password" => $hashedPassword,
            ":id" => $user["job_seeker_id"]
        ]);
    } else {
        $update = $pdo->prepare(
            "UPDATE tb_businesses SET password = :password WHERE business_id = :id"
        );
        $update->execute([
            ":password" => $hashedPassword,
            ":id" => $user["business_id"]
        ]);
    }
}

if ($user && $passwordIsValid) {

    $_SESSION["role"] = $role;

    if ($role === "job_seeker") {

        $_SESSION["seeker_id"] = $user["job_seeker_id"];
        $_SESSION["name"] = $user["name"];

        header("Location: jobseeker_dashboard.php");
        exit;

    }

    if ($role === "business") {

        $_SESSION["business_id"] = $user["business_id"];
        $_SESSION["name"] = $user["business_name"];

        header("Location: business_dashboard.php");
        exit;

    }

}



else {

    echo "Invalid email or password.";

}

?>