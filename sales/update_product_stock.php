<?php
// Include the database connection file
include '../resources/config.php';

// Check if the proposedSale parameter exists and is not empty
if (isset($_GET['proposedSale']) && !empty($_GET['proposedSale'])) {
    // Retrieve the proposedSale data from the URL
    $proposedSaleData = json_decode(urldecode($_GET['proposedSale']), true);

    // Check if the proposedSaleData is valid
    if ($proposedSaleData !== null && is_array($proposedSaleData) && array_key_exists('items', $proposedSaleData)) {
        // Get the items sold from the proposed sale data
        $itemsSold = $proposedSaleData['items'];

        // Loop through each item sold and update the product stock in the database
        foreach ($itemsSold as $item) {
            $productId = $item['productID'];

            // Query to retrieve current quantity in stock
            $sqlSelect = "SELECT QuantityInStock FROM products WHERE ProductID = ?";

            // Prepare and execute the select query
            $stmtSelect = $conn->prepare($sqlSelect);
            $stmtSelect->bind_param('i', $productId); // 'i' indicates integer type for the parameter
            $stmtSelect->execute();

            // Bind the result
            $stmtSelect->bind_result($currentQuantity);

            // Fetch the result
            $stmtSelect->fetch();

            // Close the select statement
            $stmtSelect->close();

            // If current quantity is greater than 0, update the stock
            if ($currentQuantity > 0) {
                // Calculate the new quantity in stock
                $newQuantity = $currentQuantity - 1;

                // Query to update the product stock
                $sqlUpdate = "UPDATE products SET QuantityInStock = ? WHERE ProductID = ?";

                // Prepare and execute the update query
                $stmtUpdate = $conn->prepare($sqlUpdate);
                $stmtUpdate->bind_param('ii', $newQuantity, $productId); // 'ii' indicates integer types for the parameters
                $stmtUpdate->execute();

                // Check if the update was successful
                if ($stmtUpdate->affected_rows > 0) {
                    echo "Product stock updated successfully for ProductID: $productId\n";
                } else {
                    echo "Error updating product stock for ProductID: $productId\n";
                }

                // Close the update statement
                $stmtUpdate->close();
            } else {
                echo "Insufficient stock for ProductID: $productId\n";
            }
        }
    } else {
        echo "Invalid proposedSale data\n";
    }
} else {
    echo "proposedSale parameter is missing or empty\n";
}

// Close the database connection
$conn->close();

// Redirect back to the sales page after 3 seconds
header("refresh:3;url=sales.html"); //
exit;
?>
