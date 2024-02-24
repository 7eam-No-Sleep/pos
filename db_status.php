<?php
include 'resources/config.php'; // Assuming this file contains your database connection code

// Check if the connection is successful
if ($conn->connect_error) {
    echo "No Connection";
} else {
    echo "Connected";
}

// Close the database connection (optional, but good practice)
$conn->close();
?>