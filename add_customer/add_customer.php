<?php
include '../resources/config.php';

// Fetch form customerData
$customerData = json_decode(file_get_contents("php://input"), true);

// Validate customerData
$errors = [];

if (empty($customerData['firstName'])) {
    $errors[] = 'First Name is required.';
}

// Check for validation errors
if (!empty($errors)) {
    echo json_encode(['success' => false, 'message' => 'Invalid input. Please check your data.', 'errors' => $errors]);
    exit;
}

// Insert customer details into the Customers table
$customerStmt = $conn->prepare("INSERT INTO Customers (FirstName, LastName, ContactNumber, Email, Street1, AptNo, City, State, ZipCode, Birthdate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
$customerStmt->bind_param("ssssssssss", $customerData['firstName'], $customerData['lastName'], $customerData['contactNumber'], $customerData['email'], $customerData['street1'], $customerData['aptNo'], $customerData['city'], $customerData['state'], $customerData['zipCode'], $customerData['birthdate']);

if ($customerStmt->execute()) {
    echo json_encode(['success' => true, 'message' => 'Customer added successfully.']);
} else {
    echo json_encode(['success' => false, 'message' => 'Error adding customer: ' . $customerStmt->error]);
}

$customerStmt->close();
$conn->close();
?>
