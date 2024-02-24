<?php
include '../resources/config.php';

// Fetch form data
$data = json_decode(file_get_contents("php://input"), true);

// Validate data
$errors = [];

if (empty($data['productName'])) {
    $errors[] = 'Product Name is required.';
}

// Check for validation errors
if (!empty($errors)) {
    echo json_encode(['success' => false, 'message' => 'Invalid input. Please check your data.', 'errors' => $errors]);
    exit;
}

// Insert data into the Products table
$stmt = $conn->prepare("INSERT INTO Products (ProductName, Category, Description, Material, Size, Color, CostPrice, SellingPrice, QuantityInStock,status) VALUES (?, ?, ?,?, ?, ?, ?, ?, ?,?)");
$stmt->bind_param("sssssssdds", $data['productName'], $data['category'], $data['description'], $data['material'], $data['size'], $data['color'], $data['costPrice'], $data['sellingPrice'], $data['quantityInStock'], $data['status']);

if ($stmt->execute()) {
    echo json_encode(['success' => true, 'message' => 'Product added successfully.']);
} else {
    echo json_encode(['success' => false, 'message' => 'Error adding product: ' . $stmt->error]);
}

$stmt->close();
$conn->close();
?>
