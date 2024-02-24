<?php
include 'resources/config.php';

// Fetch products from the products table
$result = $conn->query("SELECT * FROM Products");

if ($result->num_rows > 0) {
    $products = $result->fetch_all(MYSQLI_ASSOC);
    echo json_encode(['success' => true, 'products' => $products]);
} else {
    echo json_encode(['success' => false, 'message' => 'No customers found.']);
}

$conn->close();
?>
