<?php
include 'resources/config.php';

// Fetch inventory data from the Products table
$result = $conn->query("SELECT * FROM Products");

// Convert the result to an associative array
$inventoryData = [];
while ($row = $result->fetch_assoc()) {
    $inventoryData[] = $row;
}

// Close the database connection
$conn->close();

// Return JSON-encoded inventory data
echo json_encode($inventoryData);
?>
