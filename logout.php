<?php
require_once('resources/config.php');

// Set the timezone to America/Chicago
date_default_timezone_set('America/Chicago');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $employeeId = $_POST["employeeId"];
    $passcode = $_POST["employeePasscode"];

    // Prepare SQL statement to fetch last login time
    $loginStmt = $conn->prepare("SELECT last_login FROM employees WHERE employee_id = ?");
    $loginStmt->bind_param("s", $employeeId);
    $loginStmt->execute();
    $loginResult = $loginStmt->get_result();
    $loginRow = $loginResult->fetch_assoc();
    $lastLogin = strtotime($loginRow['last_login']);
    $loginStmt->close();

    // Update last logout timestamp in the database
    $currentTimestamp = date('Y-m-d H:i:s');
    $updateStmt = $conn->prepare("UPDATE employees SET last_logout = ? WHERE employee_id = ?");
    $updateStmt->bind_param("ss", $currentTimestamp, $employeeId);
    $updateStmt->execute();
    $updateStmt->close();

    // Calculate shift hours worked
    $logoutTime = strtotime($currentTimestamp);
    $shiftHours = round(($logoutTime - $lastLogin) / 3600, 2); // Convert seconds to hours

    // Update total_hours_worked in employees table
    $updateHoursStmt = $conn->prepare("UPDATE employees SET total_hours_worked = total_hours_worked + ? WHERE employee_id = ?");
    $updateHoursStmt->bind_param("ds", $shiftHours, $employeeId);
    $updateHoursStmt->execute();
    $updateHoursStmt->close();

    // Calculate total transactions, total cash, total checks, total card sales, and total sales
    $calculateStmt = $conn->prepare("SELECT COUNT(*) AS total_transactions, SUM(CashReceived) AS total_cash, SUM(CAST(CheckNumber AS DECIMAL(10,2))) AS total_checks, SUM(CAST(CreditCardNumber AS DECIMAL(10,2))) AS total_card_sales, SUM(TotalAmount) AS total_sales FROM transactions WHERE TransactionDate >= ? AND TransactionDate <= ?");
    $calculateStmt->bind_param("ss", $lastLogin, $currentTimestamp);
    $calculateStmt->execute();
    $calculateResult = $calculateStmt->get_result();
    $calculateRow = $calculateResult->fetch_assoc();
    $totalTransactions = $calculateRow['total_transactions'];
    $totalCash = $calculateRow['total_cash'];
    $totalChecks = $calculateRow['total_checks'];
    $totalCardSales = $calculateRow['total_card_sales'];
    $totalSales = $calculateRow['total_sales'];
    $calculateStmt->close();

    // Insert new record into shift table
    $shiftDate = date('Y-m-d');
    $insertShiftStmt = $conn->prepare("INSERT INTO shift (employee_id, shift_time, shift_date, total_transactions, total_cash, total_checks, total_card_sales, total_sales) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
    $insertShiftStmt->bind_param("ddssdddd", $employeeId, $shiftHours, $shiftDate, $totalTransactions, $totalCash, $totalChecks, $totalCardSales, $totalSales);
    $insertShiftStmt->execute();
    $insertShiftStmt->close();

    // Respond with success message including shift hours worked
    echo json_encode(['success' => true, 'message' => 'Shift hours worked: ' . $shiftHours]);
    exit; // Exit after sending response
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logout</title>
    <link rel="stylesheet" href="style.css">
    <style>
        /* Additional CSS for dial pad layout */
        .logout-container {
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
<div class="logout-container">
    <h5>Logout</h5>
    <form id="logoutForm" method="POST">
        <input type="text" id="employeeId" name="employeeId" autocomplete="off">
        <br><br>
        <input type="password" id="employeePasscode" name="employeePasscode" placeholder="Enter Passcode" autocomplete="off" >
        <br><br>
        <button type="submit" id="logoutBtn">Logout</button>
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

    document.getElementById('logoutForm').addEventListener('submit', function(event) {
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
                    return response.json();
                }
                throw new Error('Network response was not ok.');
            })
            .then(data => {
                // Handle the response data
                console.log(data); // You can remove this line
                // Example: Check if logout was successful and redirect if needed
                if (data.success) {
                    alert('Shift hours worked: ' + data.message);
                    // Redirect after displaying success message
                    setTimeout(() => {
                        window.location.href = 'index.php';
                    }, 1000);
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
