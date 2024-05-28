<?php

// Cette fonction récupère toutes les lignes résultant d'une requête SQL donnée et les retourne sous forme d'un tableau associatif.
function select_data(PDO $pdo, $sql, array $params = [], $multiple = true)
{
    $query = $pdo->prepare($sql);

    $index = 1;
    foreach ($params as $key => $value) {
        if (is_numeric($key)) {
            $query->bindValue($index++, $value);
        } else {
            $query->bindValue($key, $value);
        }
    }

    $query->execute();

    if ($multiple) {
        return $query->fetchAll(PDO::FETCH_ASSOC);
    } else {
        return $query->fetch(PDO::FETCH_ASSOC);
    }
}

// Met à jour les données dans une table selon des conditions spécifiées.
function update_data($pdo, $table, $data, $conditions)
{
    $setColumnsPlaceholders = [];
    foreach ($data as $key => $value) {
        $setColumnsPlaceholders[] = "$key = :$key";
    }
    $setString = implode(', ', $setColumnsPlaceholders);

    $conditionPart = [];
    foreach ($conditions as $key => $value) {
        $conditionPart[] = "$key = :$key";
    }
    $conditionString = implode(' AND ', $conditionPart);

    $sql = "UPDATE $table SET $setString WHERE $conditionString";
    $query = $pdo->prepare($sql);

    foreach ($data as $key => $value) {
        $query->bindValue(":$key", $value);
    }
    foreach ($conditions as $key => $value) {
        $query->bindValue(":$key", $value);
    }

    return $query->execute();
}

// Supprime les données d'une table selon des conditions spécifiées.
function delete_data($pdo, $table, $conditions)
{
    $conditionPart = [];
    foreach ($conditions as $key => $value) {
        $conditionPart[] = "$key = :$key";
    }
    $conditionString = implode(' AND ', $conditionPart);

    $sql = "DELETE FROM $table WHERE $conditionString";
    $query = $pdo->prepare($sql);

    foreach ($conditions as $key => $value) {
        $query->bindValue(":$key", $value);
    }

    return $query->execute();
}

// Insère de nouvelles données dans une table.
function insert_data($pdo, $table, $data)
{
    $keys = array_keys($data);
    $values = array_values($data);
    $placeholders = array_map(function ($key) {
        return ":$key";
    }, $keys);

    $sql = "INSERT INTO $table (" . implode(', ', $keys) . ") VALUES (" . implode(', ', $placeholders) . ")";
    $query = $pdo->prepare($sql);

    foreach ($data as $key => $value) {
        $query->bindValue(":$key", $value);
    }

    if ($query->execute()) {
        return $pdo->lastInsertId(); // Retourne l'ID de la dernière insertion
    }

    return false; // Retourne false si l'insertion échoue
}