<?php

header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
require_once "kapcsolat.php";

$path = $_GET["path"] ?? "";
$apiParts = explode("/", $path);

function filmek($conn)
{
    $sql = "SELECT filmek.id, filmek.cim, rendezok.nev, filmek.ev, filmek.mufaj, filmek.ertekeles, filmek.jatekido
    FROM filmek, rendezok 
    WHERE filmek.rendezo_id = rendezok.id";

    $result = mysqli_query($conn, $sql);

    $adatok = [];
    while ($sor = $result->fetch_assoc()) {
        $adatok[] = $sor;
    }
    return $adatok;
}

function filmId($conn, $id)
{
    $sql = "SELECT filmek.id, filmek.cim, rendezok.nev, rendezok.szuletesi_ev, rendezok.nemzetiseg, filmek.ev, filmek.mufaj, filmek.ertekeles, filmek.jatekido
    FROM filmek, rendezok 
    WHERE filmek.rendezo_id = rendezok.id
    AND filmek.id = " . $id;

    $result = $conn->query($sql);

    return $result->fetch_assoc();
}

function filmMufaj($conn, $mufaj)
{
    $sql = "SELECT filmek.id, filmek.cim, rendezok.nev, rendezok.szuletesi_ev, rendezok.nemzetiseg, filmek.ev, filmek.mufaj, filmek.ertekeles, filmek.jatekido
    FROM filmek, rendezok 
    WHERE filmek.rendezo_id = rendezok.id
    AND filmek.mufaj = '$mufaj'";

    $result = mysqli_query($conn, $sql);

    $adatok = [];
    while ($sor = $result->fetch_assoc()) {
        $adatok[] = $sor;
    }
    return $adatok;
}

function ujFilm($conn)
{
    $input = json_decode(file_get_contents("php://input"), true);

    $sql = "INSERT INTO filmek (cim) VALUES ('$input')";

    if (mysqli_query($conn, $sql)) {
        echo json_encode(["uzenet" => "Film sikeresen hozzaadva", "id" => ""]);
    }
}

if ($_SERVER["REQUEST_METHOD"] == "GET") {
    switch ($apiParts[0]) {
        case "filmek":
            if (!isset($apiParts[1]) || $apiParts[1] == "") {
                echo json_encode(filmek($conn));
            } elseif (is_numeric($apiParts[1])) {
                echo json_encode(filmId($conn, $apiParts[1]));
            } elseif (is_string($apiParts[1])) {
                echo json_encode(filmMufaj($conn, $apiParts[1]));
            }
        default:
            echo json_encode(["hiba" => "Ismeretlen metodus"]);
    }
} elseif ($_SERVER["REQUEST_METHOD"] == "POST") {
    switch ($apiParts[0]) {
        case "filmek":
            if ($apiParts[1] == "uj") {
            ujFilm($conn);
            }
        default:
            echo json_encode(["hiba" => "Ismeretlen metodus"]);
    }
}

?>