<?php
include '../resources/config.php';
// Assuming you have a database connection established

// Check if productID is set in the URL
if(isset($_GET['productID'])) {
    // Sanitize the input to prevent SQL injection
    $productID = mysqli_real_escape_string($conn, $_GET['productID']);

    // Fetch product details from the database
    $query = "SELECT * FROM products WHERE ProductID = '$productID'";
    $result = mysqli_query($conn, $query);

    if(mysqli_num_rows($result) == 1) {
        // Product found, fetch details
        $row = mysqli_fetch_assoc($result);
        $productName = $row['ProductName'];
        $category = $row['Category'];
        $description = $row['Description'];
        $material = $row['Material'];
        $size = $row['Size'];
        $color = $row['Color'];
        $costPrice = $row['CostPrice'];
        $sellingPrice = $row['SellingPrice'];
        $quantityInStock = $row['QuantityInStock'];
        $status = $row['Status'];
    } else {
        // Product not found, redirect to error page or handle appropriately
        header("Location: error_page.php");
        exit();
    }
} else {
    // ProductID not set, redirect to error page or handle appropriately
    header("Location: error_page.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../style.css">
    <title>Edit Product</title>
</head>
<body>
<!-- Menu -->
<div class="menu-container">
    <a href="../sales/sales.html" class="menu-item">Sales</a>
    <a href="../view_inventory.html" class="menu-item">View Inventory</a>
    <a href="../add_product/add_product.html" class="menu-item">Add Product</a>
    <a href="../view_customers.html" class="menu-item">View Customers</a>
    <a href="../add_customer/add_customer.html" class="menu-item">Add Customer</a>
    <a href="transaction_history.html" class="menu-item">Transaction History</a>
    <a href="reports.html" class="menu-item">Reports</a>
</div>
    <h1>Edit Product</h1>
    <form action="update_product.php" method="POST">
        <input type="hidden" name="productID" value="<?php echo $productID; ?>">
        <label for="productName">Product Name:</label>
        <input type="text" id="productName" name="productName" value="<?php echo $productName; ?>">

        <label for="category">Category:</label>
        <select id="category" name="category">
            <option value="Tops"<?php if ($category == 'Tops') echo ' selected'; ?>>Tops</option>
            <option value="Bottoms"<?php if ($category == 'Bottoms') echo ' selected'; ?>>Bottoms</option>
            <option value="Dresses"<?php if ($category == 'Dresses') echo ' selected'; ?>>Dresses</option>
            <option value="Shoes"<?php if ($category == 'Shoes') echo ' selected'; ?>>Shoes</option>
            <option value="Activewear"<?php if ($category == 'Activewear') echo ' selected'; ?>>Activewear</option>
            <option value="Athletic shorts"<?php if ($category == 'Athletic shorts') echo ' selected'; ?>>Athletic shorts</option>
            <option value="Backpacks"<?php if ($category == 'Backpacks') echo ' selected'; ?>>Backpacks</option>
            <option value="Bag straps & charms"<?php if ($category == 'Bag straps & charms') echo ' selected'; ?>>Bag straps & charms</option>
            <option value="Belts"<?php if ($category == 'Belts') echo ' selected'; ?>>Belts</option>
            <option value="Blazers"<?php if ($category == 'Blazers') echo ' selected'; ?>>Blazers</option>
            <option value="Boots"<?php if ($category == 'Boots') echo ' selected'; ?>>Boots</option>
            <option value="Bracelets"<?php if ($category == 'Bracelets') echo ' selected'; ?>>Bracelets</option>
            <option value="Bras"<?php if ($category == 'Bras') echo ' selected'; ?>>Bras</option>
            <option value="Caps"<?php if ($category == 'Caps') echo ' selected'; ?>>Caps</option>
            <option value="Cardigans"<?php if ($category == 'Cardigans') echo ' selected'; ?>>Cardigans</option>
            <option value="Clutches"<?php if ($category == 'Clutches') echo ' selected'; ?>>Clutches</option>
            <option value="Coats"<?php if ($category == 'Coats') echo ' selected'; ?>>Coats</option>
            <option value="Cosplay outfits"<?php if ($category == 'Cosplay outfits') echo ' selected'; ?>>Cosplay outfits</option>
            <option value="Costumes"<?php if ($category == 'Costumes') echo ' selected'; ?>>Costumes</option>
            <option value="Dancewear"<?php if ($category == 'Dancewear') echo ' selected'; ?>>Dancewear</option>
            <option value="Denim jackets"<?php if ($category == 'Denim jackets') echo ' selected'; ?>>Denim jackets</option>
            <option value="Earrings"<?php if ($category == 'Earrings') echo ' selected'; ?>>Earrings</option>
            <option value="Evening gowns"<?php if ($category == 'Evening gowns') echo ' selected'; ?>>Evening gowns</option>
            <option value="Flats"<?php if ($category == 'Flats') echo ' selected'; ?>>Flats</option>
            <option value="Flip-flops"<?php if ($category == 'Flip-flops') echo ' selected'; ?>>Flip-flops</option>
            <option value="Formal shirts"<?php if ($category == 'Formal shirts') echo ' selected'; ?>>Formal shirts</option>
            <option value="Formalwear"<?php if ($category == 'Formalwear') echo ' selected'; ?>>Formalwear</option>
            <option value="Gloves & mittens"<?php if ($category == 'Gloves & mittens') echo ' selected'; ?>>Gloves & mittens</option>
            <option value="Hair accessories"<?php if ($category == 'Hair accessories') echo ' selected'; ?>>Hair accessories</option>
            <option value="Handbags"<?php if ($category == 'Handbags') echo ' selected'; ?>>Handbags</option>
            <option value="Hats"<?php if ($category == 'Hats') echo ' selected'; ?>>Hats</option>
            <option value="Heels"<?php if ($category == 'Heels') echo ' selected'; ?>>Heels</option>
            <option value="Hoodies"<?php if ($category == 'Hoodies') echo ' selected'; ?>>Hoodies</option>
            <option value="Jackets"<?php if ($category == 'Jackets') echo ' selected'; ?>>Jackets</option>
            <option value="Jeans"<?php if ($category == 'Jeans') echo ' selected'; ?>>Jeans</option>
            <option value="Jewelry"<?php if ($category == 'Jewelry') echo ' selected'; ?>>Jewelry</option>
            <option value="Jumpsuits"<?php if ($category == 'Jumpsuits') echo ' selected'; ?>>Jumpsuits</option>
            <option value="Keychains"<?php if ($category == 'Keychains') echo ' selected'; ?>>Keychains</option>
            <option value="Kimonos"<?php if ($category == 'Kimonos') echo ' selected'; ?>>Kimonos</option>
            <option value="Leather jackets"<?php if ($category == 'Leather jackets') echo ' selected'; ?>>Leather jackets</option>
            <option value="Leggings"<?php if ($category == 'Leggings') echo ' selected'; ?>>Leggings</option>
            <option value="Leotards & tights"<?php if ($category == 'Leotards & tights') echo ' selected'; ?>>Leotards & tights</option>
            <option value="Lingerie"<?php if ($category == 'Lingerie') echo ' selected'; ?>>Lingerie</option>
            <option value="Luggage"<?php if ($category == 'Luggage') echo ' selected'; ?>>Luggage</option>
            <option value="Maternity wear"<?php if ($category == 'Maternity wear') echo ' selected'; ?>>Maternity wear</option>
            <option value="Necklaces"<?php if ($category == 'Necklaces') echo ' selected'; ?>>Necklaces</option>
            <option value="Panties"<?php if ($category == 'Panties') echo ' selected'; ?>>Panties</option>
            <option value="Pants"<?php if ($category == 'Pants') echo ' selected'; ?>>Pants</option>
            <option value="Parkas"<?php if ($category == 'Parkas') echo ' selected'; ?>>Parkas</option>
            <option value="Performance wear"<?php if ($category == 'Performance wear') echo ' selected'; ?>>Performance wear</option>
            <option value="Glasses"<?php if ($category == 'Glasses') echo ' selected'; ?>>Glasses</option>
            <option value="Raincoats"<?php if ($category == 'Raincoats') echo ' selected'; ?>>Raincoats</option>
            <option value="Rings"<?php if ($category == 'Rings') echo ' selected'; ?>>Rings</option>
            <option value="Robes"<?php if ($category == 'Robes') echo ' selected'; ?>>Robes</option>
            <option value="Rompers"<?php if ($category == 'Rompers') echo ' selected'; ?>>Rompers</option>
            <option value="Sandals"<?php if ($category == 'Sandals') echo ' selected'; ?>>Sandals</option>
            <option value="Sarees"<?php if ($category == 'Sarees') echo ' selected'; ?>>Sarees</option>
            <option value="Scarves"<?php if ($category == 'Scarves') echo ' selected'; ?>>Scarves</option>
            <option value="School uniforms"<?php if ($category == 'School uniforms') echo ' selected'; ?>>School uniforms</option>
            <option value="Shawls"<?php if ($category == 'Shawls') echo ' selected'; ?>>Shawls</option>
            <option value="Shorts"<?php if ($category == 'Shorts') echo ' selected'; ?>>Shorts</option>
            <option value="Skirts"<?php if ($category == 'Skirts') echo ' selected'; ?>>Skirts</option>
            <option value="Sleepwear"<?php if ($category == 'Sleepwear') echo ' selected'; ?>>Sleepwear</option>
            <option value="Slippers"<?php if ($category == 'Slippers') echo ' selected'; ?>>Slippers</option>
            <option value="Sneakers"<?php if ($category == 'Sneakers') echo ' selected'; ?>>Sneakers</option>
            <option value="Sports bras"<?php if ($category == 'Sports bras') echo ' selected'; ?>>Sports bras</option>
            <option value="Sports leggings"<?php if ($category == 'Sports leggings') echo ' selected'; ?>>Sports leggings</option>
            <option value="Sports uniforms"<?php if ($category == 'Sports uniforms') echo ' selected'; ?>>Sports uniforms</option>
            <option value="Sportswear"<?php if ($category == 'Sportswear') echo ' selected'; ?>>Sportswear</option>
            <option value="Spring jackets"<?php if ($category == 'Spring jackets') echo ' selected'; ?>>Spring jackets</option>
            <option value="Stilettos"<?php if ($category == 'Stilettos') echo ' selected'; ?>>Stilettos</option>
            <option value="Suits"<?php if ($category == 'Suits') echo ' selected'; ?>>Suits</option>
            <option value="Sunglasses"<?php if ($category == 'Sunglasses') echo ' selected'; ?>>Sunglasses</option>
            <option value="Sweaters"<?php if ($category == 'Sweaters') echo ' selected'; ?>>Sweaters</option>
            <option value="Swimwear"<?php if ($category == 'Swimwear') echo ' selected'; ?>>Swimwear</option>
            <option value="T-shirts"<?php if ($category == 'T-shirts') echo ' selected'; ?>>T-shirts</option>
            <option value="Tie clips"<?php if ($category == 'Tie clips') echo ' selected'; ?>>Tie clips</option>
            <option value="Ties & bow ties"<?php if ($category == 'Ties & bow ties') echo ' selected'; ?>>Ties & bow ties</option>
            <option value="Tote bags"<?php if ($category == 'Tote bags') echo ' selected'; ?>>Tote bags</option>
            <option value="Tracksuits"<?php if ($category == 'Tracksuits') echo ' selected'; ?>>Tracksuits</option>
            <option value="Traditional clothing"<?php if ($category == 'Traditional clothing') echo ' selected'; ?>>Traditional clothing</option>
            <option value="Trench coats"<?php if ($category == 'Trench coats') echo ' selected'; ?>>Trench coats</option>
            <option value="Umbrellas"<?php if ($category == 'Umbrellas') echo ' selected'; ?>>Umbrellas</option>
            <option value="Uniforms"<?php if ($category == 'Uniforms') echo ' selected'; ?>>Uniforms</option>
            <option value="Wallets"<?php if ($category == 'Wallets') echo ' selected'; ?>>Wallets</option>
            <option value="Watches"<?php if ($category == 'Watches') echo ' selected'; ?>>Watches</option>
            <option value="Windbreakers"<?php if ($category == 'Windbreakers') echo ' selected'; ?>>Windbreakers</option>
            <option value="Winter jackets"<?php if ($category == 'Winter jackets') echo ' selected'; ?>>Winter jackets</option>
            <option value="Work uniforms"<?php if ($category == 'Work uniforms') echo ' selected'; ?>>Work uniforms</option>
            <option value="Workout clothes"<?php if ($category == 'Workout clothes') echo ' selected'; ?>>Workout clothes</option>
            <option value="Other"<?php if ($category == 'Other') echo ' selected'; ?>>Other</option>
        </select>


        <label for="description">Description:</label>
        <textarea id="description" name="description"><?php echo $description; ?></textarea>

        <label for="material">Material:</label>
        <input type="text" id="material" name="material" value="<?php echo $material; ?>"><br>

        <label for="size">Size:</label>
        <input type="text" id="size" name="size" value="<?php echo $size; ?>">

        <label for="color">Color:</label>
        <input type="text" id="color" name="color" value="<?php echo $color; ?>">

        <label for="costPrice">Cost Price:</label>
        <input type="text" id="costPrice" name="costPrice" value="<?php echo $costPrice; ?>">

        <label for="sellingPrice">Selling Price:</label>
        <input type="text" id="sellingPrice" name="sellingPrice" value="<?php echo $sellingPrice; ?>">

        <label for="quantityInStock">Quantity in Stock:</label>
        <input type="text" id="quantityInStock" name="quantityInStock" value="<?php echo $quantityInStock; ?>">

        <label for="status">Status:</label>
        <select id="status" name="status">
            <option value="Ordered"<?php if ($status == 'Ordered') echo ' selected'; ?>>Ordered</option>
            <option value="In-Stock"<?php if ($status == 'In-Stock') echo ' selected'; ?>>In-Stock</option>
            <option value="Damaged"<?php if ($status == 'Damaged') echo ' selected'; ?>>Damaged</option>
        </select><br>

        <button type="submit">Save Changes</button>
    </form>
</body>
</html>
