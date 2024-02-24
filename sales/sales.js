// Array to store items in the sale
let items = [];
let customerID;

// Function to display items and calculate totals
function displayItems() {
    const itemsContainer = document.getElementById('itemsContainer');
    const runningTotalElement = document.getElementById('runningTotal');
    const salesTaxTotalElement = document.getElementById('salesTaxTotal');
    const finalTotalElement = document.getElementById('finalTotal');
    const discountElement = document.getElementById('discount');

    // Clear existing content
    itemsContainer.innerHTML = '';

    // Variables for running total, sales tax, final total, and discount
    let runningTotal = 0;
    let salesTaxTotal = 0;
    let finalTotal = 0;
    let discount = 0;
    let discountReason = '';

    // Loop through items and display them
    items.forEach((item, index) => {
        const itemElement = document.createElement('div');

        // Ensure the price is defined and is a number
        if (!isNaN(item.price)) {
            const itemTotal = item.price * item.quantity;

            itemElement.innerHTML = `
                <p>${item.productID} - ${item.productName} - $${item.price.toFixed(2)} $${itemTotal.toFixed(2)}
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

    // Calculate final total (items total + sales tax - discount)
    finalTotal = runningTotal + salesTaxTotal - discount;

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

                    // Assign the customerID to the global variable
                    customerID = customerData.customerID;

                    // Call finalizeTransaction() after fetching customer details
                    finalizeTransaction();
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
// Function to show loader
function showLoader() {
    // Show loader element
    document.getElementById('loader').style.display = 'block';
}

// Function to hide loader
function hideLoader() {
    // Hide loader element
    document.getElementById('loader').style.display = 'none';
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

// Function to fetch customer details
function fetchCustomerDetails() {
    let customerPhoneNumber = document.getElementById('customerSelection').value; // Proceed with fetching customer details
    fetchCustomerDetailsByPhoneNumber(customerPhoneNumber)
        .then(data => {
            if (data.success) {
                // Display customer details under "Receipt"
                const customerDetailsContainer = document.getElementById('customerDetails');
                customerDetailsContainer.innerHTML = `<p><strong>Customer #</strong> ${data.customerID} ${data.firstName} ${data.lastName}`;
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
        body: JSON.stringify({productID: productID}),
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


// Call the displayItems function when the page loads
document.addEventListener('DOMContentLoaded', displayItems);


function displayMessage(color, message) {
    // Display a message in the message area
    const messageElement = document.getElementById('message');
    messageElement.style.color = color;
    messageElement.textContent = message;
}

// Function to add a percentage discount to the sale
function addDiscount() {
    const discountReason = document.getElementById('discountReason').value;
    const discountPercentage = parseFloat(document.getElementById('discountAmount').value);

    // Check if discount percentage is valid
    if (isNaN(discountPercentage) || discountPercentage <= 0 || discountPercentage > 100) {
        displayMessage('red', 'Please enter a valid discount percentage.');
        return;
    }

    // Retrieve the current running total
    const runningTotalElement = document.getElementById('runningTotal');
    let runningTotal = parseFloat(runningTotalElement.textContent);

    // Calculate the discount amount based on the percentage
    const discountAmount = (discountPercentage / 100) * runningTotal;

    // Apply the discount to the running total
    runningTotal -= discountAmount;

    // Track the previous discount amount and reason
    previousDiscountAmount = discountAmount;
    previousDiscountReason = discountReason;

    // Update the running total display
    runningTotalElement.textContent = runningTotal.toFixed(2);

    // Recalculate sales tax and final total
    const salesTaxTotalElement = document.getElementById('salesTaxTotal');
    const finalTotalElement = document.getElementById('finalTotal');
    let salesTaxTotal = runningTotal * 0.10; // 10% sales tax
    let finalTotal = runningTotal + salesTaxTotal;

    // Update the sales tax and final total displays
    salesTaxTotalElement.textContent = salesTaxTotal.toFixed(2);
    finalTotalElement.textContent = finalTotal.toFixed(2);

    // Display message indicating discount applied
    displayMessage('green', `Discount of $${discountAmount.toFixed(2)} applied for ${discountReason}.`);
}

// Function to remove the discount from the sale
let previousDiscountAmount = 0;
let previousDiscountReason = '';

function removeDiscount() {
    // Retrieve the current running total
    const runningTotalElement = document.getElementById('runningTotal');
    let runningTotal = parseFloat(runningTotalElement.textContent);

    // Add the previous discount amount back to the running total
    runningTotal += previousDiscountAmount;

    // Reset the previous discount amount and reason
    previousDiscountAmount = 0;
    previousDiscountReason = '';

    // Update the running total display
    runningTotalElement.textContent = runningTotal.toFixed(2);

    // Recalculate sales tax and final total
    const salesTaxTotalElement = document.getElementById('salesTaxTotal');
    const finalTotalElement = document.getElementById('finalTotal');
    let salesTaxTotal = runningTotal * 0.10; // 10% sales tax
    let finalTotal = runningTotal + salesTaxTotal;

    // Update the sales tax and final total displays
    salesTaxTotalElement.textContent = salesTaxTotal.toFixed(2);
    finalTotalElement.textContent = finalTotal.toFixed(2);

    // Display message indicating discount removed
    displayMessage('red', `Discount of $${previousDiscountAmount.toFixed(2)} for ${previousDiscountReason} removed.`);
}

/* scanner
Quagga.init({
    inputStream: {
        name: "Live",
        type: "LiveStream",
        target: document.querySelector('#cameraContainer'),
        constraints: {
            width: 640,
            height: 480,
            facingMode: "environment" // or "user" for front camera
        },
    },
    decoder: {
        readers: ["ean_reader"] // Specify the barcode types you want to scan
    }
}, function(err) {
    if (err) {
        console.error("Failed to initialize Quagga: ", err);
        return;
    }
    console.log("Quagga initialized successfully");

    Quagga.start();
});*/

// Function to play the beep sound
function playBeepSound() {
    var beepSound = document.getElementById('beepSound');
    beepSound.play();
}

/* Listen for barcode detection
Quagga.onDetected(function(result) {
    console.log("Barcode detected: ", result.codeResult.code);

    // Play the beep sound
    playBeepSound();

    // Add the detected barcode to the addItem field
    document.getElementById('productIDAdd').value = result.codeResult.code;

    // Automatically trigger the addItem function
    addItem();
});*/
// Function to change the camera
function changeCamera() {
    var selectedCamera = document.getElementById('cameraSelection').value;
    Quagga.stop(); // Stop the current camera stream
    Quagga.init({
        inputStream: {
            name: "Live",
            type: "LiveStream",
            target: document.querySelector('#cameraContainer'),
            constraints: {
                width: 640,
                height: 480,
                facingMode: selectedCamera // Set the facing mode to the selected camera
            },
        },
        decoder: {
            readers: ["ean_reader"]
        }
    }, function(err) {
        if (err) {
            console.error("Failed to initialize Quagga: ", err);
            return;
        }
        console.log("Quagga initialized successfully");
        Quagga.start(); // Start the new camera stream
    });
}

// Function to manually start the scan
function startScanManually() {
    Quagga.start();
}

// Function to stop the scan
function stopScan() {
    Quagga.stop();
}
function logout() {
    // Make an AJAX request to logout.php
    fetch('../logout.php')
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                // Redirect to the login page after successful logout
                window.location.href = '../index.php';
            } else {
                // Display an error message if logout fails
                alert(data.message);
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
}
// JavaScript code to display the current date
const currentDateElement = document.getElementById('currentDate');
const currentDate = new Date();
const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
const formattedDate = currentDate.toLocaleDateString('en-US', options);
currentDateElement.textContent = formattedDate;

function finishSale() {
    // Placeholder function for finishing the sale
    console.log('Sale finished');
}

// Function to handle toggling of cash field
function toggleCashField() {
    const cashField = document.getElementById('cashField');
    cashField.style.display = cashField.style.display === 'none' ? 'block' : 'none';
}

// Function to handle toggling of check field
function toggleCheckField() {
    const checkField = document.getElementById('checkField');
    checkField.style.display = checkField.style.display === 'none' ? 'block' : 'none';
}

// Function to handle toggling of credit/debit field
function toggleCreditDebitField() {
    const creditDebitField = document.getElementById('creditDebitField');
    creditDebitField.style.display = creditDebitField.style.display === 'none' ? 'block' : 'none';
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

// Function to handle the Finalize Transaction button click event
function confirmAndFinalize() {
    if (confirm("Are you sure you want to finalize the transaction?")) {
        // Here, you can perform finalization tasks such as recording transaction information in the database.
        finalizeTransaction();
    }
}
// Function to calculate change
function calculateChange() {
    const cashReceived = parseFloat(document.getElementById('cashReceived').value);
    const finalTotal = parseFloat(document.getElementById('finalTotal').textContent);
    const change = cashReceived - finalTotal;
    document.getElementById('changeGiven').textContent = change.toFixed(2);
}

// Function to finalize the sale
function finalizeTransaction() {
    const phoneNumber = document.getElementById('customerSelection').value;

    if (phoneNumber) {
        // Fetch customer details from the server
        fetchCustomerDetailsByPhoneNumber(phoneNumber)
            .then(customerData => {
                if (customerData.success) {
                    // If customer exists, update customer information
                    const customerID = customerData.customerID; // Extract customer ID from the response data
                    document.getElementById('customerID').value = customerID;

                    // Retrieve relevant data from the form and URL
                    const itemsData = encodeURIComponent(JSON.stringify(items));
                    const customerPhoneNumber = phoneNumber; // Use the provided phone number
                    const discountReason = document.getElementById('discountReason').value;
                    const discountAmount = parseFloat(document.getElementById('discountAmount').value);
                    const salesPerson = document.getElementById('salesPerson').value; // Added sales person field

                    // Retrieve additional transaction data
                    const cashReceived = parseFloat(document.getElementById('cashReceived').value);
                    const checkNumber = document.getElementById('checkNumber').value;
                    const creditCardNumber = document.getElementById('creditCardNumber').value;
                    const expiryDate = document.getElementById('expiryDate').value;

                    // Prepare the proposed sale object
                    const proposedSale = {
                        items: items,
                        customerPhoneNumber: customerPhoneNumber,
                        runningTotal: parseFloat(document.getElementById('runningTotal').textContent),
                        salesTaxTotal: parseFloat(document.getElementById('salesTaxTotal').textContent),
                        finalTotal: parseFloat(document.getElementById('finalTotal').textContent),
                        discountReason: discountReason,
                        discountAmount: discountAmount,
                        salesPerson: salesPerson, // Added sales person field
                        cashReceived: cashReceived,
                        checkNumber: checkNumber,
                        creditCardNumber: creditCardNumber,
                        expiryDate: expiryDate,
                        customerID: customerID // Append customer ID directly
                    };

                    // Redirect to the final_sale.php page with the proposedSale data as a query parameter
                    const proposedSaleData = encodeURIComponent(JSON.stringify(proposedSale));
                    window.location.href = `final_sale.php?proposedSale=${proposedSaleData}`;
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
// Function to handle the Clear Transaction button click event
function clearTransaction() {
    if (confirm("Are you sure you want to clear the transaction?")) {
        // Reset all input fields
        document.querySelectorAll('input').forEach(input => input.value = '');
        // Optionally, you can reset other elements like dropdowns, textareas, etc.
    }
}