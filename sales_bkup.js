// Array to store items in the sale
let items = [];

// Function to fetch customer details by phone number
function fetchCustomerDetails() {
    const phoneNumber = document.getElementById('customerSelection').value;

    if (phoneNumber) {
        // Fetch customer details from the server
        fetchCustomerDetailsByPhoneNumber(phoneNumber)
            .then(customerData => {
                if (customerData.success) {
                    // If customer exists, update customer information
                    document.getElementById('customerID').value = customerData.customerID;
                    document.getElementById('customerLastName').value = customerData.lastName;

                    // Proceed with fetching product details
                    fetchProductDetails();
                } else {
                    console.error('Error fetching customer details:', customerData.message);
                    displayMessage('red', 'Error fetching customer: ' + customerData.message);
                }
            })
            .catch(error => {
                console.error('Error fetching customer details:', error);
                displayMessage('red', 'Error fetching customer: ' + error.message);
            });
    } else {
        // Proceed with fetching product details without customer information
        fetchProductDetails();
    }
}

// Function to fetch customer details by phone number from the server
function fetchCustomerDetailsByPhoneNumber(phoneNumber) {
    return fetch('fetch_customer_details_by_phone.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            phoneNumber: phoneNumber,
        }),
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        });
}

// Modify the addItem function
function addItem() {
    const productID = document.getElementById('productIDAdd').value;
    const customerID = document.getElementById('customerID').value;
    const lastName = document.getElementById('customerLastName').value;

    // Proceed with fetching product details
    fetchProductDetails(productID, customerID, lastName)
        .then(data => {
            if (data.success) {
                const productName = data.productName;
                const price = parseFloat(data.price);

                // Add item to the array
                items.push({
                    productID: productID,
                    customerID: customerID,
                    productName: productName,
                    price: price,
                    quantity: 1
                });

                // Update the display
                displayItems();
            } else {
                console.error('Error fetching product details:', data.message);
                displayMessage('red', 'Error adding item: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            displayMessage('red', 'Error adding item: ' + error.message);
        });
}

// Function to remove an item from the sale
function removeItem(productID) {
    // Remove item from the array
    items = items.filter(item => item.productID !== productID);

    // Update the display
    displayItems();
}

// Function to display items and calculate totals
function displayItems() {
    const itemsContainer = document.getElementById('itemsContainer');
    const runningTotalElement = document.getElementById('runningTotal');
    const salesTaxTotalElement = document.getElementById('salesTaxTotal');
    const finalTotalElement = document.getElementById('finalTotal');
    const receiptContainer = itemsContainer;

    // Clear existing content
    itemsContainer.innerHTML = '';

    // Variables for running total, sales tax, and final total
    let runningTotal = 0;
    let salesTaxTotal = 0;
    let finalTotal = 0;

    // Loop through items and display them
    items.forEach(item => {
        const itemElement = document.createElement('div');

        // Ensure the price is defined and is a number
        if (!isNaN(item.price)) {
            const itemTotal = item.price * item.quantity;

            itemElement.innerHTML = `
                <p>${item.productName} - $${item.price.toFixed(2)} x ${item.quantity}</p>
                <p>Total: $${itemTotal.toFixed(2)}</p>
                <button onclick="removeItem(${item.productID})">Remove</button>
                <hr>
            `;

            // Append the item element to the container
            itemsContainer.appendChild(itemElement);

            // Update running total
            runningTotal += itemTotal;
        }
    });

    // Calculate sales tax (10%)
    salesTaxTotal = runningTotal * 0.10;

    // Calculate final total (items total + sales tax)
    finalTotal = runningTotal + salesTaxTotal;

    // Update the displays
    runningTotalElement.textContent = runningTotal.toFixed(2);
    salesTaxTotalElement.textContent = salesTaxTotal.toFixed(2);
    finalTotalElement.textContent = finalTotal.toFixed(2);
}

// Function to fetch product details from the server
function fetchProductDetails(productID) {
    return fetch('fetch_product_details.php', {
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
        });
}

// Function to display a message
function displayMessage(color, message) {
    const messageElement = document.getElementById('message');
    messageElement.style.color = color;
    messageElement.textContent = message;
}

// Function to finalize the sale
function finalizeSale() {
    // Your code for finalizing the sale

    // Open final_sales.html in window
    window.location.href = 'final_sale.html';
}

// Call the displayItems function when the page loads
document.addEventListener('DOMContentLoaded', displayItems);
