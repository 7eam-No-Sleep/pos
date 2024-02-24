let items = [];
let runningTotal = 0;

function addItem() {
    const productID = document.getElementById('productIDAdd').value;
    const quantity = parseInt(document.getElementById('quantity').value, 10);

    // Validate numeric field
    if (isNaN(productID) || isNaN(quantity) || quantity <= 0) {
        displayMessage('red', 'Please enter valid numeric values for Product ID and Quantity.');
        return;
    }

    // Fetch item details from the backend (you may need an API endpoint to fetch details based on Product ID)
    fetch('fetch_product_details.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ productID: productID }),
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json();
    })
    .then(data => {
        if (data.success) {
            // Add item to the list
            const item = {
                productID: productID,
                productName: data.productName,
                quantity: quantity,
                price: data.price,
            };

            items.push(item);
            updateItemsUI();
            calculateRunningTotal();
        } else {
            displayMessage('red', 'Error fetching product details: ' + data.message);
        }
    })
    .catch(error => {
        console.error('Error:', error);
        displayMessage('red', 'Error adding item: ' + error.message);
    });
}

function removeItem() {
    const productID = document.getElementById('productIDAdd').value;

    // Remove the item from the list based on Product ID
    items = items.filter(item => item.productID !== productID);

    updateItemsUI();
    calculateRunningTotal();
}

function updateItemsUI() {
    const itemsContainer = document.getElementById('itemsContainer');

    // Clear existing content
    itemsContainer.innerHTML = '';

    // Loop through items and create HTML elements
    items.forEach(item => {
        const itemElement = document.createElement('div');
        itemElement.innerHTML = `
            <p><strong>${item.productName}</strong></p>
            <p>Quantity: ${item.quantity}</p>
            <p>Price: $${item.price.toFixed(2)}</p>
            <hr>
        `;

        // Append the item element to the container
        itemsContainer.appendChild(itemElement);
    });
}

function calculateRunningTotal() {
    // Calculate the running total based on item prices and quantities
    runningTotal = items.reduce((total, item) => total + item.price * item.quantity, 0);

    // Update the running total display
    document.getElementById('runningTotal').textContent = runningTotal.toFixed(2);
}

function finalizeSale() {
    // Redirect to the final_sale.html page with items and running total as query parameters
    const queryString = items.map(item => `productID[]=${item.productID}&quantity[]=${item.quantity}`).join('&');
    window.location.href = `final_sale.html?${queryString}&total=${runningTotal.toFixed(2)}`;
}

function displayMessage(color, message) {
    // Display a message in the message area
    const messageElement = document.getElementById('message');
    messageElement.style.color = color;
    messageElement.textContent = message;
}
