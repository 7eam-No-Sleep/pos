<?php
require_once('resources/config.php');

// Set the timezone to America/Chicago
date_default_timezone_set('America/Chicago');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $employeeId = $_POST["employeeId"];
    $passcode = $_POST["employeePasscode"];

    // Prepare SQL statement
    $stmt = $conn->prepare("SELECT employee_passcode FROM employees WHERE employee_id = ?");
    $stmt->bind_param("s", $employeeId);

    // Execute query
    $stmt->execute();

    // Get result
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        // Employee ID exists, now check passcode
        $row = $result->fetch_assoc();
        $hashedPasscode = $row["employee_passcode"];

        // Verify the entered passcode against the hashed passcode from the database
        if ($passcode === $hashedPasscode) {
            // Update last login timestamp in the database
            $currentTimestamp = date('Y-m-d H:i:s');
            $updateStmt = $conn->prepare("UPDATE employees SET last_login = ? WHERE employee_id = ?");
            $updateStmt->bind_param("ss", $currentTimestamp, $employeeId);
            $updateStmt->execute();
            $updateStmt->close();

            // Login successful
            echo "success";
            exit;
        } else {
            // Incorrect passcode
            echo "failed";
            exit;
        }
    } else {
        // Employee ID does not exist
        echo "failed";
        exit;
    }

    // Close statement and connection
    $stmt->close();
    $conn->close();
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="style.css">
    <style>
        /* Additional CSS for dial pad layout */
        .login-container {
            text-align: center;
        }

        .dial-pad {
            width: 50% !important;
            margin: 0 auto; /* Center the dial pad */
            border-collapse: collapse; /* Collapse border spacing */
        }

        .dial-pad td {
            width: 33.33% !important; /* Equal width for each column */
            padding: 10px; !important; /* Adjust padding as needed */
        }

        .dial-btn {
            width: 100%;
            padding: 20px; /* Adjust padding as needed */
            font-size: 24px; /* Adjust font size as needed */
        }
    </style>
</head>
<body>
<div class="login-container">
    <h5>Login</h5>
    <form id="loginForm" method="POST">
        <input  type="text" id="employeeId" name="employeeId" autocomplete="off">
        <br><br>
        <input type="password" id="employeePasscode" name="employeePasscode" placeholder="Enter Passcode" autocomplete="off" >
        <br><br>
        <button type="submit" id="loginBtn">Login</button>
    </form>
    <table class="dial-pad">
        <tr>
            <td><button class="dial-btn" data-value="1">1</button></td>
            <td><button class="dial-btn" data-value="2">2</button></td>
            <td><button class="dial-btn" data-value="3">3</button></td>
        </tr>
        <tr>
            <td><button class="dial-btn" data-value="4">4</button></td>
            <td><button class="dial-btn" data-value="5">5</button></td>
            <td><button class="dial-btn" data-value="6">6</button></td>
        </tr>
        <tr>
            <td><button class="dial-btn" data-value="7">7</button></td>
            <td><button class="dial-btn" data-value="8">8</button></td>
            <td><button class="dial-btn" data-value="9">9</button></td>
        </tr>
        <tr>
            <td><button class="dial-btn" data-value="*">*</button></td>
            <td><button class="dial-btn" data-value="0">0</button></td>
            <td><button class="dial-btn" data-value="#">#</button></td>
        </tr>
    </table>
</div>

<script>
    const employeeIdInput = document.getElementById('employeeId');
    const passcodeInput = document.getElementById('employeePasscode');

    let currentEmployeeId = '';

    document.querySelectorAll('.dial-btn').forEach(button => {
        button.addEventListener('click', () => {
            const value = button.dataset.value;
            if (currentEmployeeId.length < 4) {
                currentEmployeeId += value;
                employeeIdInput.value = currentEmployeeId;
            } else if (passcodeInput.value.length < 4) {
                passcodeInput.value += value;
            }
        });
    });

    document.getElementById('loginForm').addEventListener('submit', function(event) {
        event.preventDefault(); // Prevent the default form submission

        // Fetch form data
        const formData = new FormData(this);

        // Send AJAX request
        fetch(window.location.href, {
            method: 'POST',
            body: formData
        })
            .then(response => {
                if (response.ok) {
                    return response.text();
                }
                throw new Error('Network response was not ok.');
            })
            .then(data => {
                // Handle the response data
                console.log(data); // You can remove this line
                // Example: Check if login was successful and redirect if needed
                if (data.trim() === 'success') {
                    window.location.href = 'sales/sales.html';
                } else {
                    alert('Invalid employee ID or passcode! Please try again.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
            });
    });


</script>

</body>
</html>
