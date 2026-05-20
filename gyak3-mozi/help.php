<?php
$host="localhost";
$user="root";
$pass="";
$db="moziadatbazis";
$conn=new mysqli($host,$user,$pass,$db);

?>





<?php

header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
require_once "kapcsolat.php";

$path = $_GET["path"] ?? "";
$apiParts = explode("/", $path);

function filmek($conn){
    $sql="SELECT filmek.cim, filmek.mufaj, rendezok.nev  FROM filmek, rendezok 
    WHERE filmek.rendezo_id = rendezok.id";

    $result=$conn->query($sql);
    $adatok=[];
    while($sor=$result->fetch_assoc()){
        $adatok[]=$sor;
    }
    return $adatok;
}
function filmIdAlapjan($conn, $id)
{
    $sql = "SELECT filmek.*,
                   rendezok.nev,
                   rendezok.szuletesi_ev,
                   rendezok.nemzetiseg
            FROM filmek, rendezok
            WHERE filmek.rendezo_id = rendezok.id
            AND filmek.id = $id";

    $result = $conn->query($sql);

    return $result->fetch_assoc();
}
function mufaj($conn,$mufaj){
    $sql = "SELECT filmek.cim FROM filmek WHERE filmek.mufaj = '$mufaj'";

    $result = $conn->query($sql);
    $adatok=[];
    while($sor=$result->fetch_assoc()){
        $adatok[] = $sor;
    }
    return $adatok;
}

if($_SERVER["REQUEST_METHOD"]=="GET"){
    switch($apiParts[0]){
        case "filmek":
            if(!isset($apiParts[1]) || $apiParts[1] == ""){
                echo json_encode(filmek($conn));
            }
            elseif(is_numeric($apiParts[1])){
                echo json_encode(filmIdAlapjan($conn, $apiParts[1]));
            }
            elseif($apiParts[1] == "mufaj" && isset($apiParts[2])){
                echo json_encode(mufaj($conn,$apiParts[2]));
            }
            break;
    }
}


?>