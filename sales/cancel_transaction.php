<?php
// Include the database connection file
require_once '../resources/config.php';

// Retrieve the saleID from the request body
$request_body = file_get_contents('php://input');
$data = json_decode($request_body);

if (isset($data->saleID)) {
    $saleID = $data->saleID;

    try {
        // Begin transaction
        $conn->begin_transaction();

        // Retrieve the items sold for the given saleID
        $sql_get_items_sold = "SELECT ProductID, QuantitySold FROM items_sold WHERE SaleID = $saleID";
        $result = $conn->query($sql_get_items_sold);

        if ($result->num_rows > 0) {
            // Iterate through each item sold and add back the quantities to QuantityInStock
            while ($row = $result->fetch_assoc()) {
                $productID = $row['ProductID'];
                $quantitySold = $row['QuantitySold'];

                // Update QuantityInStock for the product
                $sql_update_stock = "UPDATE products SET QuantityInStock = QuantityInStock + $quantitySold WHERE ProductID = $productID";
                $conn->query($sql_update_stock);
            }
        }

        // Delete the transactions entry with the given saleID
        $sql_delete_transactions = "DELETE FROM transactions WHERE SaleID = $saleID";
        $conn->query($sql_delete_transactions);

        // Delete the sales entry with the given saleID
        $sql_delete_sales = "DELETE FROM sales WHERE SaleID = $saleID";
        $conn->query($sql_delete_sales);

// Delete the items_sold entry with the given saleID
        $sql_delete_items_sold = "DELETE FROM items_sold WHERE SaleID = $saleID";
        $conn->query($sql_delete_items_sold);

        // Commit the transaction
        $conn->commit();

        // Echo success message
        echo json_encode(array("success" => true, "message" => "Transaction canceled successfully."));
    } catch (Exception $e) {
        // Rollback the transaction on error
        $conn->rollback();

        // Echo error message
        echo json_encode(array("success" => false, "message" => "Error canceling transaction: " . $e->getMessage()));
    }
} else {
    // Echo error message if saleID is not provided
    echo json_encode(array("success" => false, "message" => "SaleID not provided."));
}

// Close the database connection
$conn->close();
?>
