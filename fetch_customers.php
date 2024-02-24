<?php
include 'resources/config.php';

// Fetch customers from the Customers table
$result = $conn->query("SELECT * FROM Customers");

if ($result->num_rows > 0) {
    $customers = $result->fetch_all(MYSQLI_ASSOC);
    echo json_encode(['success' => true, 'customers' => $customers]);
} else {
    echo json_encode(['success' => false, 'message' => 'No customers found.']);
}

$conn->close();
?>
