<?php

require_once('data_access.php');

class UserService
{
    private $pdo;

    // Constructeur pour initialiser la connexion PDO
    public function __construct($pdo)
    {
        $this->pdo = $pdo;
    }

    const FORBIDDEN_WORDS = [
        'abortion','abruti','analasshole','analfuck','andouille','animalfucker','anus','arabe','arschloch','arse','arsehole','ass','ass-hat','ass-pirate','assassfuck','asscrack','assfuck','assfucked','assfucker','assfucking','asshole','assjacker','asslick','asslicker','assmonkey','assmunch','assmuncher','assnigger','assshit','assshole','asssucker','asswad','asswipe','babaca','badfuck','baiseur','ballfuck','balls','ballsack','bamboula','bastard','bastardo','bastinado','batard','beauf','becky','bimbo','bint','bitch','bitchass','blackass','blasphème','blockleiter','blowjob','blödmann','boche','bollocks','bollok','bollox','bondage','boob','boobs','booobs','boooobs','booooobs','booooooobs','bordel','bouffon','bouffonne','bougnoul','bounty','bouseux','branleur','breasts','buceta','bugger','bullshit','burro','butt','buttfuck','buttfucker','buttfuckers','butthole','buttplug','bâtarde','béni-oui-oui','cabrón','cacouac','camelfuck','cameltoe','caralho','cazzo','chiant','chienne','chier','chieur','chiotte','choad','chode','clitfuck','clitlick','clitlicker','clitoris','clits','clodo','clusterfuck','cock','cockass','cockfuck','cocklick','cocklicker','coglione','con','conasse','connard','connasse','conne','connerie','coochie','coochy','coon','cooter','cornhole','couille','couillon','coño','cracker','crackfuck','crap','crapfuck','crud','crétin','cul','cum','cumfuck','cunt','cuntass','cuntfuck','cuntlick','cuntlicker','damn','darkass','darn','dick','dickass','dickfuck','dickhead','dicklick','dicklicker','dike','dildo','dogass','doochbag','douche','douchebag','douchefuck','dreckig','ducon','dumbass','dumbfuck','dumkopf','dummkopf','dyke','débile','déchet','dégénéré','emmerdant','enculé','enema','enflure','enfoiré','ergi','esclavagiste','escroc','estúpido','fag','faggot','fartfuck','fatass','fatfuck','faux-cul','feces','felch','fellatio','feltch','femfuck','fick','fiente','puta','fils de chien','foda-se','folle','foreskin','fottiti','fuck','fuckass','fuckbutt','fuckcock','fucker','fuckhead','fuckhole','fuckin','fucking','fucknuts','fuckoff','fuckstick','fucktard','fuckup','fuckwad','fuckwit','fudge packer','fudgepacker','futanari','gabacho','gash','gilipollas','gimp','goatass','goatfuck','goddammit','goddamn','gogol','gook','gouine','gros lard','grécoman','handjob','hardass','heeb','hell','hellass','hellfuck','hijo de puta','ho','hoe','homo','hornyfuck','hotass','hotfuck','hurensohn','idiot','idiota','imbécile','incapable','insulte','jackass','jackoff','jap','jean-foutre','jerk','jerkass','jerkoff','jiffs','jizfuck','jizz','jizzfuck','joder','karen','kike','kikefuck','kyke','labia','lameass','lamefuck','lavette','lesbo','lez','lezzy','libelle','lickass','lickfuck','lopette','macronerie','maricón','mat','meanass','meanfuck','merda','merde','mick','mierda','mindfuck','minus','miststück','mofo','mongol','morfal','morue','moskal','motherfucker','mouthfuck','muff','munter','métèque','navire de guerre russe, va te faire foutre','naze','nazi','nigga','nigger','niglet','nut sack','nutass','nutfuck','nutsack','nègre','oldass','ordure','orgasm','paki','paneleiro','pendejo','penis','peste brune','petit con','petite bite','pigfuck','piss','pissfuck','pissoir','plouc','polard','poop','poubelle','pouffiasse','pourri','poutine est un con','prick','prickfuck','profiteur','pube','puss','pussy','puta','putain','putasserie','pute','putler','puto','puttana','pédé','péquenaud','pétasse','pétroleuse','queaf','queef','queer','quim','racaille','raciste','raclure','rastus','raté','redneck','rimjob','rimming','s hit','salaud','salope','sans couilles','sans dents','saukerl','scheisse','scheisskopf','schlampe','scrotum','semen','seven dirty words','sex','shit','shitass','shitfuck','shithead','shithole','shitlicker','shitsucker','shiz','skank','slapper','slut','slutass','slutbag','slutfuck','smegma','smellass','smellfuck','snowfuck','social-fascisme','social-traître','soldat-poney menteur à tête de chien','soy boy','spazz','spic','spooge','squaw','stronzo','suckass','suckfuck','ta mère','ta race','tapette','tard','tarlouze','taré','tchip','testa di cazzo','titass','titfuck','tits','trannie','tranny','triso','trou du cul','turd','twat','twatass','twatfuck','twink','tête de con','tête de nœud','vaffanculo','vagina','vajayjay','vaurien','verdammt','vermine','vieux con','vulva','wackes','wank','wanker','weirdass','weirdfuck','wetback','white trash','whore','whoreass','whorefuck','wop','yahoo','zizi','zonzon','zut'
    ];

    const FORBIDDEN_CHARS = ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '+', '=', '{', '}', '[', ']', '|', '\\', ':', ';', '"', "'", '<', '>', ',', '?', '/', '`', '~'];

    // Valide les données d'inscription de l'utilisateur.
    public function validateRegistration($username, $email, $password, $confirmPassword)
    {
        if (!$email) {
            return 'Email invalide';
        }
        if (strlen($password) < 8) {
            return 'Le mot de passe doit contenir au moins 8 caractères';
        }

        // Vérification des mots interdits
        foreach (self::FORBIDDEN_WORDS as $word) {
            if (stripos($username, $word) !== false) {
                return 'Le nom d\'utilisateur contient des mots interdits';
            }
        }
        // Vérification des caractères interdits
        foreach (self::FORBIDDEN_CHARS as $char) {
            if (strpos($username, $char) !== false) {
                return 'Le nom d\'utilisateur contient des caractères interdits';
            }
        }

        if ($password !== $confirmPassword) {
            return 'Les mots de passe ne correspondent pas';
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

    // Met à jour le champ last_connected de l'utilisateur
    public function updateLastConnected($userId)
    {
        $data = ['last_connexion' => date('Y-m-d H:i:s')];
        $conditions = ['user_id' => $userId];
        return update_data($this->pdo, 'users', $data, $conditions);
    }

    public function addComment($articleId, $userId, $content, $rating)
    {
        $commentData = [
            'article_id' => $articleId,
            'user_id' => $userId,
            'content' => $content,
            'rating_score' => $rating,
            'created_at' => date('Y-m-d H:i:s')
        ];
        return insert_data($this->pdo, 'comments', $commentData);
    }

    public function deleteComment($comment_id)
    {
        return delete_data($this->pdo, 'comments', ['comment_id' => $comment_id]);
    }
}
