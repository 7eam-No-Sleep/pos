<?php
// Include the database connection file
require_once '../resources/config.php';

// Retrieve the transaction data from the POST request
$transactionData = json_decode(file_get_contents("php://input"), true);

// Extract transaction data
$customerID = $transactionData['CustomerID'];
$transactionDate = $transactionData['TransactionDate'];
$paymentMethod = $transactionData['PaymentMethod'];
$totalAmount = $transactionData['TotalAmount'];

// Initialize variables for optional fields
$cashReceived = isset($transactionData['CashReceived']) ? $transactionData['CashReceived'] : null;
$changeGiven = isset($transactionData['ChangeGiven']) ? $transactionData['ChangeGiven'] : null;
$checkNumber = isset($transactionData['CheckNumber']) ? $transactionData['CheckNumber'] : null;
$creditCardNumber = isset($transactionData['CreditCardNumber']) ? $transactionData['CreditCardNumber'] : null;
$expiryDate = isset($transactionData['ExpiryDate']) ? $transactionData['ExpiryDate'] : null;

// Begin transaction
$conn->begin_transaction();

// Insert into Sales Table
$sql_sales = "INSERT INTO sales (CustomerID, SaleDate) VALUES ('$customerID', '$transactionDate')";
if ($conn->query($sql_sales) === TRUE) {
    // Retrieve the last inserted SaleID
    $saleID = $conn->insert_id;

    // Insert into Items Sold Table
    // Assuming $transactionData contains items sold, iterate through and insert each item
    foreach ($transactionData['Items'] as $item) {
        $productID = $item['ProductID'];
        $quantitySold = $item['Quantity'];
        $pricePerItem = $item['Price'];
        $sql_items_sold = "INSERT INTO items_sold (SaleID, ProductID, QuantitySold, PricePerItem) VALUES ('$saleID', '$productID', '$quantitySold', '$pricePerItem')";
        if ($conn->query($sql_items_sold) !== TRUE) {
            // Rollback transaction if insertion into items_sold fails
            $conn->rollback();
            echo json_encode(array("success" => false, "message" => "Error recording transaction: " . $conn->error));
            exit(); // Terminate script execution
        }
    }

    // Insert into Transactions Table
    $sql_transactions = "INSERT INTO transactions (SaleID, CustomerID, TransactionDate, PaymentMethod, TotalAmount, CashReceived, ChangeGiven, CheckNumber, CreditCardNumber, ExpiryDate) 
                        VALUES ('$saleID', '$customerID', '$transactionDate', '$paymentMethod', '$totalAmount', '$cashReceived', '$changeGiven', '$checkNumber', '$creditCardNumber', '$expiryDate')";
    if ($conn->query($sql_transactions) === TRUE) {
        // Commit transaction if all operations are successful
        $conn->commit();
        echo json_encode(array("success" => true, "message" => "Transaction recorded successfully."));
    } else {
        // Rollback transaction if insertion into transactions fails
        $conn->rollback();
        echo json_encode(array("success" => false, "message" => "Error recording transaction: " . $conn->error));
    }
} else {
    // Rollback transaction if insertion into sales fails
    $conn->rollback();
    echo json_encode(array("success" => false, "message" => "Error recording transaction: " . $conn->error));
}

// Close the database connection
$conn->close();
?>
