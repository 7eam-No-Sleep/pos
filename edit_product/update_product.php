<?php
include '../resources/config.php';
// Assuming you have a database connection established

if($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $productID = $_POST['productID'];
    $productName = $_POST['productName'];
    $category = $_POST['category'];
    $description = $_POST['description'];
    $material = $_POST['material'];
    $size = $_POST['size'];
    $color = $_POST['color'];
    $costPrice = $_POST['costPrice'];
    $sellingPrice = $_POST['sellingPrice'];
    $quantityInStock = $_POST['quantityInStock'];
    $status = $_POST['status'];
    // Retrieve other form fields similarly

// Update product details in the database
    $query = "UPDATE products
              SET ProductName='$productName',
                  Category='$category',
                  Description='$description',
                  Material='$material',
                  Size='$size',
                  Color='$color',
                  CostPrice='$costPrice',
                  SellingPrice='$sellingPrice',
                  QuantityInStock='$quantityInStock',
                  Status='$status'
              WHERE ProductID='$productID'";

    // Execute the query
    if(mysqli_query($conn, $query)) {
        // Product updated successfully, you can redirect to a success page
        header("Location: edit_success.php");
        exit();
    } else {
        // Handle the error, redirect to an error page or show a message
        echo "Error updating product: " . mysqli_error($conn);
    }
} else {
    // Redirect to an error page or handle appropriately
    header("Location: error_page.php");
    exit();
}
?>

