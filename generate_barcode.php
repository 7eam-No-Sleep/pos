<?php
require_once __DIR__ . '/vendor/autoload.php';

use Mike42\Escpos\PrintConnectors\FilePrintConnector;
use Mike42\Escpos\Printer;

// Check if the productId is provided in the request parameters
if (isset($_GET['productId'])) {
    // Retrieve the productId from the query parameters
    $productId = intval($_GET['productId']); // Ensure productId is cast to an integer

    // Construct the ZPL code with the retrieved product ID
    $zplCode = '^XA' .
        '^FO50,50' .
        '^BY3' .
        '^BCN,100,Y,N,N' .
        '^FD' . $productId . '^FS' . // Barcode data
        '^FO50,150' .                  // Position for the text "Honey-Be's" (adjust as needed)
        '^A0N,30,30' .                 // Font specification for the text
        '^FDHoney-Be\'s^FS' .          // Text to print above the barcode
        '^XZ';

    // Wrap the ZPL code with passthrough start and end sequences
    $passthroughData = '${' . $zplCode . '}$';

    try {
        // Connect to the printer
        $connector = new FilePrintConnector('usb001'); // Use usb001 as the printer port
        $printer = new Printer($connector);

        // Send passthrough data to the printer
        $printer->textRaw($passthroughData);

        // Close the connection
        $printer->close();

        // Respond with a success message
        echo "Barcode printed successfully.";
    } catch (Exception $e) {
        // Log the error for debugging purposes
        error_log("Error printing barcode: " . $e->getMessage());

        // Respond with an error message
        echo "Error printing barcode. Please try again later.";
    }
} else {
    // If productId is missing, respond with an error message
    echo "No product ID found in the request parameters.";
}
?>
