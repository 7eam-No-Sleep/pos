// Array to store items in the sale
let items = [];

// Function to display items and calculate totals
function displayItems() {
    const itemsContainer = document.getElementById('itemsContainer');
    const runningTotalElement = document.getElementById('runningTotal');
    const salesTaxTotalElement = document.getElementById('salesTaxTotal');
    const finalTotalElement = document.getElementById('finalTotal');

    // Clear existing content
    itemsContainer.innerHTML = '';

    // Variables for running total, sales tax, and final total
    let runningTotal = 0;
    let salesTaxTotal = 0;
    let finalTotal = 0;

    // Loop through items and display them
    items.forEach((item, index) => {
        const itemElement = document.createElement('div');

        // Ensure the price is defined and is a number
        if (!isNaN(item.price)) {
            const itemTotal = item.price * item.quantity;

            itemElement.innerHTML = `
                <p>${item.productName} - $${item.price.toFixed(2)} x ${item.quantity}</p>
                <p>Total: $${itemTotal.toFixed(2)}</p>
                <button onclick="removeItemByIndex(${index})">Remove</button> <!-- Add remove button -->
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


// Function to remove an item from the sale
function removeItem(productID) {
    // Remove item from the array
    items = items.filter(item => item.productID !== productID);

    // Update the display
    displayItems();
}
// Function to remove an item from the sale by productID
function removeItemByProductID(productID) {
    // Remove item from the array
    items = items.filter(item => item.productID !== productID);

    // Update the display
    displayItems();
}

// Function to remove an item from the sale by index
function removeItemByIndex(index) {
    // Remove item from the array at the specified index
    items.splice(index, 1);

    // Update the display
    displayItems();
}
// Call the displayItems function when the page loads
document.addEventListener('DOMContentLoaded', displayItems);


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
                    document.getElementById('customerFirstName').value = customerData.firstName;
                    document.getElementById('customerLastName').value = customerData.lastName;

                    // Proceed with fetching customer details
                    fetchCustomerDetailsByPhoneNumber();
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
        fetchCustomerDetailsByPhoneNumber();
    }
}

// Function to fetch customer details by phone number from the server
function fetchCustomerDetailsByPhoneNumber(phoneNumber) {
    return fetch('fetch_customer_details.php', {
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


// Function to add an item to the sale
function addItem() {
    const productID = document.getElementById('productIDAdd').value;

    // Proceed with fetching product details
    fetchProductDetails(productID)
        .then(data => {
            if (data.success) {
                const productName = data.productName;
                const price = parseFloat(data.price);

                // Add item to the array
                items.push({
                    productID: productID,
                    productName: productName,
                    price: price,
                    quantity: 1
                });

                // Update the display immediately after adding the item
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
// Function to remove an item from the sale by index  SHOULD WORK!!!!!
function removeItemInCart(index) {
    // Remove item from the array at the specified index
    items.splice(index, 1);

    // Update the display
    displayItems();
}
// Function to display items and calculate totals
/*function displayItems() {
    const itemsContainer = document.getElementById('itemsContainer');
    const runningTotalElement = document.getElementById('runningTotal');
    const salesTaxTotalElement = document.getElementById('salesTaxTotal');
    const finalTotalElement = document.getElementById('finalTotal');

    // Retrieve items data from the URL
    //const urlParams = new URLSearchParams(window.location.search);
    //const itemsData = urlParams.get('items');

    // Clear existing content
    itemsContainer.innerHTML = '';

    // Variables for running total, sales tax, and final total
    let runningTotal = 0;
    let salesTaxTotal = 0;
    let finalTotal = 0;

    if (itemsData) {
        // Parse the items data
        const items = JSON.parse(decodeURIComponent(itemsData));

        // Loop through items and display them
        items.forEach(item => {
            const itemElement = document.createElement('div');

            // Ensure the price is defined and is a number
            if (!isNaN(item.price)) {
                const itemTotal = item.price * item.quantity;

                itemElement.innerHTML = `
                    <p>${item.productName} - $${item.price.toFixed(2)} x ${item.quantity}</p>
                    <p>Total: $${itemTotal.toFixed(2)}</p>
                    <hr>
                `;

                // Append the item element to the container
                itemsContainer.appendChild(itemElement);

                // Update running total
                runningTotal += itemTotal;
            }
        });
    }

    // Calculate sales tax (10%)
    salesTaxTotal = runningTotal * 0.10;

    // Calculate final total (items total + sales tax)
    finalTotal = runningTotal + salesTaxTotal;

    // Update the displays
    runningTotalElement.textContent = runningTotal.toFixed(2);
    salesTaxTotalElement.textContent = salesTaxTotal.toFixed(2);
    finalTotalElement.textContent = finalTotal.toFixed(2);
// Call the displayItems function when the page loads
    document.addEventListener('DOMContentLoaded', displayItems);
}
*/



// Function to fetch customer details
function fetchCustomerDetails() {
    let customerPhoneNumber = document.getElementById('customerSelection').value; // Proceed with fetching customer details
    fetchCustomerDetailsByPhoneNumber(customerPhoneNumber)
        .then(data => {
            if (data.success) {
                // Display customer details under "Receipt"
                const customerDetailsContainer = document.getElementById('customerDetails');
                customerDetailsContainer.innerHTML = `<p><strong>Valued Customer #</strong> ${data.customerID} ${data.firstName} ${data.lastName}`;
            } else {
                console.error('Error fetching customer details:', data.message);
                displayMessage('red', 'Error fetching customer details: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            displayMessage('red', 'Error fetching customer details: ' + error.message);
        });
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

// Function to finalize the sale DARRIENISCUTE
function finalizeSale() {
    // Retrieve relevant data from the form and URL
    const itemsData = encodeURIComponent(JSON.stringify(items));
    const customerPhoneNumber = document.getElementById('customerSelection').value;

    // Prepare the proposed sale object
    const proposedSale = {
        items: items,
        customerPhoneNumber: customerPhoneNumber,
        runningTotal: parseFloat(document.getElementById('runningTotal').textContent),
        salesTaxTotal: parseFloat(document.getElementById('salesTaxTotal').textContent),
        finalTotal: parseFloat(document.getElementById('finalTotal').textContent)
    };

    // Redirect to the final_sale.html page with the proposedSale data as a query parameter
    const proposedSaleData = encodeURIComponent(JSON.stringify(proposedSale));
    window.location.href = `final_sale.html?proposedSale=${proposedSaleData}`;
}

// Call the displayItems function when the page loads
document.addEventListener('DOMContentLoaded', displayItems);


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

