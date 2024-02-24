<?php
// Include the database connection file
require_once '../resources/config.php';

// Retrieve the proposedSale parameter from the URL
$proposedSaleData = json_decode(urldecode($_GET['proposedSale']), true);

// Extract relevant data from the proposed sale
$itemsSold = count($proposedSaleData['items']); // Get the count of items sold
$totalPrice = $proposedSaleData['finalTotal'];
$employeeID = $proposedSaleData['salesPerson'];
$customerPhoneNumber = $proposedSaleData['customerPhoneNumber'];

// Begin transaction
$conn->begin_transaction();

// Query the customers table to get the customerID based on the phoneNumber
$sql_customer = "SELECT customerID FROM customers WHERE phoneNumber = '$customerPhoneNumber'";
$result = $conn->query($sql_customer);

if ($result->num_rows > 0) {
    // Fetch the customerID from the query result
    $row = $result->fetch_assoc();
    $customerID = $row['customerID'];

    // Commit transaction if customerID is found
    $conn->commit();
    echo json_encode(array("success" => true, "customerID" => $customerID));
} else {
    // Rollback transaction if customerID is not found
    $conn->rollback();
    echo json_encode(array("success" => false, "message" => "Customer not found."));
}

// Close the database connection
$conn->close();
?>