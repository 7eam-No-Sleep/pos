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

// Call the fetchAndDisplayCustomers function when the page loads
document.addEventListener('DOMContentLoaded', fetchAndDisplayCustomers);
