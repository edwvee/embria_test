<?php
function parseEmailHost($email)
{
	return substr($email, strpos($email, '@') + 1);
}

function getMaxId($pdo)
{
	return $pdo->query("SELECT MAX(id) FROM users")
		->fetch(PDO::FETCH_NUM)[0];
}