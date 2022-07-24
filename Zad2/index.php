<head>
    <title>Currency table</title>
    <style>
        table{
            border-collapse: collapse;
        }
        td, tr, th{
            border: 1px solid black;
            padding: 3px;
        }
    </style>
</head>
<main>
    <table>
        <tr><th>Currency</th><th>Code</th><th>Value</th><th>Status</th></tr>
    <?php
        function setupConnection(){
            $conn = new mysqli("localhost","root","","currency_database");
            if($conn->connect_error) {
                echo "Connection failed: " . $conn->connect_error;
                return false;
            }
            return $conn; 
        }
        function getCurrencyFromDatabase($db){
            $sql = "SELECT * FROM Currency";
            return $db->query($sql);
        }
        function getCurrencyData(){
            $apiLink = "http://api.nbp.pl/api/exchangerates/tables/a/?format=json";
            $apiJSON = file_get_contents($apiLink);
            $apiResult = json_decode($apiJSON);
            return $apiResult[0]->rates;
        }
        function checkIfInBase($baseArr,$compareValue){
            // returns [arrPos, baseId] if found and false if not
            $i = 0;
            foreach($baseArr as $item){
                if($item[2] == $compareValue){
                    return [$i,$item[0]];
                }
                $i++;
            }
            return false;
        }
        function queryWithValidation($conn, $query){
            if(!$conn->query($query) === TRUE){
                return $conn->error;
            }
        }
        function renderRow($name, $code, $value, $status){
            echo "<tr><td>$name</td><td>$code</td><td>$value</td><td>$status</td></tr>";
        }
        $db = setupConnection();
        if($db){
            $databaseArr = getCurrencyFromDatabase($db)->fetch_all();
            $ratesArray = getCurrencyData();
            $status = "";
            foreach($ratesArray as $rateObj){
                if($keyArr = checkIfInBase($databaseArr, $rateObj->code)){
                    //$keyArr = [arrPos, baseId];
                    if($databaseArr[$keyArr[0]][3] != $rateObj->mid){
                        $update = "UPDATE Currency SET exchange_rate=$rateObj->mid WHERE id=$keyArr[1]";
                        $status = $status = queryWithValidation($db, $update) ? $status : "UPDATED";
                    } else {
                        $status = "GOOD";
                    }
                    renderRow($databaseArr[$keyArr[0]][1], $databaseArr[$keyArr[0]][2], $rateObj->mid, $status);
                } else {
                    $insert = "INSERT INTO Currency (name, currency_code, exchange_rate) VALUES ('$rateObj->currency', '$rateObj->code', $rateObj->mid)";
                    queryWithValidation($db,$insert);
                    $status = "INSERTED";
                    renderRow($rateObj->currency, $rateObj->code, $rateObj->mid, $status);
                }
            }
            $db->close();
        }
    ?>
    </table>
</main>