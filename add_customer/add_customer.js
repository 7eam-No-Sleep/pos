// add_customer.js

// Function to add a customer
function addCustomerToDatabase() {
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
    };

    // Fetch customer details from the server
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
                // You can choose to fetch the updated customer data and refresh the UI here if needed
                // fetchCustomerDetails();
            } else {
                messageElement.style.color = 'red';
                messageElement.textContent = 'Error adding customer: ' + data.message;
            }
        })
        .catch(error => {
            console.error('Error:', error);
            // Handle other errors or display error messages here
            const messageElement = document.getElementById('message');
            messageElement.style.color = 'red';
            messageElement.textContent = 'Error adding customer: ' + error.message;
        });
}
