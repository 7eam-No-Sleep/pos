<?php
// Include the config.php file to establish a database connection
require_once '../resources/config.php';

// Fetch sales person's name based on the provided ID
$input = json_decode(file_get_contents('php://input'), true);
$salesPersonID = $input['salesPersonID'];

// Prepare and execute the SQL query
$sql = "SELECT first_name FROM employees WHERE employee_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $salesPersonID);
$stmt->execute();
$result = $stmt->get_result();

// Check if the query returned any results
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $salesPersonName = $row['first_name'];
    echo json_encode(array("success" => true, "salesPersonName" => $salesPersonName));
} else {
    echo json_encode(array("success" => false, "message" => "Sales person not found"));
}

// Close the database connection and statement
$stmt->close();
$conn->close();
?>
