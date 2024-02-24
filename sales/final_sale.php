<?php
// Include the database connection file
require_once '../resources/config.php';

// Retrieve the proposedSale parameter from the URL
$proposedSaleData = json_decode(urldecode($_GET['proposedSale']), true);

// Extract relevant data from the proposed sale
$itemsSold = json_encode($proposedSaleData['items']); // Serialize the items sold array
$customerPhoneNumber = $proposedSaleData['customerPhoneNumber'];
$runningTotal = $proposedSaleData['runningTotal'];
$salesTaxTotal = $proposedSaleData['salesTaxTotal'];
$finalTotal = $proposedSaleData['finalTotal'];
$discountReason = $proposedSaleData['discountReason'];
$discountAmount = $proposedSaleData['discountAmount'];
$salesPerson = $proposedSaleData['salesPerson'];
$customerID = $proposedSaleData['customerID']; // Retrieve customerID from proposedSaleData
$cashReceived = $proposedSaleData['cashReceived'];
$checkNumber = $proposedSaleData['checkNumber'];
$creditCardNumber = $proposedSaleData['creditCardNumber'];
$expiryDate = $proposedSaleData['expiryDate'];

try {
    // Begin transaction
    $conn->begin_transaction();

    // Inserting sales entry
    $sql_sales = "INSERT INTO sales (SaleDate, ItemsSold, TotalPrice, employee_id, CustomerID) VALUES (NOW(), '$itemsSold', $finalTotal, $salesPerson, $customerID)";
    $conn->query($sql_sales);

    // Retrieve the auto-generated saleID
    $saleID = $conn->insert_id;

    // Inserting transaction entry
    $paymentMethod = ""; // Placeholder for payment method
    if (!empty($cashReceived)) {
        $paymentMethod = "Cash";
    } elseif (!empty($checkNumber)) {
        $paymentMethod = "Check";
    } elseif (!empty($creditCardNumber)) {
        $paymentMethod = "Credit/Debit Card";
    }
    $changeGiven = $paymentMethod === "Cash" ? $cashReceived - $finalTotal : 0; // Calculate change given if payment method is cash

    $sql_transaction = "INSERT INTO transactions (SaleID, CustomerID, TransactionDate, PaymentMethod, TotalAmount, CashReceived, ChangeGiven, CheckNumber, CreditCardNumber, ExpiryDate) VALUES ($saleID, $customerID, NOW(), '$paymentMethod', $finalTotal, $cashReceived, $changeGiven, '$checkNumber', '$creditCardNumber', '$expiryDate')";
    $conn->query($sql_transaction);

    // Inserting items sold entries and updating quantity in stock
    foreach ($proposedSaleData['items'] as $item) {
        $productID = $item['productID'];
        $quantitySold = $item['quantity'];
        $pricePerItem = $item['price'];

        // Update quantity in stock
        $sql_update_stock = "UPDATE products SET QuantityInStock = QuantityInStock - $quantitySold WHERE ProductID = $productID";
        $conn->query($sql_update_stock);

        // Insert entry for item sold
        $sql_item = "INSERT INTO items_sold (SaleID, ProductID, QuantitySold, PricePerItem) VALUES ($saleID, $productID, $quantitySold, $pricePerItem)";
        $conn->query($sql_item);
    }

    // Commit transaction
    $conn->commit();

    // Echo success message
    echo json_encode(array("success" => true, "message" => "Transaction recorded successfully."));
} catch (Exception $e) {
    // Rollback transaction on failure
    $conn->rollback();

    // Echo error message
    echo json_encode(array("success" => false, "message" => "Error recording transaction: " . $e->getMessage()));
}

// Close the database connection
$conn->close();

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Final Sale</title>
    <link rel="stylesheet" href="../style.css">
    <script src="printer.js"></script>
</head>

<body>

<div class="sales-container">
    <div class="left-half">
        <!-- Left half content -->
        <img width="250" src="../images/HB_logo_white.jpg" alt="Honey-Be's">
        <p>1102 S. Union St.<br>Suite 4<br>337.4691466</p>
        <p id="receipt">
            <br>Returns are for store credit only<br>with receipt!</br> Must be within 7 days of purchase and <br>with original tags attached!</p>
        <p id="currentDate"></p>
        <div class="receipt">
            <ul id="itemsSold">
                <!-- Items sold will be dynamically populated here -->
            </ul>
            <p><span id="discountReason"></span> Discount: <span id="discountAmount"></span>%</p>
            <p>Items Total: $<span id="runningTotal"></span></p>
            <p>Sales Tax: $<span id="salesTax"></span></p>
            <p>Final Total: $<span id="finalTotal"></span></p>
            <p>Sales Person: <span id="salesPersonName"></span></p>
        </div>
        <p>Thanks for shopping with us!</p>
        <!-- Removed customer name since it's not available -->
        <p>Customer Number: <span id="customerPhoneNumber"></span></p>
    </div>
    <div class="right-half">
        <!-- Adding the buttons for printing receipt and canceling -->
        <button onclick="printReceipt()" style="width: 300px !important; height: 200px !important;">Print Receipt</button>
        </br></br></br></br></br></br></br></br>
        <button onclick="cancel()" style="width: 300px !important; height: 200px !important;">Cancel</button>
    </div>
</div>

<script>
    // JavaScript code to display the current date
    const currentDateElement = document.getElementById('currentDate');
    const currentDate = new Date();
    const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
    const formattedDate = currentDate.toLocaleDateString('en-US', options);
    currentDateElement.textContent = formattedDate;

    // Function to populate receipt
    function populateReceipt() {
        // Retrieve proposedSale data from the URL
        const proposedSaleData = getProposedSaleDataFromURL();

        // Populate customer information
        document.getElementById('customerPhoneNumber').textContent = proposedSaleData.customerPhoneNumber;

        // Populate items sold
        const itemsSoldList = document.getElementById('itemsSold');
        itemsSoldList.innerHTML = proposedSaleData.items.map(item => `<li>${item.productName} - $${item.price.toFixed(2)}</li>`).join('');

        // Populate totals
        document.getElementById('runningTotal').textContent = proposedSaleData.runningTotal.toFixed(2);
        document.getElementById('salesTax').textContent = proposedSaleData.salesTaxTotal.toFixed(2);
        document.getElementById('discountReason').textContent = proposedSaleData.discountReason; // Display discount reason
        if (proposedSaleData.discountAmount !== null) {
            document.getElementById('discountAmount').textContent = proposedSaleData.discountAmount.toFixed(2); // Display discount amount
        }
        document.getElementById('finalTotal').textContent = proposedSaleData.finalTotal.toFixed(2);

        // Fetch and populate sales person's name
        fetchSalesPersonName(proposedSaleData.salesPerson)
            .then(salesPersonName => {
                document.getElementById('salesPersonName').textContent = salesPersonName;
            })
            .catch(error => {
                console.error('Error fetching sales person name:', error);
            });
    }

    // Function to fetch sales person's name by ID
    function fetchSalesPersonName(salesPersonID) {
        return fetch('fetch_sales_person_name.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                salesPersonID: salesPersonID,
            }),
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                if (data.success) {
                    return data.salesPersonName;
                } else {
                    throw new Error('Failed to fetch sales person name');
                }
            });
    }

    // Function to retrieve proposedSale data from the URL
    function getProposedSaleDataFromURL() {
        const queryString = window.location.search;
        const urlParams = new URLSearchParams(queryString);
        const proposedSaleData = urlParams.get('proposedSale');
        return JSON.parse(decodeURIComponent(proposedSaleData));
    }
    // Function to handle canceling the transaction
    function cancel() {
        // Send an AJAX request to cancel the transaction
        fetch('cancel_transaction.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                // You may need to pass any necessary data to identify the transaction to cancel
                saleID: <?php echo $saleID; ?>, // Assuming you have the saleID available here
            }),
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            if (data.success) {
                // Transaction successfully canceled, redirect back to the previous screen
                window.history.back();
            } else {
                // Error occurred during cancellation, display an error message
                console.error('Error canceling transaction:', data.message);
                alert('Error canceling transaction: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Error canceling transaction:', error);
            alert('Error canceling transaction: ' + error.message);
        });
    }

    // Call the populateReceipt function when the page loads
    document.addEventListener('DOMContentLoaded', populateReceipt);
</script>


</body>
</html>
