<!DOCTYPE html>
<html>
<head>
    <title>Insert Order</title>
</head>
<body>
<center>
<?php
// Enable error reporting
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Connect to database
$conn = new mysqli("localhost", "root", "", "tablesnew");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get and sanitize input
$reservation_id    = isset($_REQUEST['reservation_id']) ? (int)$_REQUEST['reservation_id'] : 0;
$table_number      = isset($_REQUEST['table']) ? (int)$_REQUEST['table'] : 0;
$item_ordered_name = isset($_REQUEST['item_orded_name']) ? trim($_REQUEST['item_orded_name']) : '';
$quantity          = isset($_REQUEST['quantity']) ? (int)$_REQUEST['quantity'] : 0;
$amount            = isset($_REQUEST['amount']) ? (float)$_REQUEST['amount'] : 0.0;

// Calculate total amount
$total_amount = $quantity * $amount;

// Prepare SQL statement
$stmt = $conn->prepare("INSERT INTO ordersnew (reservation_id, table_number, item_ordered_name, quantity, amount, total_amount) VALUES (?, ?, ?, ?, ?, ?)");

if (!$stmt) {
    die("Prepare failed: " . $conn->error);
}

// Bind parameters and execute
$stmt->bind_param("iisidd", $reservation_id, $table_number, $item_ordered_name, $quantity, $amount, $total_amount);

if ($stmt->execute()) {
    echo '<script>alert("Order stored in database successfully!");</script>';
    echo '<script>window.location.href="oders.php";</script>';
} else {
    echo "ERROR: Could not execute query: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>
</center>
</body>
</html>
