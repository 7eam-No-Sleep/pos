// menu.js

document.addEventListener('DOMContentLoaded', function () {
    // Create a div element for the button container
    const buttonContainer = document.createElement('div');
    buttonContainer.className = 'button-container';

    // Define an array of menu items
    const menuItems = [
        { text: 'View Inventory', href: 'view_inventory.html' },
        { text: 'Add Product', href: 'add_product.html' },
        { text: 'Sales', href: 'sales.html' },
        { text: 'View Customers', href: 'view_customers.html' },
        { text: 'Add Customer', href: 'add_customer.html' },
    ];

    // Loop through the menu items and create anchor elements
    menuItems.forEach(item => {
        const anchor = document.createElement('a');
        anchor.href = item.href;
        anchor.className = 'button';
        anchor.textContent = item.text;

        // Append each anchor element to the button container
        buttonContainer.appendChild(anchor);
    });

    // Append the button container to the body of the document
    document.body.appendChild(buttonContainer);
});