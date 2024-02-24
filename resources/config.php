<?php
$servername = "localhost";
$username = "Honey";
$password = "Darrien";
$database = "inventory_management";

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Function to update last login time
function updateLastLogin($employeeId) {
    global $conn;
    $currentDateTime = date("Y-m-d H:i:s");
    $sql = "UPDATE employees SET last_login = '$currentDateTime' WHERE employee_id = '$employeeId'";
    $conn->query($sql);
}

// Function to update last logout time and calculate hours worked
function updateLastLogout($employeeId) {
    global $conn;
    $currentDateTime = date("Y-m-d H:i:s");
    $sql = "UPDATE employees SET last_logout = '$currentDateTime' WHERE employee_id = '$employeeId'";
    $conn->query($sql);

    // Calculate total hours worked
    $sql = "SELECT last_login FROM employees WHERE employee_id = '$employeeId'";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $lastLogin = strtotime($row['last_login']);
        $currentLogout = strtotime($currentDateTime);
        $hoursWorked = ($currentLogout - $lastLogin) / (60 * 60); // Convert seconds to hours
        // Update total_hours_worked field
        $sql = "UPDATE employees SET total_hours_worked = total_hours_worked + $hoursWorked WHERE employee_id = '$employeeId'";
        $conn->query($sql);
    }
}

// Function to record a sale
function recordSale($employeeId, $productsSold) {
    global $conn;
    $currentDateTime = date("Y-m-d H:i:s");
    // Insert sale record into sales table
    $sql = "INSERT INTO sales (employee_id, sale_timestamp, products_sold) VALUES ('$employeeId', '$currentDateTime', '$productsSold')";
    $conn->query($sql);
}
?>
