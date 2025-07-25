<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Bill Summary</title>
    <style>
        body {
            font-family: Verdana;
            margin: 0;
            padding: 0;
            background-image: url('./Images/restauarent/a-table-with-food-and-drinks-on-it-ai-generated-free-photo.jpg');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
            background-position: center;
        }

        .container {
            max-width: 800px;
            margin-top: 200px;
            margin-left: 420px;
            padding: 20px;
            border: 1px solid rgba(255, 189, 47, 0.6);
            border-radius: 10px;
            background-color: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
        }

        h1,
        h3 {
            text-align: center;
            margin-bottom: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table,
        th,
        td {
            border: 1px solid rgb(22, 22, 22);
        }

        th,
        td {
            padding: 8px;
            text-align: left;
        }

        th {
            color: rgb(255, 189, 47);
            background-color: rgb(22, 22, 22);
        }

        .footer {
            text-align: center;
            margin-top: 20px;
        }

        img {
            width: 200px;
            height: 80px;
        }

        .btncal {
            background-color: rgb(255, 255, 255);
            color: rgb(14, 14, 14);
            padding: 15px 50px;
            border: 1px;
            border-radius: 10px;
            cursor: pointer;
            font-family: Verdana;
            font-size: 20px;
            float: center;
            margin-top: 20px;
            margin-left: 44.5%;
        }

        .btncal:hover {
            background-color: rgb(255, 189, 47);
            color: rgb(14, 14, 14);
            transition: 0.7s ease;
            font-size: 25px;
        }
    </style>
</head>

<body>
    <div class='container'>

        <center><img src="./Images/menu/unimo logo.png" alt="Unimo Logo"></center>

        <?php
        // Connect to database
        $conn = mysqli_connect("localhost", "root", "", "tablesnew");
        if (!$conn) {
            die("Connection failed: " . mysqli_connect_error());
        }

        // Get reservation_id safely
        $reservation_id = isset($_GET['reservation_id']) ? mysqli_real_escape_string($conn, $_GET['reservation_id']) : '';

        if (!$reservation_id) {
            echo "<p style='color:red; text-align:center;'>Invalid Reservation ID.</p>";
        } else {

            // Fetch payments data
            $sql_payments = "SELECT grandtotal_amount, payment_method FROM paymentsnew WHERE reservation_id = '$reservation_id'";
            $result_payments = mysqli_query($conn, $sql_payments);
            $data_payments = $result_payments ? mysqli_fetch_assoc($result_payments) : null;

            // Fetch orders data
            $sql_orders = "SELECT * FROM ordersnew WHERE reservation_id = '$reservation_id'";
            $result_orders = mysqli_query($conn, $sql_orders);
            $data_orders = $result_orders ? mysqli_fetch_all($result_orders, MYSQLI_ASSOC) : [];

            // Fetch reservation data
            $sql_reservation = "SELECT first_name, last_name, numberofguests, date, time, specialoccasion FROM reservationnew WHERE id = '$reservation_id'";
            $result_reservation = mysqli_query($conn, $sql_reservation);
            $data_reservation = $result_reservation ? mysqli_fetch_assoc($result_reservation) : null;

            // Display Reservation Details
            echo "<h1>Unimo Family Restaurant</h1>";
            echo "<h3>Bill Summary</h3>";

            echo "<div class='section'>";
            echo "<h2>Reservation Details</h2>";
            echo "<table>";
            echo "<tr><th>First Name</th><th>Last Name</th><th>Number of Guests</th><th>Date</th><th>Time</th><th>Special Occasion</th></tr>";

            if ($data_reservation) {
                echo "<tr>
                    <td>" . htmlspecialchars($data_reservation['first_name']) . "</td>
                    <td>" . htmlspecialchars($data_reservation['last_name']) . "</td>
                    <td>" . htmlspecialchars($data_reservation['numberofguests']) . "</td>
                    <td>" . htmlspecialchars($data_reservation['date']) . "</td>
                    <td>" . htmlspecialchars($data_reservation['time']) . "</td>
                    <td>" . htmlspecialchars($data_reservation['specialoccasion']) . "</td>
                </tr>";
            } else {
                echo "<tr><td colspan='6' style='text-align:center;'>No reservation details found.</td></tr>";
            }
            echo "</table>";
            echo "</div>";

            // Display Orders Details
            echo "<div class='section'>";
            echo "<h2>Orders Details</h2>";
            echo "<table>";
            echo "<tr><th>Reservation ID</th><th>Order ID</th><th>Table Number</th><th>Item Ordered</th><th>Item Amount</th><th>Quantity</th><th>Total Amount</th></tr>";

            if (!empty($data_orders)) {
                foreach ($data_orders as $order) {
                    echo "<tr>
                        <td>" . htmlspecialchars($order['reservation_id']) . "</td>
                        <td>" . htmlspecialchars($order['order_id']) . "</td>
                        <td>" . htmlspecialchars($order['table_number']) . "</td>
                        <td>" . htmlspecialchars($order['item_ordered_name']) . "</td>
                        <td>" . htmlspecialchars($order['amount']) . "</td>
                        <td>" . htmlspecialchars($order['quantity']) . "</td>
                        <td>" . htmlspecialchars($order['total_amount']) . "</td>
                    </tr>";
                }
            } else {
                echo "<tr><td colspan='7' style='text-align:center;'>No orders found.</td></tr>";
            }
            echo "</table>";
            echo "</div>";

            // Display Payments Details
            echo "<div class='section'>";
            echo "<h2>Payments Details</h2>";
            echo "<table>";
            echo "<tr><th>Grand Total Amount</th><th>Payment Method</th></tr>";

            if ($data_payments) {
                echo "<tr>
                    <td>" . htmlspecialchars($data_payments['grandtotal_amount']) . "</td>
                    <td>" . htmlspecialchars($data_payments['payment_method']) . "</td>
                </tr>";
            } else {
                echo "<tr><td colspan='2' style='text-align:center;'>No payment data found.</td></tr>";
            }
            echo "</table>";
            echo "</div>";
        }

        // Close connection
        mysqli_close($conn);
        ?>

        <div class='footer'>
            <p>Thank you for dining with us!</p>
        </div>
    </div>

    <br /><br /><br />

    <a href="payments.php"><button class="btncal" type="button" name="generate_report">BACK</button></a>

    <br /><br /><br /><br /><br /><br />
</body>

</html>
