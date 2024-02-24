<?php
include '../resources/config.php';

// Fetch form data
$data = json_decode(file_get_contents("php://input"), true);

// Validate data
$errors = [];

// Add additional validations as needed
if (empty($data['phoneNumber'])) {
    $errors[] = 'Phone Number is required.';
}

// Check for validation errors
if (!empty($errors)) {
    echo json_encode(['success' => false, 'message' => 'Invalid input. Please check your data.', 'errors' => $errors]);
    exit;
}

// Insert your code here to fetch customer details by phone number
$stmt = $conn->prepare("SELECT * FROM Customers WHERE ContactNumber = ?");
$stmt->bind_param("s", $data['phoneNumber']);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    echo json_encode(['success' => true, 'customerID' => $row['CustomerID'], 'firstName' => $row['FirstName'], 'lastName' => $row['LastName']]);
} else {
    echo json_encode(['success' => false, 'message' => 'Customer not found.']);
}

$stmt->close();
$conn->close();
?>
