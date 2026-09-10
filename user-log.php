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

$logStmt = $pdo->prepare(
    'SELECT id, no_tujuan, pesan, status, response, created_at FROM log_whatsapp WHERE user_id = :user_id ORDER BY created_at DESC'
);
$logStmt->execute(['user_id' => $user['id']]);
$logs = $logStmt->fetchAll();

$created = date('d M Y', strtotime($user['created_at']));
?>
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<title>Riwayat Log - API WhatsApp Fonnte</title>
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
      <a href="user-log.php" class="active">
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
        <p class="eyebrow">Aktivitas</p>
        <h1>Riwayat Log</h1>
      </div>
      <a href="user-dashboard.php" class="modern-btn secondary">Kembali</a>
    </header>

    <section class="panel">
      <div class="panel-header">
        <h3>Log WhatsApp & Aktivitas Akun</h3>
        <span class="mini-tag">Histori</span>
      </div>

      <?php if (empty($logs)): ?>
        <div class="alert success">
          <strong>Belum ada log aktivitas yang tercatat.</strong>
        </div>
      <?php else: ?>
        <table class="data-table">
          <thead>
            <tr>
              <th>No</th>
              <th>Tujuan</th>
              <th>Status</th>
              <th>Pesan</th>
              <th>Tanggal</th>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($logs as $index => $log): ?>
              <tr>
                <td><?= $index + 1 ?></td>
                <td><?= htmlspecialchars($log['no_tujuan']) ?></td>
                <td>
                  <?php
                    $status = strtolower($log['status'] ?? 'pending');
                    $label = $status === 'success' ? 'Terkirim' : ($status === 'failed' ? 'Gagal' : 'Pending');
                    $class = $status === 'success' ? 'success' : ($status === 'failed' ? 'failed' : 'pending');
                  ?>
                  <span class="badge <?= $class ?>"><?= $label ?></span>
                </td>
                <td style="max-width: 420px; white-space: normal;"><?= nl2br(htmlspecialchars($log['pesan'])) ?></td>
                <td><?= htmlspecialchars($log['created_at']) ?></td>
              </tr>
            <?php endforeach; ?>
          </tbody>
        </table>
      <?php endif; ?>
    </section>
  </main>
</div>
</body>
</html>
