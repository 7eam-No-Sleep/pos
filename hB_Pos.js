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

    // Fetch product details from the server
    fetch('add_customer.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
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
        }),
    })
    .then(handleResponse)
    .catch(handleError);
}

// Function to add a product
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
    .then(handleResponse)
    .then(data => {
        if (data.success) {
            displayMessage('green', 'Product added successfully!');
            fetchInventory();
        } else {
            displayMessage('red', 'Error adding product: ' + data.message);
        }
    })
    .catch(handleError);
}

// Function to check database status
function checkDatabaseStatus() {
    fetch('db_status.php')
        .then(response => response.text())
        .then(data => {
            const dbStatusElement = document.getElementById('dbStatus');
            dbStatusElement.textContent = 'Database: ' + data;
        })
        .catch(handleError);
}

// Function to display customers in the table
function displayCustomers(customers) {
    const customersTable = document.getElementById('customersTable');
    const customersBody = document.getElementById('customersBody');

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

// Function to display inventory data
function displayInventory(inventoryData) {
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
        inventoryContainer.appendChild(productElement);
    });
}

// Function to fetch and display customers
function fetchAndDisplayCustomers() {
    fetch('fetch_customers.php')
        .then(handleResponse)
        .then(data => {
            if (data.success) {
                displayCustomers(data.customers);
            } else {
                alert('Error fetching customers: ' + data.message);
            }
        })
        .catch(handleError);
}

// Function to fetch and display inventory
function fetchAndDisplayInventory() {
    fetch('fetch_inventory.php')
        .then(handleResponse)
        .then(data => {
            if (data.success) {
                document.getElementById('dbStatusIndicator').style.backgroundColor = 'green';
                displayInventory(data.inventory);
            } else {
                document.getElementById('dbStatusIndicator').style.backgroundColor = 'red';
                displayMessage('red', 'Error fetching inventory: ' + data.message);
            }
        })
        .catch(handleError);
}

// Function to fetch customer details by phone number
function fetchCustomerDetails() {
    const phoneNumber = document.getElementById('customerSelection').value;

    if (phoneNumber) {
        fetchCustomerDetailsByPhoneNumber(phoneNumber)
            .then(customerData => {
                if (customerData.success) {
                    document.getElementById('customerID').value = customerData.customerID;
                    document.getElementById('customerLastName').value = customerData.lastName;
                    fetchProductDetails();
                } else {
                    console.error('Error fetching customer details:', customerData.message);
                    displayMessage('red', 'Error fetching customer: ' + customerData.message);
                }
            })
            .catch(handleError);
    } else {
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
    .then(handleResponse);
}

// Function to fetch inventory and update the UI
function fetchInventory() {
    fetch('fetch_inventory.php')
        .then(handleResponse)
        .then(data => {
            updateInventoryUI(data);
        })
        .catch(handleError);
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
    .then(handleResponse);
}

// Function to finalize the sale
function finalizeSale() {
    // Your code for finalizing the sale
    window.location.href = 'final_sale.html';
}

// Function to handle fetch response
function handleResponse(response) {
    if (!response.ok) {
        throw new Error('Network response was not ok');
    }
    return response.json();
}

// Function to handle errors
function handleError(error) {
    console.error('Error:', error);
    displayMessage('red', 'Error: ' + error.message);
}

// Function to update inventory UI
function updateInventoryUI(inventoryData) {
    const inventoryContainer = document.getElementById('inventoryContainer');
    inventoryContainer.innerHTML = '';
    displayInventory(inventoryData);
}

// Call the functions when the page loads
document.addEventListener('DOMContentLoaded', () => {
    fetchAndDisplayCustomers();
    fetchAndDisplayInventory();
    checkDatabaseStatus();
});
