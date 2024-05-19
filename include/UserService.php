<?php

namespace Services;

require_once('data_access.php');

class UserService
{
    private $pdo;

    // Constructeur pour initialiser la connexion PDO
    public function __construct($pdo)
    {
        $this->pdo = $pdo;
    }

    private $forbiddenWords = [
        'insulte', 'arabe de service', 'bamboula', 'bâtard', 'beauf', 'becky', 'blasphème',
        'blockleiter', 'boche', 'bounty', 'bras d\'honneur', 'cacouac', 'con', 'cunt',
        'doigt d\'honneur', 'enculé', 'enfoiré', 'ergi', 'fils de pute', 'fuck', 'gabacho',
        'grécoman', 'jiffs', 'karen', 'libelle', 'macronerie', 'mat', 'métèque', 'moskal',
        'motherfucker', 'nigger', 'navire de guerre russe, va te faire foutre', 'pédé', 'péquenaud',
        'peste brune', 'pétroleuse', 'plouc', 'polard', 'poubelles de l\'histoire', 'poutine est un con',
        'putain', 'putler', 'racaille', 'rastus', 'redneck', 'seven dirty words', 'social-fascisme',
        'social-traître', 'soldat-poney menteur à tête de chien', 'soy boy', 'squaw', 'ta mère', 'tchip',
        'wackes', 'white trash', 'yahoo', 'asshole', 'bastard', 'bitch', 'bollocks', 'bugger', 'choad',
        'chode', 'crap', 'crud', 'damn', 'darn', 'dick', 'douche', 'fag', 'faggot', 'goddamn', 'gook',
        'hell', 'homo', 'jerk', 'jizz', 'kike', 'lesbo', 'mick', 'nigga', 'piss', 'pussy', 'queer', 'shit',
        'slut', 'spic', 'tard', 'tits', 'twat', 'wanker', 'whore', 'wop', 'bimbo', 'coon', 'cracker', 'dike',
        'dyke', 'gash', 'gimp', 'heeb', 'jap', 'kyke', 'lez', 'lezzy', 'mofo', 'munter', 'niglet', 'paki', 'puss',
        'skank', 'skank', 'slapper', 'slutbag', 'spazz', 'tranny', 'trannie', 'turd', 'twink', 'wetback',
        'abortion', 'anus', 'arse', 'arsehole', 'ass', 'ballsack', 'balls', 'bastinado', 'bint', 'bitch', 'blowjob',
        'bollok', 'bollocks', 'bollox', 'bondage', 'boob', 'boobs', 'booobs', 'boooobs', 'booooobs', 'booooooobs',
        'breasts', 'buceta', 'bugger', 'bullshit', 'butt', 'butthole', 'buttplug', 'clitoris', 'clits', 'cock', 'coochie',
        'coochy', 'coon', 'cooter', 'cornhole', 'cum', 'cunt', 'dildo', 'doochbag', 'douchebag', 'dyke', 'enema',
        'fag', 'faggot', 'feces', 'felch', 'fellatio', 'feltch', 'foreskin', 'fuck', 'fudgepacker', 'fudge packer',
        'futanari', 'goddammit', 'goddamn', 'handjob', 'ho', 'hoe', 'homo', 'jerkoff', 'jizz', 'labia', 'muff',
        'nazi', 'nigga', 'nigger', 'niglet', 'nut sack', 'nutsack', 'orgasm', 'penis', 'piss', 'poop', 'prick',
        'pube', 'pussy', 'queaf', 'queef', 'quim', 'rimjob', 'rimming', 's hit', 'scrotum', 'semen', 'sex', 'shit',
        'shiz', 'skank', 'smegma', 'spic', 'spooge', 'twat', 'vagina', 'vajayjay', 'vulva', 'wank', 'wanker', 'whore',
        'assfucker', 'asshole', 'assfucker', 'asshole', 'ass-hat', 'assjacker', 'asslick', 'asslicker', 'assmonkey',
        'assmunch', 'assmuncher', 'assnigger', 'ass-pirate', 'assshit', 'assshole', 'asssucker', 'asswad', 'asswipe',
        'badfuck', 'ballfuck', 'buttfuck', 'camelfuck', 'clitfuck', 'clusterfuck', 'cockfuck', 'crackfuck', 'crapfuck',
        'cuntfuck', 'dickfuck', 'dickhead', 'douchefuck', 'dumbfuck', 'fartfuck', 'fatfuck', 'femfuck', 'fucker', 'fuckhead',
        'fuckhole', 'fucknuts', 'fuckoff', 'fucktard', 'fuckup', 'fuckwad', 'fuckwit', 'goatfuck', 'hellfuck', 'hornyfuck',
        'hotfuck', 'jackoff', 'jerkoff', 'jizfuck', 'kikefuck', 'lamefuck', 'lickfuck', 'meanfuck', 'mindfuck', 'mouthfuck',
        'nutfuck', 'pigfuck', 'prickfuck', 'shitfuck', 'shithead', 'shithole', 'shitlicker', 'shitsucker', 'slutfuck', 'smellfuck',
        'snowfuck', 'suckfuck', 'titfuck', 'twatfuck', 'weirdfuck', 'whorefuck', 'animalfucker', 'analasshole', 'analfuck',
        'assassfuck', 'asscrack', 'assfuck', 'assfucked', 'assfucker', 'assfucking', 'asshole', 'asslick', 'asslicker',
        'asswipe', 'bitchass', 'blackass', 'blowjob', 'buttfuck', 'buttfucker', 'buttfuckers', 'cameltoe', 'clitlick',
        'clitlicker', 'cockass', 'cocklick', 'cocklicker', 'cumfuck', 'cuntass', 'cuntlick', 'cuntlicker', 'darkass', 'dickass',
        'dicklick', 'dicklicker', 'dogass', 'dumbass', 'fatass', 'fuckass', 'fuckbutt', 'fuckcock', 'fuckhead', 'fuckhole',
        'fuckin', 'fucking', 'fuckoff', 'fuckstick', 'fucktard', 'fuckup', 'fuckwad', 'fuckwit', 'goatass', 'hardass',
        'hellass', 'hornyfuck', 'hotass', 'jackass', 'jackoff', 'jerkass', 'jerkoff', 'jizzfuck', 'lameass', 'lickass',
        'lickfuck', 'meanass', 'mindfuck', 'mouthfuck', 'nutass', 'nutfuck', 'oldass', 'pissfuck', 'shitass', 'shitfuck',
        'shithead', 'shithole', 'slutass', 'smellass', 'suckass', 'suckfuck', 'titass', 'titfuck', 'twatass', 'twatfuck',
        'weirdass', 'weirdfuck', 'whoreass', 'whorefuck'
    ];
    
    private $forbiddenChars = ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '+', '=', '{', '}', '[', ']', '|', '\\', ':', ';', '"', "'", '<', '>', ',', '?', '/', '`', '~'];

    // Valide les données d'inscription de l'utilisateur.
    public function validateRegistration($username, $email, $password)
    {
        if (!$email) {
            return 'Email invalide';
        }
        if (strlen($password) < 8) {
            return 'Le mot de passe doit contenir au moins 8 caractères';
        }
        // Vérification des mots interdits
        foreach ($this->forbiddenWords as $word) {
            if (stripos($username, $word) !== false) {
                return 'Le nom d\'utilisateur contient des mots interdits';
            }
        }
        // Vérification des caractères interdits
        foreach ($this->forbiddenChars as $char) {
            if (strpos($username, $char) !== false) {
                return 'Le nom d\'utilisateur contient des caractères interdits';
            }
        }
        return null;
    }

    // Vérifie si un utilisateur existe déjà dans la base de données
    public function userExists($username, $email)
    {
        $query = "SELECT * FROM users WHERE username = ? OR email = ?";
        return select_data($this->pdo, $query, [$username, $email], false);
    }

    // Enregistre un nouvel utilisateur dans la base de données
    public function registerUser($username, $email, $password)
    {
        $userData = [
            'username' => $username,
            'email' => $email,
            'password_hash' => password_hash($password, PASSWORD_DEFAULT),
            'created_at' => date('Y-m-d H:i:s'),
            'is_admin' => 0
        ];
        return insert_data($this->pdo, 'users', $userData);
    }

    // Gère la connexion de l'utilisateur
    public function loginUser($username, $password)
    {
        $query = "SELECT * FROM users WHERE username = ?";
        $user = select_data($this->pdo, $query, [$username], false);
        if ($user && password_verify($password, $user['password_hash'])) {
            return $user;
        }
        return false;
    }
}
