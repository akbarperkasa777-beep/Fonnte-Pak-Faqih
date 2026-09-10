<?php
require_once __DIR__ . '/functions/auth.php';
require_once __DIR__ . '/config/database.php';

requireUserLogin();

$stmt = $pdo->prepare('SELECT id, nama, email, no_hp, alamat, created_at FROM users WHERE id = :id');
$stmt->execute(['id' => $_SESSION['user_id']]);
$user = $stmt->fetch();

if (!$user) {
    header('Location: user-logout.php');
    exit;
}

$flash = $_GET['flash'] ?? '';
$flashType = $_GET['flash_type'] ?? 'failed';
$created = date('d M Y', strtotime($user['created_at']));
?>
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<title>Hapus Akun - API WhatsApp Fonnte</title>
<link rel="stylesheet" href="assets/css/style.css">
</head>
<body class="user-body">
<div class="user-shell">
  <aside class="sidebar">
    <div class="brand-wrap">
      <div class="brand-mark">W</div>
      <div>
        <div class="brand-title">API WhatsApp</div>
        <div class="brand-subtitle">Fonnte</div>
      </div>
    </div>

    <div class="profile-mini">
      <div class="avatar"><?= strtoupper(substr($user['nama'], 0, 1)) ?></div>
      <div>
        <strong><?= htmlspecialchars($user['nama']) ?></strong>
        <small><?= htmlspecialchars($user['email']) ?></small>
      </div>
    </div>

    <nav class="sidebar-nav">
      <a href="user-dashboard.php">
        <span>◉</span>
        Dashboard Siswa
      </a>
      <a href="user-data.php">
        <span>◌</span>
        Data User
      </a>
      <a href="user-log.php">
        <span>◫</span>
        Riwayat Log
      </a>
      <a href="user-delete-account.php" class="active">
        <span>⌫</span>
        Hapus Akun
      </a>
      <a href="user-logout.php">
        <span>↩</span>
        Logout
      </a>
    </nav>

    <div class="sidebar-card">
      <small>Keamanan</small>
      <strong>Proteksi aktif</strong>
      <span class="status-pill success">Verified</span>
    </div>
  </aside>

  <main class="user-main">
    <header class="topbar">
      <div>
        <p class="eyebrow">Pengaturan akun</p>
        <h1>Hapus Akun</h1>
      </div>
      <a href="user-dashboard.php" class="modern-btn secondary">Kembali</a>
    </header>

    <?php if ($flash): ?>
      <div class="alert <?= $flashType === 'success' ? 'success' : 'failed' ?>">
        <strong><?= htmlspecialchars($flash) ?></strong>
      </div>
    <?php endif; ?>

    <section class="settings-grid">
      <article class="panel form-panel">
        <div class="panel-header">
          <h3>Konfirmasi Penghapusan</h3>
          <span class="mini-tag danger">Perhatian</span>
        </div>

        <div class="alert failed" style="margin-bottom: 20px;">
          <strong>Perhatian:</strong> Menghapus akun akan menghapus data profil Anda secara permanen dan mengirimkan notifikasi ke WhatsApp Anda.
        </div>

        <form method="POST" action="api/user_delete_self.php" class="user-form">
          <input type="hidden" name="csrf_token" value="<?= csrfToken() ?>">

          <div class="form-grid">
            <div class="field full">
              <label>Nama</label>
              <input type="text" value="<?= htmlspecialchars($user['nama']) ?>" disabled>
            </div>

            <div class="field full">
              <label>Email</label>
              <input type="text" value="<?= htmlspecialchars($user['email']) ?>" disabled>
            </div>

            <div class="field full">
              <label>Masukkan Password Anda</label>
              <input type="password" name="password" placeholder="Password saat ini" required>
            </div>
          </div>

          <div class="form-actions modern-actions">
            <button type="submit" class="modern-btn primary submit-btn" style="background: linear-gradient(135deg, #ef4444, #dc2626);">Hapus Akun Saya</button>
          </div>
        </form>
      </article>

      <article class="panel panel-side">
        <div class="panel-header">
          <h3>Informasi Akun</h3>
          <span class="mini-tag">Ringkas</span>
        </div>

        <div class="account-box">
          <div class="account-row">
            <span>Nama</span>
            <strong><?= htmlspecialchars($user['nama']) ?></strong>
          </div>
          <div class="account-row">
            <span>Email</span>
            <strong><?= htmlspecialchars($user['email']) ?></strong>
          </div>
          <div class="account-row">
            <span>Nomor WA</span>
            <strong><?= htmlspecialchars($user['no_hp']) ?></strong>
          </div>
          <div class="account-row">
            <span>Terdaftar</span>
            <strong><?= htmlspecialchars($created) ?></strong>
          </div>
        </div>
      </article>
    </section>
  </main>
</div>
</body>
</html>
