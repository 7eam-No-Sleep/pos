function addProduct() {
    // Fetch form data
    const productName = document.getElementById('productName').value;
    const category = document.getElementById('category').value;
    const description = document.getElementById('description').value;
    const costPrice = parseFloat(document.getElementById('costPrice').value);
    const material = document.getElementById('material').value;
    const size = document.getElementById('size').value;
    const color = document.getElementById('color').value;
    const sellingPrice = document.getElementById('sellingPrice').value;
    const status = document.getElementById('status').value;
    const quantityInStock = parseInt(document.getElementById('quantityInStock').value, 10);


    // Validate numeric fields
    if (isNaN(costPrice) || isNaN(sellingPrice) || isNaN(quantityInStock)) {
        displayMessage('red', 'Please enter valid numeric values for cost price, selling price, and quantity.');
        return;
    }

    // Create an object with the data
    const productData = {
        productName: productName,
        category: category,
        description: description,
        costPrice: costPrice,
        material: material,
        size: size,
        color: color,
        sellingPrice: sellingPrice,
        quantityInStock: quantityInStock,
        status: status,
    };

    // Send the data to your backend
    fetch('add_product.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(productData),
    })
        .then(response => {
            // Check if the response status is OK
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            console.log(data);

            // Display the success or error message
            const messageElement = document.getElementById('message');
            if (data.success) {
                messageElement.style.color = 'green';
                messageElement.textContent = 'Product added successfully!';
                // You can choose to fetch the updated inventory data and refresh the UI here if needed
                fetchInventory();
            } else {
                messageElement.style.color = 'red';
                messageElement.textContent = 'Error adding product: ' + data.message;
            }
        })
        .catch(error => {
            console.error('Error:', error);
            // Handle other errors or display error messages here
            displayMessage('red', 'Error adding product: ' + error.message);
        });
}
function displayMessage(color, message) {
    // Display a message in the message area
    const messageElement = document.getElementById('message');
    messageElement.style.color = color;
    messageElement.textContent = message;
}
function fetchInventory() {
    fetch('fetch_inventory.php')
        .then(response => {
            // Check if the response status indicates success
            if (response.ok) {
                document.getElementById('dbStatusIndicator').style.backgroundColor = 'green';
            } else {
                document.getElementById('dbStatusIndicator').style.backgroundColor = 'red';
            }
            return response.json();
        })
        .then(data => {
            // Call a function to update the HTML content with the retrieved data
            updateInventoryUI(data);
        })
        .catch(error => {
            console.error('Error fetching inventory:', error);
            // Handle errors or display error messages here
        });
}