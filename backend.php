<?php
include 'resources/config.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Fetch form data
    $productName = $_POST['productName'];
    // Fetch other form fields as needed

    // Prepare and execute the SQL query
    $stmt = $conn->prepare("INSERT INTO Products (ProductName) VALUES (?)");
    $stmt->bind_param("s", $productName);
    $stmt->execute();

    // Close the statement and connection
    $stmt->close();
    $conn->close();

    // Return a success message (you can customize this based on your needs)
    echo json_encode(['success' => true, 'message' => 'Product added successfully']);
} else {
    // Return an error message if the request method is not POST
    echo json_encode(['success' => false, 'message' => 'Invalid request method']);
}
?>