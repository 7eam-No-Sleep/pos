// scanner
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
});

// Function to play the beep sound
function playBeepSound() {
    var beepSound = document.getElementById('beepSound');
    beepSound.play();
}

// Listen for barcode detection
Quagga.onDetected(function(result) {
    console.log("Barcode detected: ", result.codeResult.code);

    // Play the beep sound
    playBeepSound();

    // Add the detected barcode to the addItem field
    document.getElementById('productIDAdd').value = result.codeResult.code;

    // Automatically trigger the addItem function
    addItem();
});
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