<?php
/*
Несколько допущений:
1. Все емейлы корректны
2. У пользователя не может быть больше 1 емейла для домена
3. Полученные данные не представляют правдивой картины на начало 
    или конец обработки, так как согласно условиям это невозможно.
*/

require_once 'functions.php';
require_once 'connection.php';

const PACKAGE_SIZE = 1000;

try{
    $pdo = new PDO("mysql:host=$host;dbname=$db", $user, $password);
} catch(PDOException  $e){
    echo $e->getMessage();
}   
$group_concat_max_len = (1024+1)*PACKAGE_SIZE;
$pdo->exec("SET group_concat_max_len = $group_concat_max_len");

$hostsCount = [];
$maxId = getMaxId($pdo);
$query = "SELECT GROUP_CONCAT(email) FROM users
    WHERE email <> '' and id >= :idFrom and id < :idTo";
$stmt = $pdo->prepare($query);
    
for ($i = 1; $i <= $maxId; $i += PACKAGE_SIZE)
{
    $stmt->execute([':idFrom' => $i, ':idTo' => $i + PACKAGE_SIZE]);
    $row = $stmt->fetch(PDO::FETCH_NUM);
    
    $emails = explode(',', $row[0]);
    foreach($emails as $email)
    {
        $host = parseEmailHost($email);
        if (isset($hostsCount[$host]))
            $hostsCount[$host]++;
        else
            $hostsCount[$host] = 1;
    }
}

var_dump($hostsCount);