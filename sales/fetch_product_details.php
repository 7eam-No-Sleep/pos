<?php
global $conn;
include '../resources/config.php';

// Fetch form data
$data = json_decode(file_get_contents("php://input"), true);

// Validate data
$errors = [];

if (empty($data['productID'])) {
    $errors[] = 'Product ID is required.';
}

// Check for validation errors
if (!empty($errors)) {
    echo json_encode(['success' => false, 'message' => 'Invalid input. Please check your data.', 'errors' => $errors]);
    exit;
}

// Fetch product details from the Products table based on Product ID
$stmt = $conn->prepare("SELECT ProductName, SellingPrice FROM Products WHERE ProductID = ?");
$stmt->bind_param("i", $data['productID']);
$stmt->execute();
$stmt->bind_result($productName, $price);
$stmt->fetch();
$stmt->close();
$conn->close();

// Check if product details were fetched successfully
if (!empty($productName) && !empty($price)) {
    echo json_encode(['success' => true, 'productName' => $productName, 'price' => $price]);
} else {
    echo json_encode(['success' => false, 'message' => 'Error fetching product details.']);
}
?>
