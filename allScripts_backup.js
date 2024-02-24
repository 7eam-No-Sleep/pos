// Array to store items in the sale
let items = [];

// Function to add a customer
function addCustomer() {
    const firstName = document.getElementById('firstName').value;
    const lastName = document.getElementById('lastName').value;
    const contactNumber = document.getElementById('contactNumber').value;
    const email = document.getElementById('email').value;
    const street1 = document.getElementById('street1').value;
    const aptNo = document.getElementById('aptNo').value;
    const city = document.getElementById('city').value;
    const state = document.getElementById('state').value;
    const zipCode = document.getElementById('zipCode').value;
    const birthdate = document.getElementById('birthdate').value;

    const customerData = {
        firstName: firstName,
        lastName: lastName,
        contactNumber: contactNumber,
        email: email,
        street1: street1,
        aptNo: aptNo,
        city: city,
        state: state,
        zipCode: zipCode,
        birthdate: birthdate,
    }
    // Fetch product details from the server
    fetch('add_customer.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(customerData),
    })
    .then(response => {
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
            messageElement.textContent = 'Customer added successfully!';
            // You can choose to fetch the updated inventory data and refresh the UI here if needed
            fetchCustomerDetails();
        } else {
            messageElement.style.color = 'red';
            messageElement.textContent = 'Error adding customer: ' + data.message;
        }
    })
    .catch(error => {
        console.error('Error:', error);
        // Handle other errors or display error messages here
        displayMessage('red', 'Error adding customer: ' + error.message);
        alert('Error adding customer: ' + error.message);
    });
}

// Function to display items and calculate totals
function displayItems1() {
    const itemsContainer = document.getElementById('itemsContainer');
    const finalTotalElement = document.getElementById('finalTotal');

    // Retrieve items data from the URL
    const urlParams = new URLSearchParams(window.location.search);
    const itemsData = urlParams.get('items');

    if (itemsData) {
        // Parse the items data
        const items = JSON.parse(decodeURIComponent(itemsData));

        // Clear existing content
        itemsContainer.innerHTML = '';

        // Variables for running total
        let runningTotal = 0;

        // Loop through items and display them
        items.forEach(item => {
            const itemElement = document.createElement('div');

            // Ensure the price is defined and is a number
            if (typeof item.price === 'number') {
                const itemTotal = item.price * item.quantity;

                itemElement.innerHTML = `
                    <p>${item.productID} ${item.productName} $${item.price.toFixed(2)}</p>
                    <p></p>
                    <button onclick="removeItem(${item.productID})">Remove</button>
                    <hr>
                `;

                // Append the item element to the container
                itemsContainer.appendChild(itemElement);

                // Update running total
                runningTotal += itemTotal;
            }
        });

        // Update the running total display
        finalTotalElement.textContent = runningTotal.toFixed(2);
    }
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
                <p>${item.productID} ${item.productName} $${item.price.toFixed(2)} ${item.quantity} $${itemTotal.toFixed(2)}
                <button onclick="removeItem(${item.productID})">Remove</button></p>
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

// Function to finalize the sale
function finalizeSale() {
    // Your code for finalizing the sale

    // Open final_sales.html in window
    window.location.href = 'final_sale.html';
}

// Call the displayItems function when the page loads
document.addEventListener('DOMContentLoaded', displayItems);

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
			<p>Material: ${product.Material}</p>
			<p>Size: ${product.Size}</p>
			<pColor: ${product.Color}</p>
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
			<p>Material: ${product.Material}</p>
			<p>Size: ${product.Size}</p>
			<pColor: ${product.Color}</p>
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
// Function to fetch and display customers
function fetchAndDisplayCustomers() {
    // Fetch customers from the server
    fetch('fetch_customers.php')
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            if (data.success) {
                // Display customers in the table
                displayCustomers(data.customers);
            } else {
                alert('Error fetching customers: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Error fetching customers: ' + error.message);
        });
}

// Function to display customers in the table
function displayCustomers(customers) {
    // Get the customers table and body
    const customersTable = document.getElementById('customersTable');
    const customersBody = document.getElementById('customersBody');

    // Check if the table and body elements exist
    if (!customersTable || !customersBody) {
        console.error('Customers table or body not found');
        return;
    }

    // Clear existing content
    customersBody.innerHTML = '';

    // Loop through customers and append rows to the table
    customers.forEach(customer => {
        const row = document.createElement('tr');

        row.innerHTML = `
            <td>${customer.CustomerID}</td>
            <td>${customer.FirstName}</td>
            <td>${customer.LastName}</td>
            <td>${customer.ContactNumber}</td>
            <td>${customer.Email}</td>
            <td>${customer.Street1}</td>
            <td>${customer.AptNo}</td>
            <td>${customer.City}</td>
            <td>${customer.State}</td>
            <td>${customer.ZipCode}</td>
            <td>${customer.Birthdate}</td>
        `;

        customersBody.appendChild(row);
    });

    // Make the table visible
    customersTable.style.display = 'table';
}

// Call the fetchAndDisplayCustomers function when the page loads
document.addEventListener('DOMContentLoaded', fetchAndDisplayCustomers);

document.addEventListener('DOMContentLoaded', function () {
    const productsTable = document.getElementById('productsTable');
    const productsBody = document.getElementById('productsBody');

    if (productsTable && productsBody) {

// Function to fetch and display products
function fetchAndDisplayProducts() {
    // Fetch products from the server
    fetch('fetch_products.php')
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            if (data.success) {
                // Display products in the table
                displayProducts(data.products);
            } else {
                alert('Error fetching products: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Error fetching products: ' + error.message);
        });
}

// Function to display products in the table
function displayProducts(products) {
    const productsTable = document.getElementById('productsTable');
    const productsBody = document.getElementById('productsBody');

    // Clear existing content
    productsBody.innerHTML = '';

    // Loop through products and append rows to the table
    products.forEach(product => {
        const row = document.createElement('tr');

        row.innerHTML = `
            <td>${product.ProductID}</td>
            <td>${product.ProductName}</td>
            <td>${product.Category}</td>
            <td>${product.Description}</td>\
			<td>${product.Material}</td>
			<td>${product.Size}</td>
			<td>${product.Color}</td>
            <td>${product.CostPrice}</td>
            <td>${product.SellingPrice}</td>
            <td>${product.QuantityInStock}</td>
        `;

        productsBody.appendChild(row);
    });

    // Make the table visible
    productsTable.style.display = 'table';
}

// Call the fetchAndDisplayProducts function when the page loads
document.addEventListener('DOMContentLoaded', fetchAndDisplayProducts);

fetchAndDisplayProducts();
    }
});


