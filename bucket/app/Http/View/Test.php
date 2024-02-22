<?php

namespace App\Http\View;

class Test
{
    public static function info()
    {
        echo phpinfo();
    }

    public static function database()
    {
        // PHP PDO ???
        $host = "192.168.1.41:8815";
        $database = "webadmin";
        $username = "webadmin";
        $password = "SuP9r*S3cr3t";

        // mysqli Class
        try {
            $connection = new mysqli($host, $username, $password, $database);

            // Check connection
            if ($connection->connect_error) {
                die("mysql::class() connect failed: " . $connection->connect_error);
            }
            echo "mysql::class() connects successfully";

            $connection->close();

        } catch(Exception $e) {
            echo "mysql::class() connect failed: " . $e->getMessage() . ' - ' . $host;
        }

        echo "<br>";

        // mysqli Function
        try {
            $connection = mysqli_connect($host, $username, $password, $database);

            if (! $connection) {
                die("mysqli_connect() connect failed: " . mysqli_connect_error());

                exit;
            }

            echo "mysqli_connect() connects successfully";

            mysqli_close($connection);

        } catch(Exception $e) {
            echo "mysqli_connect() connect failed: " . $e->getMessage() . ' - ' . $host;
        }

        echo "<br>";

        // PDO
        try {
            $connection = new PDO("mysql:host=$host;dbname=$database", $username, $password);

            // Set PDO error mode to exception
            $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            echo "PDO connects successfully";

        } catch(\PDOException $e) {
            echo "PDO connect failed: " . $e->getMessage();
        }
    }

}
