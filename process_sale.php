<?php
include 'resources/config.php';

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

// Deduct 1 from the quantity of the specified item in the Products table
$stmt = $conn->prepare("UPDATE Products SET QuantityInStock = QuantityInStock - 1 WHERE ProductID = ?");
$stmt->bind_param("i", $data['productID']);

if ($stmt->execute()) {
    echo json_encode(['success' => true, 'message' => 'Sale completed successfully.']);
} else {
    echo json_encode(['success' => false, 'message' => 'Error completing sale: ' . $stmt->error]);
}

$stmt->close();
$conn->close();
?>
