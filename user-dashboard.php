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
$flashType = $_GET['flash_type'] ?? 'success';
$created = date('d M Y', strtotime($user['created_at']));
?>
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<title>Dashboard Saya - API WhatsApp Fonnte</title>
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
      <a href="user-dashboard.php" class="active">
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
      <a href="user-delete-account.php">
        <span>⌫</span>
        Hapus Akun
      </a>
      <a href="user-logout.php">
        <span>↩</span>
        Logout
      </a>
    </nav>

    <div class="sidebar-card">
      <small>Status Akun</small>
      <strong>Aktif</strong>
      <span class="status-pill success">Online</span>
    </div>
  </aside>

  <main class="user-main">
    <header class="topbar">
      <div>
        <p class="eyebrow">Selamat datang</p>
        <h1>Dashboard Siswa</h1>
      </div>
      <a href="user-data.php" class="modern-btn primary">Edit Profil</a>
    </header>

    <?php if ($flash): ?>
      <div class="alert <?= $flashType === 'success' ? 'success' : 'failed' ?>">
        <strong><?= htmlspecialchars($flash) ?></strong>
      </div>
    <?php endif; ?>

    <section class="welcome-card">
      <div>
        <p class="eyebrow accent">Halo, <?= htmlspecialchars($user['nama']) ?></p>
        <h2>Semangat bekerja hari ini!</h2>
        <p>Kelola profil, keamanan, dan informasi akun Anda dengan lebih mudah dan aman.</p>
      </div>
      <div class="welcome-badge">WhatsApp Ready</div>
    </section>

    <section class="stats-grid">
      <article class="stat-card stat-green">
        <span class="stat-label">Nama</span>
        <strong><?= htmlspecialchars($user['nama']) ?></strong>
      </article>
      <article class="stat-card stat-blue">
        <span class="stat-label">Email</span>
        <strong><?= htmlspecialchars($user['email']) ?></strong>
      </article>
      <article class="stat-card stat-purple">
        <span class="stat-label">Nomor WA</span>
        <strong><?= htmlspecialchars($user['no_hp']) ?></strong>
      </article>
      <article class="stat-card stat-orange">
        <span class="stat-label">Terdaftar</span>
        <strong><?= htmlspecialchars($created) ?></strong>
      </article>
    </section>

    <section class="content-grid">
      <article class="panel panel-info">
        <div class="panel-header">
          <h3>Informasi Akun</h3>
          <span class="mini-tag">Detail</span>
        </div>
        <div class="info-list">
          <div><span>Nama</span><strong><?= htmlspecialchars($user['nama']) ?></strong></div>
          <div><span>Email</span><strong><?= htmlspecialchars($user['email']) ?></strong></div>
          <div><span>Nomor WhatsApp</span><strong><?= htmlspecialchars($user['no_hp']) ?></strong></div>
          <div><span>Alamat</span><strong><?= htmlspecialchars($user['alamat']) ?></strong></div>
          <div><span>Terdaftar sejak</span><strong><?= htmlspecialchars($created) ?></strong></div>
        </div>
      </article>

      <article class="panel panel-quick">
        <div class="panel-header">
          <h3>Fitur</h3>
          <span class="mini-tag">Cepat</span>
        </div>
        <ul class="feature-list">
          <li>Kelola profil akun</li>
          <li>Ubah password aman</li>
          <li>Notifikasi WhatsApp otomatis</li>
          <li>Data akun tersimpan rapi</li>
        </ul>
      </article>
    </section>
  </main>
</div>
</body>
</html>
