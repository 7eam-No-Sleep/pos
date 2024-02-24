function addProduct() {
    // Fetch form data
    const productName = document.getElementById('productName').value;
    const category = document.getElementById('category').value;
    const description = document.getElementById('description').value;
    const costPrice = parseFloat(document.getElementById('costPrice').value);
    const sellingPrice = parseFloat(document.getElementById('sellingPrice').value);
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
        sellingPrice: sellingPrice,
        quantityInStock: quantityInStock,
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

function updateInventoryUI(inventoryData) {
    // Get the container where you want to display the inventory data
    const inventoryContainer = document.getElementById('inventoryContainer');

    // Check if the container exists
    if (!inventoryContainer) {
        console.error('Inventory container not found');
        return;
    }

    // Clear existing content
    inventoryContainer.innerHTML = '';

    // Loop through the inventory data and create HTML elements
    inventoryData.forEach(product => {
        const productElement = document.createElement('div');
        productElement.innerHTML = `
            <p><strong>${product.ProductName}</strong></p>
            <p>Category: ${product.Category}</p>
            <p>Description: ${product.Description}</p>
            <p>Cost Price: $${product.CostPrice}</p>
            <p>Selling Price: $${product.SellingPrice}</p>
            <p>Quantity in Stock: ${product.QuantityInStock}</p>
            <hr>
        `;

        // Append the product element to the container
        inventoryContainer.appendChild(productElement);
    });
}


// Call the fetchInventory function when the page loads
document.addEventListener('DOMContentLoaded', fetchInventory);

function displayMessage(color, message) {
    // Display a message in the message area
    const messageElement = document.getElementById('message');
    messageElement.style.color = color;
    messageElement.textContent = message;
}
// Add this function to fetch inventory and update the UI
function fetchAndDisplayInventory() {
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
            displayInventory(data);
        })
        .catch(error => {
            console.error('Error fetching inventory:', error);
            // Handle errors or display error messages here
        });
}

// Call the fetchAndDisplayInventory function when the page loads
document.addEventListener('DOMContentLoaded', fetchAndDisplayInventory);

// Add this function to display inventory data
function displayInventory(inventoryData) {
    // Get the container where you want to display the inventory data
    const inventoryContainer = document.getElementById('inventoryContainer');

    // Clear existing content
    inventoryContainer.innerHTML = '';

    // Loop through the inventory data and create HTML elements
    inventoryData.forEach(product => {
        const productElement = document.createElement('div');
        productElement.innerHTML = `
            <p><strong>${product.ProductName}</strong></p>
            <p>Category: ${product.Category}</p>
            <p>Description: ${product.Description}</p>
            <p>Cost Price: $${product.CostPrice}</p>
            <p>Selling Price: $${product.SellingPrice}</p>
            <p>Quantity in Stock: ${product.QuantityInStock}</p>
            <hr>
        `;

        // Append the product element to the container
        inventoryContainer.appendChild(productElement);
    });	
}
function checkDatabaseStatus() {
    fetch('db_status.php')
        .then(response => response.text())
        .then(data => {
            const dbStatusElement = document.getElementById('dbStatus');
            dbStatusElement.textContent = 'Database: ' + data;
        })
        .catch(error => {
            console.error('Error checking database status:', error);
        });
}

// Call the function when the page loads
document.addEventListener('DOMContentLoaded', checkDatabaseStatus);
