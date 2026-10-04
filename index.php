<?php

require_once "database.php";

$error = "";

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LocalHire - Login</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <div class="login-container">

        <div class="left-panel">

            <div class="brand">
                LOCALHIRE
            </div>

            <h1>
                Find Opportunities.<br>
                Build Connections.
            </h1>

            <p>
                Connecting students with local businesses<br>
                and real opportunities.
            </p>

        </div>

        <div class="right-panel">

            <div class="login-card">

                <div class="login-header">
                    <h2>WELCOME BACK!</h2>
                    <p>Log in to continue to LocalHire</p>
                </div>


                <div class="role-buttons">

                    <button 
                        type="button"
                        class="role-btn active"
                        onclick="selectRole('job_seeker')">
                        Job Seekers
                    </button>

                    <button 
                        type="button" 
                        class="role-btn" 
                        onclick="selectRole('business')">
                        Business
                    </button>

                </div>

                <form action="login.php" method="POST">
                    <input 
                        type="hidden" 
                        name="role" 
                        id="role" 
                        value="job_seeker">

                    <div class="form-group">

                        <label for="email">
                            Email Address
                        </label>

                        <input
                            type="email"
                            id="email"
                            name="email"
                            placeholder="Enter your email address"
                            required
                        >

                    </div>


                    <div class="form-group">

                        <div class="password-label">

                            <label for="password">
                                Password
                            </label>

                            <a href="#">
                                Forgot password?
                            </a>

                        </div>

                        <input
                            type="password"
                            id="password"
                            name="password"
                            placeholder="Enter your password"
                            required
                        >

                    </div>


                    <button type="submit" class="login-btn">
                        Log In
                    </button>

                </form>

                <div class="signup-text">

                    Don't have an account?

                    <a href="#">
                        Sign Up
                    </a>

                </div>

            </div>

        </div>

    </div>
<script src="script.js"></script>
</body>
</html>
</body>
</html>