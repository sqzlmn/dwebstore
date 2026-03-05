<?php
session_start();

// 1. DATABASE CONNECTION
$host = 'localhost';
$db   = 'pkmndatabase2';
$user = 'root';
$pass = '';
$dsn  = "mysql:host=$host;dbname=$db;charset=utf8mb4";

try {
    $pdo = new PDO($dsn, $user, $pass, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ]);
} catch (PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}

// 2. LOGIC: LOGOUT
if (isset($_GET['action']) && $_GET['action'] === 'logout') {
    session_destroy();
    header("Location: index.php");
    exit;
}

// 3. LOGIC: LOGIN
$error = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['login'])) {
    $email = $_POST['email'];
    $password = $_POST['password'];

    $stmt = $pdo->prepare("SELECT * FROM member WHERE email = ?");
    $stmt->execute([$email]);
    $member = $stmt->fetch();

    // Checking against your specific SQL dump plain-text passwords
    if ($member && $password === $member['password']) {
        $_SESSION['user_id'] = $member['id'];
        $_SESSION['name'] = $member['forename'];
    } else {
        $error = "Invalid Trainer credentials!";
    }
}

// 4. DATA FETCHING
$categories = $pdo->query("SELECT * FROM category WHERE navigation = 1")->fetchAll();
$category_filter = isset($_GET['cat']) ? (int)$_GET['cat'] : null;

if ($category_filter) {
    $stmt = $pdo->prepare("SELECT a.*, i.file, i.alt FROM article a LEFT JOIN image i ON a.image_id = i.id WHERE a.category_id = ?");
    $stmt->execute([$category_filter]);
    $cards = $stmt->fetchAll();
} else {
    $cards = $pdo->query("SELECT a.*, i.file, i.alt FROM article a LEFT JOIN image i ON a.image_id = i.id")->fetchAll();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>PokeMart | Trainer Card Shop</title>
    <style>
        :root {
            --pk-blue: #3B4CCA;
            --pk-yellow: #FFCB05;
            --pk-red: #FF0000;
            --pk-dark-blue: #2A75BB;
        }

        body { font-family: 'Arial', sans-serif; margin: 0; background-color: #f0f0f0; }
        
        /* HEADER & LOGO */
        header { 
            background: var(--pk-red); 
            padding: 20px; 
            color: white; 
            display: flex; 
            justify-content: space-between; 
            align-items: center;
            border-bottom: 5px solid var(--pk-blue);
        }
        .logo-text { 
            font-size: 2rem; 
            font-weight: bold; 
            color: var(--pk-yellow); 
            text-shadow: 3px 3px var(--pk-blue);
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        /* NAVIGATION */
        nav { background: var(--pk-blue); padding: 10px; text-align: center; }
        nav a { color: white; margin: 0 15px; text-decoration: none; font-weight: bold; font-size: 0.9rem; }
        nav a:hover { color: var(--pk-yellow); }

        /* LOGIN FORM */
        .login-container { max-width: 400px; margin: 100px auto; background: white; padding: 30px; border-radius: 15px; border: 4px solid var(--pk-yellow); box-shadow: 0 10px 20px rgba(0,0,0,0.2); }
        .login-container h2 { color: var(--pk-blue); text-align: center; }
        input { width: 100%; padding: 12px; margin: 10px 0; border: 2px solid #ddd; border-radius: 5px; box-sizing: border-box; }
        .btn-login { width: 100%; padding: 12px; background: var(--pk-blue); color: white; border: none; border-radius: 5px; cursor: pointer; font-weight: bold; }

        /* CARD GRID */
        .container { padding: 40px; display: grid; grid-template-columns: repeat(auto-fill, minmax(220px, 1fr)); gap: 30px; }
        .card { 
            background: white; 
            border-radius: 15px; 
            overflow: hidden; 
            transition: transform 0.2s; 
            border: 1px solid #ddd; 
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            position: relative;
        }
        .card:hover { transform: translateY(-10px); border-color: var(--pk-blue); }
        .card img { width: 100%; height: 250px; object-fit: contain; background: #fafafa; padding: 10px; box-sizing: border-box;}
        .card-info { padding: 15px; text-align: center; }
        .card-title { font-weight: bold; color: var(--pk-blue); margin-bottom: 5px; display: block; }
        .card-summary { font-size: 0.85rem; color: #666; height: 40px; overflow: hidden; }
        
        .badge { background: var(--pk-yellow); color: var(--pk-blue); padding: 5px 10px; border-radius: 20px; font-size: 0.7rem; font-weight: bold; position: absolute; top: 10px; right: 10px; }
    </style>
</head>
<body>

<header>
    <div class="logo-text">POKÉMART</div>
    <div>
        <?php if (isset($_SESSION['user_id'])): ?>
            <span>Welcome, <strong><?= htmlspecialchars($_SESSION['name']) ?></strong></span>
            <a href="?action=logout" style="margin-left:15px; color:white;">Logout</a>
        <?php endif; ?>
    </div>
</header>

<?php if (!isset($_SESSION['user_id'])): ?>
    <div class="login-container">
        <h2>Trainer Access</h2>
        <?php if ($error): ?> <p style="color:red; text-align:center;"><?= $error ?></p> <?php endif; ?>
        <form method="POST">
            <input type="email" name="email" placeholder="Email (e.g. red@eg.link)" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit" name="login" class="btn-login">ENTER STORE</button>
        </form>
    </div>
<?php else: ?>
    <nav>
        <a href="index.php">ALL CARDS</a>
        <?php foreach ($categories as $cat): ?>
            <a href="?cat=<?= $cat['id'] ?>"><?= strtoupper($cat['name']) ?></a>
        <?php endforeach; ?>
    </nav>

    <div class="container">
        <?php if (empty($cards)): ?>
            <p>No cards found in this tall grass...</p>
        <?php else: ?>
            <?php foreach ($cards as $card): ?>
                <div class="card">
                    <span class="badge">#<?= $card['id'] ?></span>
                    <img src="<?= htmlspecialchars($card['file']) ?>" alt="<?= htmlspecialchars($card['alt']) ?>">
                    <div class="card-info">
                        <span class="card-title"><?= htmlspecialchars($card['title']) ?></span>
                        <p class="card-summary"><?= htmlspecialchars($card['summary']) ?></p>
                    </div>
                </div>
            <?php endforeach; ?>
        <?php endif; ?>
    </div>
<?php endif; ?>

</body>
</html>