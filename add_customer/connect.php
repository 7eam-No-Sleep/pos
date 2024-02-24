<?php
$servername = "localhost";
$username = "Honey";
$password = "Darrien";
$database = "inventory_management";

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>