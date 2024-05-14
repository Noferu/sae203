<?php

// Cette fonction récupère toutes les lignes résultant d'une requête SQL donnée et les retourne sous forme d'un tableau associatif.
function select_data(PDO $pdo, $sql, array $params = [], $fetchAll = true) {
    $query = $pdo->prepare($sql);

    // Nous allons utiliser un compteur pour garantir que les indices numériques pour bindValue commencent à 1
    $index = 1;
    foreach ($params as $key => $value) {
        // Déterminer si nous utilisons des indices numériques ou des clés nommées
        if (is_numeric($key)) {
            $query->bindValue($index++, $value);  // Utilise l'index numérique correct
        } else {
            $query->bindValue($key, $value);  // Utilise une clé nommée directement
        }
    }

    $query->execute();

    if ($fetchAll) {
        return $query->fetchAll(PDO::FETCH_ASSOC);
    } else {
        return $query->fetch(PDO::FETCH_ASSOC);
    }
}


// Récupère les données de manière paginée, ce qui est essentiel pour afficher de grandes quantités de données.
function select_paginated($pdo, $sql, $page, $items_per_page)
{
    // Point départ (fin de la page précédente)
    $offset = ($page - 1) * $items_per_page;
    $sql .= " LIMIT :offset, :items_per_page";
    $query = $pdo->prepare($sql);
    $query->bindValue(':offset', $offset, PDO::PARAM_INT);
    $query->bindValue(':items_per_page', $items_per_page, PDO::PARAM_INT);
    $query->execute();
    return $query->fetchAll(PDO::FETCH_ASSOC);
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

    return $query->execute();
}

function validateAndClean(array $data)
{
    $errors = [];
    $cleanData = [];

    foreach ($data as $key => $value) {
        // Nettoyage initial : suppression des espaces superflus et des balises HTML
        $value = trim(strip_tags($value));

        switch ($key) {
            case 'name':
                // Valide que le nom est alphabétique et autorise les espaces et tirets
                if (!preg_match("/^[a-zA-ZÀ-ÿ '-]+$/u", $value)) {
                    $errors[$key] = 'Le nom est invalide.';
                } else {
                    $cleanData[$key] = $value;
                }
                break;

            case 'email':
                // Valide que l'email est correct
                if (!filter_var($value, FILTER_VALIDATE_EMAIL)) {
                    $errors[$key] = 'L\'adresse email est invalide.';
                } else {
                    $cleanData[$key] = $value;
                }
                break;

            case 'phone':
                // Valide que le numéro de téléphone est correct (format international)
                if (!preg_match("/^\+?[1-9][0-9]{7,14}$/", $value)) {
                    $errors[$key] = 'Le numéro de téléphone est invalide.';
                } else {
                    $cleanData[$key] = $value;
                }
                break;

            case 'age':
                // Valide que l'âge est un nombre entier dans une fourchette raisonnable
                $value = filter_var($value, FILTER_VALIDATE_INT, [
                    'options' => ['min_range' => 1, 'max_range' => 120]
                ]);
                if ($value === false) {
                    $errors[$key] = 'L\'âge doit être un nombre entre 1 et 120.';
                } else {
                    $cleanData[$key] = $value;
                }
                break;

            default:
                // Pour tous les autres cas, les données sont simplement nettoyées sans validation spécifique
                $cleanData[$key] = $value;
                break;
        }
    }

    // Retourne un tableau avec les données nettoyées et un tableau d'erreurs s'il y en a
    if (!empty($errors)) {
        return ['errors' => $errors];
    }
    return ['data' => $cleanData];
}
