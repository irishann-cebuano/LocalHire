<?php

session_start();

if (!isset($_SESSION["seeker_id"])) {
    header("Location: index.php");
    exit;
}

?>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Job Seeker Dashboard</title>

</head>

<body>

    <h1>Welcome, <?php echo htmlspecialchars($_SESSION["name"]); ?>!</h1>

    <p>You are logged in as a Job Seeker.</p>

    <p>
        <a href="logout.php">Log Out</a>
    </p>

</body>

</html>