// Function to display items and calculate totals
function displayItems() {
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
                    <p>${item.productName} - $${item.price.toFixed(2)} x ${item.quantity}</p>
                    <p>Total: $${itemTotal.toFixed(2)}</p>
                    <button onclick="removeItem('${item.productID}')">Remove</button>

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
