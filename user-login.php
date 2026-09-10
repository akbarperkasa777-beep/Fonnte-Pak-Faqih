<?php
require_once __DIR__ . '/functions/auth.php';
require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/functions/fonnte.php';

// Jika sudah login, langsung arahkan ke dashboard user
if (!empty($_SESSION['user_id'])) {
    header('Location: user-dashboard.php');
    exit;
}

$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email    = trim($_POST['email'] ?? '');
    $password = $_POST['password'] ?? '';

    if ($email === '' || $password === '') {
        $error = 'Email dan password wajib diisi.';
    } else {
        $stmt = $pdo->prepare('SELECT id, nama, email, no_hp, password FROM users WHERE email = :email LIMIT 1');
        $stmt->execute(['email' => $email]);
        $user = $stmt->fetch();

        if ($user && password_verify($password, $user['password'])) {
            // Regenerasi session id untuk mencegah session fixation
            session_regenerate_id(true);
            $_SESSION['user_id']    = $user['id'];
            $_SESSION['user_nama']  = $user['nama'];
            $_SESSION['user_email'] = $user['email'];

            $loginPesan = formatHeaderWa('Login berhasil')
                        . "Halo {$user['nama']},\n\n"
                        . "Kegiatan login akun Anda berhasil dilakukan pada sistem kami.\n\n"
                        . "📧 Email: {$user['email']}\n"
                        . "📱 Nomor WhatsApp: {$user['no_hp']}\n"
                        . "🕒 Status: Login berhasil\n\n"
                        . "Jika Anda merasa tidak melakukan login ini, segera hubungi administrator untuk keamanan akun Anda.";

            $hasilLoginWa = kirimWhatsApp($user['no_hp'], $loginPesan);

            $logStmt = $pdo->prepare(
                'INSERT INTO log_whatsapp (user_id, no_tujuan, pesan, status, response)
                 VALUES (:user_id, :no_tujuan, :pesan, :status, :response)'
            );
            $logStmt->execute([
                'user_id'   => $user['id'],
                'no_tujuan' => $user['no_hp'],
                'pesan'     => $loginPesan,
                'status'    => $hasilLoginWa['status'],
                'response'  => $hasilLoginWa['response'],
            ]);

            header('Location: user-dashboard.php');
            exit;
        }

        $error = 'Email atau password salah.';
    }
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<title>Login User - API WhatsApp Fonnte</title>
<link rel="stylesheet" href="assets/css/style.css">
</head>
<body class="login-body">
  <div class="login-shell">
    <div class="login-hero">
      <div class="brand-lockup">
        <div class="brand-mark">W</div>
        <div>
          <div class="brand-title">API WhatsApp</div>
          <div class="brand-subtitle">User Portal</div>
        </div>
      </div>

      <h1>Kelola profil Anda dengan cepat dan aman.</h1>
      <p>Masuk ke dashboard pengguna untuk melihat data diri, mengganti password, serta mengelola akun Anda dengan lebih mudah.</p>

      <ul class="hero-list">
        <li>Kelola profil dan alamat</li>
        <li>Ubah password dengan keamanan tambahan</li>
        <li>Akses dashboard personal Anda</li>
      </ul>
    </div>

    <div class="login-card">
      <div class="login-card-header">
        <span class="mini-tag admin-tag">User</span>
        <h2>Login</h2>
      </div>

      <?php if ($error): ?>
        <div class="alert failed"><strong><?= htmlspecialchars($error) ?></strong></div>
      <?php endif; ?>

      <div class="alert success auth-note">
        <strong>Catatan:</strong> login user pakai email. Login admin memakai username dan bisa masuk melalui <a href="login.php">halaman admin</a>.
      </div>

      <form method="POST" action="user-login.php" class="login-form">
        <label>Email</label>
        <input type="email" name="email" required autofocus placeholder="budi@gmail.com" value="<?= htmlspecialchars($_POST['email'] ?? '') ?>">

        <label>Password</label>
        <input type="password" name="password" required placeholder="Password">

        <button type="submit" class="modern-btn primary login-btn">Masuk</button>
      </form>

      <p class="switch-auth">Belum punya akun? <a href="index.html">Daftar di sini</a></p>
      <p class="switch-auth"><a href="login.php">Login admin</a></p>
    </div>
  </div>
</body>
</html>
